create or replace package body pck_apex_export as

  ------------------------------------------------------------------------------
  -- write_clob_to_file
  --
  procedure write_clob_to_file(
    i_clob      in clob
  , i_file_name in varchar2
  , i_ora_dir   in varchar2
  ) is
    v_clob_length number;
    v_start       number := 1;
    v_byte_length number := 32000;
    v_buffer      varchar2(32767);
    v_output      utl_file.file_type;
  begin
    v_clob_length := dbms_lob.getlength(i_clob);

    v_output := utl_file.fopen(upper(i_ora_dir)
                             , i_file_name
                             , 'w'
                             , 32760);
   
    while v_start < v_clob_length loop
      utl_file.put(v_output, dbms_lob.substr(i_clob, v_byte_length, v_start)); 
      utl_file.fflush(v_output); 
      v_start := v_start + v_byte_length;
    end loop;

    utl_file.new_line(v_output); 
    utl_file.fclose(v_output);
    
  exception
    when others then
      if utl_file.is_open(v_output) then
        utl_file.fclose(v_output);
      end if;
      raise;
  end write_clob_to_file;
  
  ------------------------------------------------------------------------------
  -- export_workspace
  --
  procedure export_workspace(
    i_workspace_id     in number
  , i_ora_dir          in varchar2
  , i_include_team_dev in boolean default false
  ) is
    v_clob      clob;
    v_file_name varchar2(255);
  begin
    -- set the apex_application.g_user global variable...
    -- the username you use as argument needs admin privileges in the workspace
    apex_custom_auth.set_user('ADMIN');
    
    v_file_name := 'workspace_' || i_workspace_id || '.sql';
   
    v_clob := wwv_flow_utilities.export_workspace_to_clob(
                p_workspace_id             => i_workspace_id
              , p_include_team_development => i_include_team_dev);
   
    write_clob_to_file(v_clob, v_file_name, i_ora_dir);
    
  exception
    when others then
      raise;
  end export_workspace;
  
  ------------------------------------------------------------------------------
  -- export_app
  --
  procedure export_app(
    i_app_id          in number
  , i_ora_dir         in varchar2
  , i_exp_ir_pub_rep  in varchar2 default 'N'
  , i_exp_ir_priv_rep in varchar2 default 'N'
  , i_exp_ir_notif    in varchar2 default 'N'
  ) is
    v_clob      clob;
    v_file_name varchar2(255);
  begin
    v_file_name := 'f'||i_app_id||'.sql';
    
    apex_custom_auth.set_user('ADMIN');
    
    v_clob := wwv_flow_utilities.export_application_to_clob(
                p_application_id            => i_app_id
              , p_export_ir_public_reports  => i_exp_ir_pub_rep
              , p_export_ir_private_reports => i_exp_ir_priv_rep
              , p_export_ir_notifications   => i_exp_ir_notif);
    
    write_clob_to_file(v_clob, v_file_name, i_ora_dir);
    
  exception
    when others then
      raise;
  end export_app;
  
  ------------------------------------------------------------------------------
  -- export_app_page
  --
  procedure export_app_page(
    i_app_id  in number
  , i_page_id in number
  , i_ora_dir in varchar2
  ) is
    v_clob      clob;
    v_file_name varchar2(255);
  begin
    v_file_name := 'f' || i_app_id || '_p' || lpad(i_page_id, 5, '0') || '_export.sql';
   
    v_clob := wwv_flow_utilities.export_page_to_clob(
                p_application_id => i_app_id
              , p_page_id        => i_page_id);
   
    write_clob_to_file(v_clob, v_file_name, i_ora_dir);
    
  exception
    when others then
      raise;
  end export_app_page;
  
  function find_security_group_id(i_workspace in varchar2) return number is
    v_ret number;
  begin
    select workspace_id
      into v_ret
      from apex_workspaces
     where workspace = i_workspace;
     
    return v_ret;
  end find_security_group_id;
  
  ------------------------------------------------------------------------------
  -- exports Apex application components
  --
  procedure export(
    i_workspace    in varchar2
  , i_app_id       in number   default null
  , i_page_id      in varchar2 default null
  , i_component    in varchar2 default null 
  , i_component_id in number   default null 
  , i_ora_dir      in varchar2 default 'APEX_EXPORT'
  , i_file_name    in varchar2 default null
  ) is
    v_out_buf       htp.htbuf_arr;
    v_out_row_count number := 99999999;
    v_line          varchar2(32767);
    v_owa_params    owa.vc_arr;
    v_output_file   utl_file.file_type;
    v_file_name     varchar2(250);
    v_sgid          number;
  BEGIN
    v_sgid := apex_util.find_security_group_id(i_workspace);
    
    apex_util.set_security_group_id(v_sgid);
    
    if i_workspace is not null and i_app_id is null and i_page_id is null and i_component_id is null then
      -- EXPORT WORKSPACE
      export_workspace(v_sgid, i_ora_dir);
    else
      -- EXPORT COMPONENT
      owa.init_cgi_env(v_owa_params);
      
      -- fix for navigation menu component import 
      if i_app_id is not null then
        sys.htp.p('');
        sys.htp.p('begin');
        sys.htp.p('wwv_flow_api.import_begin (');
        sys.htp.p(' p_version_yyyy_mm_dd=>''2016.08.24''');
        sys.htp.p(',p_release=>''5.1.1.00.08''');
        sys.htp.p(',p_default_workspace_id=>'||v_sgid);
        sys.htp.p(',p_default_application_id=>'||i_app_id);
        sys.htp.p(',p_default_owner=>''HROUG'');');
        sys.htp.p('');
        sys.htp.p('end;');
        sys.htp.p('/');
        sys.htp.p('');
        sys.htp.p('begin');
        sys.htp.p('  wwv_flow_api.g_mode := ''REPLACE'';');
        sys.htp.p('end;');
        sys.htp.p('/');
        sys.htp.p('');
      end if;
      
      apex_180200.wwv_flow_gen_api2.export(
        p_flow_id                   => i_app_id       -- in number
       ,p_page_id                   => null           -- in number   default null,
       ,p_format                    => 'DOS'          -- in varchar2 default 'UNIX',
       ,p_commit                    => 'YES'          -- in varchar2 default 'YES',
       ,p_owner_override            => null           -- in varchar2 default null,
       ,p_build_status_override     => 'NO'           -- in varchar2 default 'NO',
       ,p_flashback_min_ago         => null           -- in number   default null,
       ,p_file_id                   => null           -- in number   default null,
       ,p_export_comments           => 'Y'            -- in varchar2 default 'N',
       ,p_export_ir_public_reports  => 'Y'            -- in varchar2 default 'N',
       ,p_export_ir_private_reports => 'N'            -- in varchar2 default 'N',
       ,p_export_ir_notifications   => 'Y'            -- in varchar2 default 'N',
       ,p_export_translations       => 'Y'            -- in varchar2 default 'N',
       ,p_debugging_override        => null           -- in number   default null,
       ,p_component                 => i_component    -- in varchar2 default null,
       ,p_component_id              => i_component_id -- in number   default null
      );
    
      apex_180200.wwv_flow_gen_api2.file_close(p_commit => true, p_is_component_export => true);
            
      -- Get Export into buffer
      owa.get_page(v_out_buf, v_out_row_count);

      v_file_name := i_file_name;
      
      if v_file_name is null then
        v_file_name := rtrim('f'||i_app_id||'_'||lower(replace(i_component, ' ', '_'))||'_'||i_component_id, '_')||'.sql';
      end if;
      v_output_file := utl_file.fopen(upper(i_ora_dir), v_file_name, 'wb', 32767);

      -- Add into actual file
      for idx in 1 .. v_out_row_count
      loop
        if v_out_buf(idx) not like 'Content-%' then -- Skip MIME Header
          v_line := utl_raw.cast_to_raw(v_out_buf(idx));
          utl_file.put_raw(v_output_file, v_line, true);
        end if;
      end loop;

      utl_file.fclose(v_output_file);
    end if;
  exception
    when others then
      if utl_file.is_open(v_output_file) then
        utl_file.fclose(v_output_file);
      end if;
      raise;
  end export;
  
end pck_apex_export;
/
