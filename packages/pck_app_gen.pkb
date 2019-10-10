/*
@author:  Daniel Huha
@created: 2018
@desc:    APEX Application Generator
@license: free to use and modify, just credit the @author 
*/
create or replace package body pck_app_gen as
  
  nl varchar2(1) := chr(10);
  tb varchar2(1) := chr(9);

  pkg_body      varchar2(16) := 'BODY';
  pkg_spec      varchar2(16) := 'SPEC';
  t_create      varchar2(4000);
  t_show_spec   varchar2(255);
  t_hide_spec   varchar2(255);
  t_show_body   varchar2(255);
  t_hide_body   varchar2(255);
  t_down_spec   varchar2(255);
  t_down_body   varchar2(255);
  t_subprogram  varchar2(255);
  t_description varchar2(255);
  t_desc1       varchar2(4000);
  t_desc2       varchar2(4000);
  t_desc3       varchar2(4000);
  t_desc4       varchar2(4000);
  t_comment     varchar2(4000);
  c_pad_length  constant number := 30;
  c_edit_image     constant varchar2(255) := '<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="Edit">';
  c_parsing_schema constant varchar2(30) := 'DEMO1';
  
  type table_list_type is table of varchar2(256) index by binary_integer;
  type t_created_objects_rec is record (object_type varchar2(50), object_name varchar2(50));
  type t_created_objects_tab is table of t_created_objects_rec index by pls_integer;
  m_created_objects_tab t_created_objects_tab;
  
  m_debug boolean := true;
  
  ------------------------------------------------------------------------------------------------------------------------------
  -- procedure wrapper for debugging
  --
  procedure lg(i_message in varchar2) is
  begin
    if m_debug then
      l(i_message);
    end if;
  end lg;
  
  ------------------------------------------------------------------------------------------------------------------------------
  -- procedure wrapper for error logging
  --
  procedure lge(i_message in varchar2) is
  begin
    l(i_message);
  end lge;
  
  ------------------------------------------------------------------------------------------------------------------------------
  -- procedure adds created object to global mem. table
  --
  procedure add_created_object(i_object_type in varchar2, i_object_name in varchar2) is
    v_idx pls_integer;
  begin
    v_idx := m_created_objects_tab.count;
    m_created_objects_tab(v_idx).object_type := i_object_type;
    m_created_objects_tab(v_idx).object_name := i_object_name;
  end add_created_object;
  
  ------------------------------------------------------------------------------------------------------------------------------
  -- function returns Primary Key column for given table
  -- 
  function get_pk_column(i_table_name in varchar2) return varchar2 is
    v_ret varchar2(200);
  begin
    begin
      select cc.column_name pk_column
        into v_ret
        from user_tables t
            ,all_tab_comments c
            ,user_cons_columns cc
            ,all_constraints con
       where t.table_name = upper(i_table_name)
         and c.table_name = t.table_name
         and cc.table_name = c.table_name
         and con.constraint_name = cc.constraint_name
         and con.constraint_type = 'P';
       
    exception
      when others then
        v_ret := 'ROWID';
    end;
        
    return v_ret;
  end get_pk_column;
  
  ------------------------------------------------------------------------------------------------------------------------------
  -- procedure removes application from APEX Builder
  --
  procedure remove_application(i_app_id in number) is
  begin
    for rec in (select application_id, workspace from apex_applications where application_id = i_app_id and workspace != 'INTERNAL')
    loop
      apex_util.set_workspace(p_workspace => rec.workspace);
      apex_180200.wwv_flow_api.remove_application (p_application_id => rec.application_id);
    end loop;
  end remove_application;
  
  ------------------------------------------------------------------------------------------------------------------------------
  -- procedure drops tables from comma delimited input list
  --
  procedure drop_tables(i_tables in varchar2) is
    v_tab_arr apex_application_global.vc_arr2;
  begin
    v_tab_arr := apex_util.string_to_table(i_tables, ':');
    if v_tab_arr.count > 0 then
      for i in 1..v_tab_arr.count
      loop
        begin
          execute immediate 'drop table '||v_tab_arr(i);
        exception
          when others then
            lg('Error while dropping table '||v_tab_arr(i)||': '||sqlerrm);
        end;
      end loop;
    end if;
  exception
    when others then
      lge('drop_tables('||i_tables||'):'||sqlerrm);
  end drop_tables;
  
  ------------------------------------------------------------------------------------------------------------------------------
  -- procedure runs DDL and returns delimited list of created tables
  --
  procedure run_sql(i_sql in varchar2, o_tables out varchar2) is
    v_arr  apex_application_global.vc_arr2;
    v_sql  varchar2(4000);
    v_tabs varchar2(4000);
  begin
    v_arr := apex_util.string_to_table(i_sql, ';');
    
    lg('v_arr.COUNT='||v_arr.count);
    
    for i in 1..v_arr.count
    loop
      v_sql := lower(replace(replace(v_arr(i), chr(10), ''), chr(13)));
      
      if length(v_sql) > 1 then
        v_tabs := v_tabs||':'||trim(REGEXP_SUBSTR (v_sql,
                        '\create table([^(]+)',
                        1,
                        1,
                        NULL,
                        1));
        lg('execute immediate '||v_sql);                        
        execute immediate v_sql;
      end if;
    end loop;
    o_tables := upper(trim(both ':' from v_tabs));
  exception
    when others then
      lge('Error while executing v_sql='||v_sql||'; '||sqlerrm||', '||DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
      raise_application_error(-20000, 'Error while executing code: '||sqlerrm);
  end run_sql;
  
  ------------------------------------------------------------------------------------------------------------------------------
  -- procedure writes input clob to directory
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

  ------------------------------------------------------------------------------------------------------------------------------
  -- function returns API code, taken from WWV_FLOW_WIZARD_API
  --
  FUNCTION GENERATE_CODE(
    P_APP_NAME VARCHAR2
  , P_TABLE_LIST TABLE_LIST_TYPE
  , P_OWNER VARCHAR2
  , P_TYPE VARCHAR2
  ) RETURN SYS.DBMS_SQL.VARCHAR2A IS
    C SYS.DBMS_SQL.VARCHAR2A;
    L_APP_NAME VARCHAR2(255);
    L_ARG_NAME VARCHAR2(255);
    L_DATATYPE VARCHAR2(255);
    L_DEFAULT  VARCHAR2(255);
    L_PK_COND  VARCHAR2(255);
    L_PK_LIST  VARCHAR2(255);
    L_PAD NUMBER;
  BEGIN
    L_APP_NAME := SUBSTR(P_APP_NAME,1,30);
    IF NVL(WWV_FLOW.G_TRANSLATED_FLOW_ID,WWV_FLOW.G_FLOW_ID) = WWV_FLOW.G_FLOW_ID THEN
        T_COMMENT := '-- table API for application '||L_APP_NAME||', generated '||TO_CHAR(SYSDATE, 'DD-MON-YYYY');
    ELSE
        T_COMMENT := WWV_FLOW_LANG.SYSTEM_MESSAGE('wwv_flow_generate_table_api.t_comment',L_APP_NAME,TO_CHAR(SYSDATE, 'DD-MON-YYYY'));
    END IF;

    C(1)  := T_COMMENT;

    IF P_TYPE = PKG_BODY THEN
      C(C.COUNT+1)  := WWV_FLOW_LANG.SYSTEM_MESSAGE('wwv_flow_generate_table_api.t_pkg_body_comment');
      C(C.COUNT+1)  := '-- ';
      C(C.COUNT+1)  := '   ';
      C(C.COUNT+1)  := 'create or replace package body '||L_APP_NAME||' is';
    ELSE
      C(C.COUNT+1)  := WWV_FLOW_LANG.SYSTEM_MESSAGE('wwv_flow_generate_table_api.t_pkg_spec_comment');
      C(C.COUNT+1)  := '-- ';
      C(C.COUNT+1)  := '   ';
      C(C.COUNT+1)  := 'create or replace package '||L_APP_NAME||' is';
    END IF;

    FOR I IN 1..P_TABLE_LIST.COUNT LOOP
      SELECT MAX(LENGTH(COLUMN_NAME))+4 INTO L_PAD FROM user_tab_columns WHERE TABLE_NAME = P_TABLE_LIST(I)
      --AND OWNER = P_OWNER
      ;
      IF L_PAD<12 THEN
        L_PAD:=12;
      END IF;
      C(C.COUNT+1)  := '';
      C(C.COUNT+1)  := '--------------------------------------------------------------';
      C(C.COUNT+1)  := WWV_FLOW_LANG.SYSTEM_MESSAGE('wwv_flow_generate_table_api.t_table_create_comment',P_TABLE_LIST(I));
      C(C.COUNT+1)  := '';
      C(C.COUNT+1)  := '   procedure "INS_'||SUBSTR(P_TABLE_LIST(I),1,26)||'" (';

      FOR C1 IN (
        SELECT COLUMN_NAME, REGEXP_REPLACE(DATA_TYPE,'\(([^\)]+)\)',NULL) DATA_TYPE, DATA_DEFAULT, DEFAULT_LENGTH, NULLABLE FROM user_tab_columns WHERE TABLE_NAME = P_TABLE_LIST(I)
        --AND OWNER = P_OWNER
        ORDER BY COLUMN_ID
      ) LOOP
        L_ARG_NAME := C1.COLUMN_NAME;
        IF LENGTH(L_ARG_NAME)<28 THEN
          L_ARG_NAME := '"P_'||L_ARG_NAME||'"';
        ELSE
          L_ARG_NAME := '"'||L_ARG_NAME||'"';
        END IF;

        IF (C1.DATA_DEFAULT IS NOT NULL) THEN
          IF C1.DATA_TYPE IN ('VARCHAR2','NUMBER') AND C1.DEFAULT_LENGTH <= 236 THEN
            FOR C2 IN (
                SELECT DATA_DEFAULT FROM user_tab_columns
                WHERE  TABLE_NAME = P_TABLE_LIST(I)
                --AND    OWNER =  P_OWNER
                AND    COLUMN_NAME =  C1.COLUMN_NAME
            ) LOOP
            L_DEFAULT := ' default '''||REPLACE(C2.DATA_DEFAULT,'''','''''')||'''';
            END LOOP;
          ELSE
            L_DEFAULT := ' default null';
          END IF;
        ELSE
          IF C1.NULLABLE = 'Y' THEN
            L_DEFAULT := ' default null';
          ELSE
            L_DEFAULT := NULL;
          END IF;
        END IF;
        C(C.COUNT+1)  := RTRIM('      '||RPAD(L_ARG_NAME, L_PAD,' ')||' in '||LOWER(RPAD(C1.DATA_TYPE,C_PAD_LENGTH,' '))||' '||L_DEFAULT)||',';
      END LOOP;

      C(C.COUNT) := SUBSTR(C(C.COUNT),1,LENGTH(C(C.COUNT))-1);
      IF P_TYPE = PKG_BODY THEN
        C(C.COUNT+1)  := '   ) is ';
        C(C.COUNT+1)  := ' ';
        C(C.COUNT+1)  := '   begin';
        C(C.COUNT+1)  := ' ';
        C(C.COUNT+1)  := '      insert into "'||P_TABLE_LIST(I)||'" (';
        FOR C2 IN (
          SELECT * FROM user_tab_columns WHERE  TABLE_NAME = P_TABLE_LIST(I)
          --AND OWNER = P_OWNER
          ORDER BY COLUMN_ID
        ) LOOP
          C(C.COUNT+1)  := '         "'||C2.COLUMN_NAME||'",';
        END LOOP;
        C(C.COUNT) := SUBSTR(C(C.COUNT),1,LENGTH(C(C.COUNT))-1);
        C(C.COUNT+1)  := '      ) values ( ';
        FOR C2 IN (
          SELECT * FROM user_tab_columns WHERE  TABLE_NAME = P_TABLE_LIST(I)
          --AND OWNER = P_OWNER
          ORDER BY COLUMN_ID
        ) LOOP
          L_ARG_NAME := C2.COLUMN_NAME;
          IF LENGTH(L_ARG_NAME)<28 THEN
            L_ARG_NAME := '"P_'||L_ARG_NAME||'"';
          ELSE
            L_ARG_NAME := '"'||L_ARG_NAME||'"';
          END IF;
          C(C.COUNT+1)  := '         '||L_ARG_NAME||',';
        END LOOP;
        C(C.COUNT) := SUBSTR(C(C.COUNT),1,LENGTH(C(C.COUNT))-1);
        C(C.COUNT+1)  := '      );';
        C(C.COUNT+1)  := ' ';
        C(C.COUNT+1)  := '   end "INS_'||SUBSTR(P_TABLE_LIST(I),1,26)||'";';
      ELSE
        C(C.COUNT+1)  := '   );';
      END IF;
      C(C.COUNT+1)  := '';

      L_PK_LIST := '';

      FOR C_COND IN (
        SELECT CL.COLUMN_NAME, CL.POSITION
        FROM   user_CONS_COLUMNS CL, user_CONSTRAINTS CN
        WHERE  CN.TABLE_NAME = P_TABLE_LIST(I)
        AND    CN.CONSTRAINT_NAME = CL.CONSTRAINT_NAME
        AND    CN.CONSTRAINT_TYPE = 'P'
        --AND    CN.OWNER = P_OWNER
        --AND    CL.OWNER = P_OWNER
        ORDER BY CL.POSITION
      ) LOOP

        L_ARG_NAME := C_COND.COLUMN_NAME;
        IF LENGTH(L_ARG_NAME)<28 THEN
          L_ARG_NAME := '"P_'||L_ARG_NAME||'"';
        END IF;

        SELECT DATA_TYPE INTO L_DATATYPE FROM user_tab_columns WHERE TABLE_NAME  = P_TABLE_LIST(I) AND COLUMN_NAME = C_COND.COLUMN_NAME
        --AND OWNER = P_OWNER
        ;

        L_PK_LIST := L_PK_LIST || RTRIM(L_ARG_NAME||' in '||LOWER(L_DATATYPE))||',';

        IF (C_COND.POSITION = 1) THEN
          L_PK_COND := 'where "'||C_COND.COLUMN_NAME||'" = '||L_ARG_NAME||'';
        ELSE
          L_PK_COND := L_PK_COND || ' and "'||(C_COND.COLUMN_NAME)||'" = '||L_ARG_NAME;
        END IF;

      END LOOP;

      L_PK_LIST := SUBSTR(L_PK_LIST,1,LENGTH(L_PK_LIST)-1);

      C(C.COUNT+1)  := '';
      C(C.COUNT+1)  := '--------------------------------------------------------------';
      C(C.COUNT+1)  := WWV_FLOW_LANG.SYSTEM_MESSAGE('wwv_flow_generate_table_api.t_table_update_comment',P_TABLE_LIST(I));
      C(C.COUNT+1)  := '';
      C(C.COUNT+1)  := '   procedure "UPD_'||SUBSTR(P_TABLE_LIST(I),1,26)||'" (';
      C(C.COUNT+1)  := '      '||L_PK_LIST ||',';
      FOR C1 IN (
        SELECT COLUMN_NAME, REGEXP_REPLACE(DATA_TYPE,'\(([^\)]+)\)',NULL) DATA_TYPE, DATA_DEFAULT, DEFAULT_LENGTH, NULLABLE FROM user_tab_columns WHERE  TABLE_NAME = P_TABLE_LIST(I)
        --AND OWNER = P_OWNER
        ORDER BY COLUMN_ID
      ) LOOP
        L_ARG_NAME := C1.COLUMN_NAME;
        IF LENGTH(L_ARG_NAME)<28 THEN
          L_ARG_NAME := '"P_'||L_ARG_NAME||'"';
        END IF;
        IF (C1.DATA_DEFAULT IS NOT NULL) THEN
          IF C1.DATA_TYPE IN ('VARCHAR2','NUMBER') AND C1.DEFAULT_LENGTH <= 236 THEN
            FOR C2 IN (
                SELECT DATA_DEFAULT FROM user_tab_columns
                WHERE  TABLE_NAME = P_TABLE_LIST(I)
                --AND    OWNER = P_OWNER
                AND    COLUMN_NAME = C1.COLUMN_NAME
            ) LOOP
                L_DEFAULT := ' default '''||REPLACE(C2.DATA_DEFAULT,'''','''''')||'''';
            END LOOP;
          ELSE
            L_DEFAULT := ' default null';
          END IF;
        ELSE
          IF C1.NULLABLE = 'Y' THEN
            L_DEFAULT := ' default null';
          ELSE
            L_DEFAULT := NULL;
          END IF;
        END IF;
        IF INSTR(L_PK_LIST,L_ARG_NAME)=0 THEN
          C(C.COUNT+1)  := RTRIM('      '||RPAD(L_ARG_NAME, L_PAD,' ')||' in '||LOWER(RPAD(C1.DATA_TYPE,C_PAD_LENGTH,' '))||' '||L_DEFAULT)||',';
        END IF;
      END LOOP;

      C(C.COUNT+1)  := RTRIM('      '||RPAD('"P_MD5"', L_PAD,' ')||' in '||LOWER(RPAD('varchar2',C_PAD_LENGTH,' '))||'  default null');

      IF P_TYPE = PKG_BODY THEN
        C(C.COUNT+1)  := '   ) is ';
        C(C.COUNT+1)  := ' ';
        C(C.COUNT+1)  := '      "L_MD5" varchar2(32767) := null;';
        C(C.COUNT+1)  := ' ';
        C(C.COUNT+1)  := '   begin';
        C(C.COUNT+1)  := ' ';
        C(C.COUNT+1)  := '      if "P_MD5" is not null then';
        C(C.COUNT+1)  := '         for c1 in (';
        C(C.COUNT+1)  := '            select * from "'||P_TABLE_LIST(I)||'" ';
        C(C.COUNT+1)  := '            '||L_PK_COND||' FOR UPDATE';
        C(C.COUNT+1)  := '         ) loop';
        C(C.COUNT+1)  := ' ';
        C(C.COUNT+1)  := '            "L_MD5" := "BUILD_'||SUBSTR(P_TABLE_LIST(I),1,26)||'_MD5"(';

        FOR C3 IN (
          SELECT * FROM user_tab_columns WHERE TABLE_NAME = P_TABLE_LIST(I)
          --AND OWNER = P_OWNER
          ORDER BY COLUMN_ID
        ) LOOP
          IF INSTR(L_PK_LIST,L_ARG_NAME)=0 THEN
            C(C.COUNT+1)  := RTRIM('               c1."'||RPAD(C3.COLUMN_NAME,L_PAD,' '))||'",';
          END IF;
        END LOOP;

        C(C.COUNT) := SUBSTR(C(C.COUNT),1,LENGTH(C(C.COUNT))-1);

        C(C.COUNT+1)  := '            );';
        C(C.COUNT+1)  := ' ';
        C(C.COUNT+1)  := '         end loop;';
        C(C.COUNT+1)  := ' ';
        C(C.COUNT+1)  := '      end if;';
        C(C.COUNT+1)  := ' ';
        C(C.COUNT+1)  := '      if ("P_MD5" is null) or ("L_MD5" = "P_MD5") then ';
        C(C.COUNT+1)  := '         update "'||(P_TABLE_LIST(I))||'" set';
        FOR C2 IN (
          SELECT COLUMN_NAME, REGEXP_REPLACE(DATA_TYPE,'\(([^\)]+)\)',NULL) DATA_TYPE, DATA_DEFAULT, DEFAULT_LENGTH, NULLABLE FROM user_tab_columns WHERE  TABLE_NAME = P_TABLE_LIST(I)
          --AND OWNER = P_OWNER
          ORDER BY COLUMN_ID
        ) LOOP
          L_ARG_NAME := C2.COLUMN_NAME;
          IF LENGTH(L_ARG_NAME)<28 THEN
            L_ARG_NAME := '"P_'||L_ARG_NAME||'"';
          END IF;
          C(C.COUNT+1)  := '            '||RPAD('"'||C2.COLUMN_NAME||'"', L_PAD,' ')||' = '||L_ARG_NAME||',';
        END LOOP;
        C(C.COUNT) := SUBSTR(C(C.COUNT),1,LENGTH(C(C.COUNT))-1);
        C(C.COUNT+1)  := '         '||L_PK_COND||';';
        C(C.COUNT+1)  := '      else';
        C(C.COUNT+1)  := '         raise_application_error (-20001,''Current version of data in database has changed since user initiated update process. current checksum = "''||"L_MD5"||''", item checksum = "''||"P_MD5"||''".'');  ';
        C(C.COUNT+1)  := '      end if;';
        C(C.COUNT+1)  := ' ';
        C(C.COUNT+1)  := '   end "UPD_'||SUBSTR(P_TABLE_LIST(I),1,26)||'";';
      ELSE
        C(C.COUNT+1)  := '   );';
      END IF;
      C(C.COUNT+1)  := '';

      C(C.COUNT+1)  := '';
      C(C.COUNT+1)  := '--------------------------------------------------------------';
      C(C.COUNT+1)  := WWV_FLOW_LANG.SYSTEM_MESSAGE('wwv_flow_generate_table_api.t_table_delete_comment',P_TABLE_LIST(I));
      C(C.COUNT+1)  := '';
      C(C.COUNT+1)  := '   procedure "DEL_'||SUBSTR(P_TABLE_LIST(I),1,26)||'" (';
      C(C.COUNT+1)  := '      '||L_PK_LIST;
      IF P_TYPE = PKG_BODY THEN
        C(C.COUNT+1)  := '   ) is ';
        C(C.COUNT+1)  := ' ';
        C(C.COUNT+1)  := '   begin';
        C(C.COUNT+1)  := ' ';
        C(C.COUNT+1)  := '      delete from "'||P_TABLE_LIST(I)||'" ';
        C(C.COUNT+1)  := '      '||L_PK_COND||';';
        C(C.COUNT+1)  := ' ';
        C(C.COUNT+1)  := '   end "DEL_'||SUBSTR(P_TABLE_LIST(I),1,26)||'";';
      ELSE
        C(C.COUNT+1)  := '   );';
      END IF;


      C(C.COUNT+1)  := '';
      C(C.COUNT+1)  := '--------------------------------------------------------------';
      C(C.COUNT+1)  := WWV_FLOW_LANG.SYSTEM_MESSAGE('wwv_flow_generate_table_api.t_table_get_comment',P_TABLE_LIST(I));
      C(C.COUNT+1)  := '';
      C(C.COUNT+1)  := '   procedure "GET_'||SUBSTR(P_TABLE_LIST(I),1,26)||'" (';
      C(C.COUNT+1)  := '      '||L_PK_LIST||',';
      FOR C1 IN (
        SELECT COLUMN_NAME, REGEXP_REPLACE(DATA_TYPE,'\(([^\)]+)\)',NULL) DATA_TYPE, DATA_DEFAULT, DEFAULT_LENGTH, NULLABLE FROM user_tab_columns WHERE TABLE_NAME = P_TABLE_LIST(I)
        --AND OWNER = P_OWNER
        ORDER BY COLUMN_ID
      ) LOOP
        L_ARG_NAME := C1.COLUMN_NAME;
        IF LENGTH(L_ARG_NAME)<28 THEN
          L_ARG_NAME := '"P_'||L_ARG_NAME||'"';
        END IF;
        IF INSTR(L_PK_LIST,L_ARG_NAME)=0 THEN
          C(C.COUNT+1)  := RTRIM('      '||RPAD(L_ARG_NAME, L_PAD,' ')||' out '||LOWER(RPAD(C1.DATA_TYPE,C_PAD_LENGTH,' ')))||',';
        END IF;
      END LOOP;

      C(C.COUNT) := SUBSTR(C(C.COUNT),1,LENGTH(C(C.COUNT))-1);

      IF P_TYPE = PKG_BODY THEN
        C(C.COUNT+1)  := '   ) is ';
        C(C.COUNT+1)  := ' ';
        C(C.COUNT+1)  := '      ignore varchar2(32676);';
        C(C.COUNT+1)  := '   begin';
        C(C.COUNT+1)  := ' ';

        C(C.COUNT+1)  := '      "GET_'||SUBSTR(P_TABLE_LIST(I),1,26)||'" (';

        FOR C3 IN (
          SELECT * FROM user_tab_columns WHERE TABLE_NAME = P_TABLE_LIST(I)
          --AND OWNER = P_OWNER
          ORDER BY COLUMN_ID
        ) LOOP
          IF INSTR(L_PK_LIST,L_ARG_NAME)=0 THEN
            C(C.COUNT+1)  := RTRIM('         "P_'||RPAD(C3.COLUMN_NAME,L_PAD,' '))||'",';
          END IF;
        END LOOP;

        C(C.COUNT+1)  := '         ignore';
        C(C.COUNT+1)  := '      );';

        C(C.COUNT+1)  := ' ';
        C(C.COUNT+1)  := '   end "GET_'||SUBSTR(P_TABLE_LIST(I),1,26)||'";';
      ELSE
        C(C.COUNT+1)  := '   );';
      END IF;

      C(C.COUNT+1)  := '';
      C(C.COUNT+1)  := '--------------------------------------------------------------';
      C(C.COUNT+1)  := WWV_FLOW_LANG.SYSTEM_MESSAGE('wwv_flow_generate_table_api.t_table_get_comment',P_TABLE_LIST(I));
      C(C.COUNT+1)  := '';
      C(C.COUNT+1)  := '   procedure "GET_'||SUBSTR(P_TABLE_LIST(I),1,26)||'" (';
      C(C.COUNT+1)  := '      '||L_PK_LIST||',';
      FOR C1 IN (
        SELECT COLUMN_NAME, REGEXP_REPLACE(DATA_TYPE,'\(([^\)]+)\)',NULL) DATA_TYPE, DATA_DEFAULT, DEFAULT_LENGTH, NULLABLE FROM user_tab_columns WHERE TABLE_NAME = P_TABLE_LIST(I)
        --AND OWNER = P_OWNER
        ORDER BY COLUMN_ID
      ) LOOP
        L_ARG_NAME := C1.COLUMN_NAME;
        IF LENGTH(L_ARG_NAME)<28 THEN
          L_ARG_NAME := '"P_'||L_ARG_NAME||'"';
        END IF;
        IF INSTR(L_PK_LIST,L_ARG_NAME)=0 THEN
          C(C.COUNT+1)  := RTRIM('      '||RPAD(L_ARG_NAME, L_PAD,' ')||' out '||LOWER(RPAD(C1.DATA_TYPE,C_PAD_LENGTH,' ')))||',';
        END IF;
      END LOOP;

      C(C.COUNT+1)  := RTRIM('      '||RPAD('"P_MD5"', L_PAD,' ')||' out '||LOWER(RPAD('varchar2',C_PAD_LENGTH,' ')));

      IF P_TYPE = PKG_BODY THEN
        C(C.COUNT+1)  := '   ) is ';
        C(C.COUNT+1)  := ' ';
        C(C.COUNT+1)  := '   begin';
        C(C.COUNT+1)  := ' ';
        C(C.COUNT+1)  := '      for c1 in (';
        C(C.COUNT+1)  := '         select * from "'||P_TABLE_LIST(I)||'" ';
        C(C.COUNT+1)  := '         '||L_PK_COND||' ';
        C(C.COUNT+1)  := '      ) loop';

        FOR C2 IN (
          SELECT * FROM user_tab_columns WHERE TABLE_NAME = P_TABLE_LIST(I)
          --AND OWNER = P_OWNER
          ORDER BY COLUMN_ID
        ) LOOP
          L_ARG_NAME := C2.COLUMN_NAME;
          IF LENGTH(L_ARG_NAME)<28 THEN
            L_ARG_NAME := '"P_'||L_ARG_NAME||'"';
          ELSE
            L_ARG_NAME := '"'||L_ARG_NAME||'"';
          END IF;
          IF INSTR(L_PK_LIST,L_ARG_NAME)=0 THEN
            C(C.COUNT+1)  := RTRIM('         '||RPAD(L_ARG_NAME, L_PAD,' ')||' := c1."'||RPAD(C2.COLUMN_NAME,L_PAD,' '))||'";';
          END IF;
        END LOOP;

        C(C.COUNT+1)  := ' ';
        C(C.COUNT+1)  := '         "P_MD5" := "BUILD_'||SUBSTR(P_TABLE_LIST(I),1,26)||'_MD5"(';

        FOR C3 IN (
          SELECT * FROM user_tab_columns WHERE TABLE_NAME = P_TABLE_LIST(I)
          --AND OWNER = P_OWNER
          ORDER BY COLUMN_ID
        ) LOOP
          IF INSTR(L_PK_LIST,L_ARG_NAME)=0 THEN
            C(C.COUNT+1)  := RTRIM('            c1."'||RPAD(C3.COLUMN_NAME,L_PAD,' '))||'",';
          END IF;
        END LOOP;

        C(C.COUNT) := SUBSTR(C(C.COUNT),1,LENGTH(C(C.COUNT))-1);

        C(C.COUNT+1)  := '         );';

        C(C.COUNT+1)  := '      end loop;';
        C(C.COUNT+1)  := ' ';
        C(C.COUNT+1)  := '   end "GET_'||SUBSTR(P_TABLE_LIST(I),1,26)||'";';
      ELSE
        C(C.COUNT+1)  := '   );';
      END IF;


      C(C.COUNT+1)  := '';
      C(C.COUNT+1)  := '--------------------------------------------------------------';
      C(C.COUNT+1)  := WWV_FLOW_LANG.SYSTEM_MESSAGE('wwv_flow_generate_table_api.t_table_md5_comment',P_TABLE_LIST(I));
      C(C.COUNT+1)  := '';
      C(C.COUNT+1)  := '   function "BUILD_'||SUBSTR(P_TABLE_LIST(I),1,26)||'_MD5" (';
      C(C.COUNT+1)  := '      '||L_PK_LIST||',';
      FOR C1 IN (
        SELECT COLUMN_NAME, REGEXP_REPLACE(DATA_TYPE,'\(([^\)]+)\)',NULL) DATA_TYPE, DATA_DEFAULT, DEFAULT_LENGTH, NULLABLE FROM user_tab_columns WHERE  TABLE_NAME = P_TABLE_LIST(I)
        --AND OWNER = P_OWNER
        ORDER BY COLUMN_ID
      ) LOOP
        L_ARG_NAME := C1.COLUMN_NAME;
        IF LENGTH(L_ARG_NAME)<28 THEN
          L_ARG_NAME := '"P_'||L_ARG_NAME||'"';
        END IF;
        IF (C1.DATA_DEFAULT IS NOT NULL) THEN
          IF C1.DATA_TYPE IN ('VARCHAR2','NUMBER') AND C1.DEFAULT_LENGTH <= 236 THEN
            FOR C2 IN (
                SELECT DATA_DEFAULT
                FROM   user_tab_columns
                WHERE  TABLE_NAME = P_TABLE_LIST(I)
                --AND    OWNER = P_OWNER
                AND    COLUMN_NAME = C1.COLUMN_NAME
            ) LOOP
                L_DEFAULT := ' default '''||REPLACE(C2.DATA_DEFAULT,'''','''''')||'''';
            END LOOP;
          ELSE
            L_DEFAULT := ' default null';
          END IF;
        ELSE
          IF C1.NULLABLE = 'Y' THEN
            L_DEFAULT := ' default null';
          ELSE
            L_DEFAULT := NULL;
          END IF;
        END IF;
        IF INSTR(L_PK_LIST,L_ARG_NAME)=0 THEN
          C(C.COUNT+1)  := RTRIM('      '||RPAD(L_ARG_NAME, L_PAD,' ')||' in '||LOWER(RPAD(C1.DATA_TYPE,C_PAD_LENGTH,' '))||' '||L_DEFAULT)||',';
        END IF;
      END LOOP;

      C(C.COUNT) := RTRIM(C(C.COUNT), ',');

      IF P_TYPE = PKG_BODY THEN
        C(C.COUNT+1)  := '   ) return varchar2 is ';
        C(C.COUNT+1)  := ' ';
        C(C.COUNT+1)  := '   begin';
        C(C.COUNT+1)  := ' ';
        C(C.COUNT+1)  := '      return apex_util.get_hash(apex_t_varchar2(';

        FOR C2 IN (
          SELECT * FROM user_tab_columns WHERE TABLE_NAME = P_TABLE_LIST(I)
          --AND OWNER = P_OWNER
          ORDER BY COLUMN_ID
        ) LOOP
          L_ARG_NAME := C2.COLUMN_NAME;
          IF LENGTH(L_ARG_NAME)<28 THEN
            L_ARG_NAME := '"P_'||L_ARG_NAME||'"';
          ELSE
            L_ARG_NAME := '"'||L_ARG_NAME||'"';
          END IF;
          IF C2.DATA_TYPE = 'DATE' OR C2.DATA_TYPE LIKE 'TIMESTAMP%' THEN
            L_ARG_NAME := 'to_char('||L_ARG_NAME||',''yyyymmddhh24:mi:ss'')';
          END IF;
          IF INSTR(L_PK_LIST,L_ARG_NAME)=0 THEN
            C(C.COUNT+1)  := '         '||
                             L_ARG_NAME||
                             ',';
          END IF;
        END LOOP;

        C(C.COUNT) := RTRIM(C(C.COUNT), ',') || ' ));';

        C(C.COUNT+1)  := ' ';
        C(C.COUNT+1)  := '   end "BUILD_'||SUBSTR(P_TABLE_LIST(I),1,26)||'_MD5";';
      ELSE
        C(C.COUNT+1)  := '   ) return varchar2;';
      END IF;

    END LOOP;

    C(C.COUNT+1)  := ' ';
    C(C.COUNT+1)  := 'end '||L_APP_NAME||';';

    RETURN C;

  END GENERATE_CODE;
  
  ------------------------------------------------------------------------------------------------------------------------------
  -- procedure creates API package with procedures for given table list
  --
  procedure create_table_api(
    i_app_gen_app_id in number
   ,i_owner          in varchar2
   ,i_pck_name       in varchar2
   ,i_table_list     in table_list_type
  ) is
    v_file_name varchar2(50);
    v_pck       sys.dbms_sql.varchar2a;
    v_pck_clob  clob;
  begin
    v_file_name := i_pck_name||'.pks';
    
    v_pck := generate_code(p_app_name   => i_pck_name
                          ,p_table_list => i_table_list
                          ,p_owner      => upper(i_owner)
                          ,p_type       => pkg_spec);
    
    -- Add into actual file
    for idx in 1 .. v_pck.COUNT
    loop
      v_pck_clob := v_pck_clob || lower(replace(v_pck(idx), '"', '')) || chr(10);
    end loop;
    
    update app_gen_apps
       set api_source = v_pck_clob||nl||nl
     where app_gen_app_id = i_app_gen_app_id;
    
    execute immediate v_pck_clob;
    
    write_clob_to_file(
      v_pck_clob||nl||'/'
    , v_file_name
    , 'APEX_EXPORT'
    );
    
    v_file_name := i_pck_name||'.pkb';
    
    v_pck.DELETE;
    v_pck_clob := null;
    
    v_pck := generate_code(p_app_name   => i_pck_name
                          ,p_table_list => i_table_list
                          ,p_owner      => upper(i_owner)
                          ,p_type       => pkg_body);
    
    -- Add into actual file
    for idx in 1 .. v_pck.COUNT
    loop
      v_pck_clob := v_pck_clob || lower(replace(v_pck(idx), '"', '')) || chr(10);
    end loop;
    
    update app_gen_apps
       set api_source = api_source||v_pck_clob||nl
     where app_gen_app_id = i_app_gen_app_id;
    
    execute immediate v_pck_clob;

    write_clob_to_file(
      v_pck_clob||nl||'/'
    , v_file_name
    , 'APEX_EXPORT'
    );
    
    add_created_object('PACKAGE', i_pck_name);

  exception
    when others then
      raise_application_error(-20000, 'Create API Error: '||sqlerrm||', '||DBMS_UTILITY.FORMAT_ERROR_BACKTRACE );
  end create_table_api;
  
  ------------------------------------------------------------------------------------------------------------------------------
  -- procedure generates API view for given table, which references generated API package
  --
  procedure generate_api_view(
    i_app_gen_app_id in  varchar2
   ,i_table          in  varchar2
   ,i_package_name   in  varchar2
   ,o_view_name      out varchar2
  ) is
    v_table         varchar2(30);
    v_view_name     varchar2(30);
    v_columns_arr   apex_application_global.vc_arr2;
    v_params_arr    apex_application_global.vc_arr2;
    v_columns       varchar2(4000);
    v_proc_params   varchar2(4000);
    v_vw_clob       clob;
    v_trg_clob      clob;
    v_vw_template   varchar2(4000);
    v_trg_template  varchar2(4000);
    
    procedure replace_tokens(
      io_template    in out varchar2
     ,i_token        in varchar2
     ,i_replace_with in varchar2
    ) is
    begin
      io_template := replace(io_template, i_token, i_replace_with); 
    end replace_tokens;
  begin
    v_table     := lower(i_table);
    v_view_name := 'av_'||v_table;
    
    select decode(column_id, 1, null, tb||tb||tb)||lower(column_name)
          ,lower(column_name) bulk collect
      into v_columns_arr
          ,v_params_arr
      from user_tab_columns
     where table_name = upper(i_table);
    
    v_columns := apex_util.table_to_string(v_columns_arr, ','||nl);
    
    for i in 1..v_params_arr.count
    loop
      v_proc_params :=
        v_proc_params||tb||tb||tb||'p_'||v_params_arr(i)||' => :new.'||v_params_arr(i)||', '||nl;
    end loop;
    
    v_proc_params := rtrim(v_proc_params, ', '||nl);

    v_vw_template :=
      'create or replace view #VIEW_NAME#'||nl||
      'as'||nl||
      'select #COLUMNS#'||nl||
      '  from #TABLE#';
      
    v_vw_clob := v_vw_template;
    replace_tokens(v_vw_clob, '#VIEW_NAME#', v_view_name);
    replace_tokens(v_vw_clob, '#COLUMNS#', v_columns);
    replace_tokens(v_vw_clob, '#TABLE#', v_table);
    begin
    execute immediate rtrim(v_vw_clob);
    add_created_object('VIEW', v_view_name);
    exception
    when others then
    l(v_vw_clob);
    l('error while executing: '||sqlerrm);
    raise;
    end;
    v_vw_clob := v_vw_clob||';'||nl||
      nl||
      nl;
    
    --
    v_trg_template :=
      'create or replace trigger #TRIGGER_NAME#'||nl||
      'instead of insert or update or delete on #VIEW_NAME#'||nl||
      'for each row'||nl||
      'begin'||nl||
      '  if inserting then'||nl||
      '    #PCK_NAME#.ins_#TABLE#('||nl||
      '#PROC_PARAMS#'||nl||
      '    );'||nl||
      '  elsif updating then'||nl||
      '    #PCK_NAME#.upd_#TABLE#('||nl||
      '#PROC_PARAMS#'||nl||
      '    );'||nl||
      '  elsif deleting then'||nl||
      '    #PCK_NAME#.del_#TABLE#(#PK_PARAM# => :old.#PK_COLUMN#);'||nl||
      '  else'||nl||
      '    raise_application_error(-20900, ''Unsupported operation in #TRIGGER_NAME#'');'||nl||
      '  end if;'||nl||
      'end #TRIGGER_NAME#;'||nl;
    --
    v_trg_clob := v_trg_template;
    replace_tokens(v_trg_clob, '#VIEW_NAME#', v_view_name);
    replace_tokens(v_trg_clob, '#COLUMNS#', v_columns);
    replace_tokens(v_trg_clob, '#TABLE#', v_table);
    replace_tokens(v_trg_clob, '#TRIGGER_NAME#', 'trg_'||substr(v_view_name, 1, 22)||'_iud');
    replace_tokens(v_trg_clob, '#PCK_NAME#', i_package_name);
    replace_tokens(v_trg_clob, '#PROC_PARAMS#', v_proc_params);
    replace_tokens(v_trg_clob, '#PK_PARAM#', 'p_'||lower(get_pk_column(i_table)));
    replace_tokens(v_trg_clob, '#PK_COLUMN#', lower(get_pk_column(i_table)));
    l('2 v_trg_clob='||v_trg_clob);
    begin
    execute immediate v_trg_clob;
    add_created_object('TRIGGER', v_view_name);
    exception
    when others then
    l(v_trg_clob);
    l('error while executing: '||sqlerrm);
    raise;
    end;
    update app_gen_apps
       set views_source = views_source||'--'||v_view_name||nl||v_vw_clob||v_trg_clob||nl
     where app_gen_app_id = i_app_gen_app_id;
    
    write_clob_to_file(
      v_vw_clob||v_trg_clob||'/'||nl
     ,v_view_name||'.vw'
     ,'APEX_EXPORT'
    );
    
    o_view_name := v_view_name||'.vw';
  end generate_api_view;
  
  ------------------------------------------------------------------------------------------------------------------------------
  -- procedure creates report+form pages for given table/view
  --
  procedure create_report_with_form_pages(
    i_app_id       in number
   ,i_view_name    in varchar2
   ,i_rep_page_id  in number
   ,i_form_page_id in number
  ) is 
    l_edit_link           varchar2(1000) := c_edit_image;
    l_pk1_source          varchar2(32767);
    l_pk2_source          varchar2(32767);
    l_rv_column           wwv_flow_global.t_dbms_id;
    l_rpt_page_name       varchar2(255);
    l_form_page_name      varchar2(255);
    l_id                  number;
    l_region_template     number;
    l_breadcrumb_entry_id number;
    l_nav_list_id         number;
    l_user_interface_id   number;
    
    v_columns    varchar2(4000);
    v_table_name varchar2(50);
    v_view_name  varchar2(50);
    v_pk_column  varchar2(50);
  begin
    /*
    if :P4776_PK1_SOURCE_TYPE = 'S' then
      l_pk1_source := :P4776_PK1_SEQ;
    end if;
    
    if :P4776_PK2_SOURCE_TYPE = 'S' then
      l_pk2_source := :P4776_PK2_SEQ;
    end if;
  
    if :f4000_p4703_report_page_name is null then
        l_rpt_page_name := wwv_flow_lang.system_message('REPORT');
    else
        l_rpt_page_name := :f4000_p4703_report_page_name;
    end if;
    *//*
    wwv_flow_hint.synch_hints (
      p_schema      => :F4000_P4703_TABLE_OWNER,
      p_table_name  => :P4703_TABLE_NAME);
    */
    --l_rpt_page_name  := 'Report on '||upper(i_table_name);
    --l_form_page_name := 'Form on '||upper(i_table_name);
    
    lg('i_view_name='||i_view_name);
    v_view_name  := upper(replace(i_view_name, '.vw', ''));
    v_table_name := upper(replace(v_view_name, 'AV_', ''));
    lg('v_view_name='||v_view_name);
    lg('v_table_name='||v_table_name);
    l_rpt_page_name  := initcap(replace(v_table_name, '_', ' '));
    l_form_page_name := l_rpt_page_name|| ' - Add/Edit';
    
    lg('l_rpt_page_name='||l_rpt_page_name);
    lg('l_form_page_name='||l_form_page_name);
    
    select list_id
      into l_nav_list_id
      from apex_application_lists
     where application_id = i_app_id
       and list_name = 'Desktop Navigation Menu';
    
    l('l_nav_list_id='||l_nav_list_id);
    
    select id /* get the first displayed user interface */
      into l_user_interface_id
      from apex_180200.wwv_flow_user_interfaces
     where flow_id = i_app_id
       and rownum = 1 
     order by display_seq;
    
    l('l_user_interface_id='||l_user_interface_id);
    
    select listagg(column_name, ':') within group (order by column_id)
      into v_columns
      from all_tab_columns c
     where upper(table_name) = upper(v_table_name);
    
    v_pk_column := get_pk_column(v_table_name);
    
    l('v_columns='||v_columns);
    l('i_app_id='||i_app_id);
    l('i_form_page_id='||i_form_page_id);
    l('i_rep_page_id='||i_rep_page_id);
    l('l_form_page_name='||l_form_page_name);
    l('l_rpt_page_name='||l_rpt_page_name);
    l('l_user_interface_id='||l_user_interface_id);
    l('p_table_pk_column_name='||v_pk_column);
    l('l_rv_column='||l_rv_column);
    l('v_columns='||v_columns);
    l('display_columns='||replace(v_columns, v_pk_column||':', ''));
    l('p_form_region_template='||apex_180200.wwv_flow_theme_dev.get_region_template_id (
                                      p_application_id => i_app_id,
                                      p_theme_id       => 42,
                                      p_page_type      => 'FORM' ));
    l('l_form_page_name='||l_form_page_name);
    l('l_edit_link='||l_edit_link);
    
    apex_180200.wwv_flow_wizard_api.create_query_and_update_page (
      p_flow_id                  => i_app_id,
      p_form_page_id             => i_form_page_id,
      p_report_page_id           => i_rep_page_id,
      p_form_page_name           => l_form_page_name,
      p_report_page_name         => l_rpt_page_name,
      p_group_name               => null,
      p_form_page_mode           => 'MODAL', --:P4039_PAGE_MODE,
      p_report_page_mode         => 'NORMAL', --:P4041_PAGE_MODE,
      p_user_interface_id        => l_user_interface_id, -- TODO
      p_use_ui_default           => 'Y', -- TODO
      --
      p_tab_set                  => null,
      p_tab_name                 => null,
      p_tab_text                 => null,
      --
      p_nav_list_id              => l_nav_list_id, -- TODO :P4716_NAVLIST_ID,
      p_nav_list_parent_item_id  => null, --:P4716_NAVLIST_PARENT_ID,
      p_nav_list_child_item_name => l_rpt_page_name,
      --
      p_report_type              => 'INTERACTIVE',    
      --   
      p_table_owner              => c_parsing_schema,
      p_table_name               => v_view_name,
      --
      p_table_pk_column_name     => v_pk_column,
      p_table_pk_src_type        => 'T', -- Existing Trigger
      --p_table_pk_src             => null, --l_pk1_source,
      --p_table_pk2_column_name    => null, --replace(replace(:p4703_pk2,'%'||'null%',null),'0',null),
      --p_table_pk2_src_type       => null, --:P4776_PK2_SOURCE_TYPE,
      --p_table_pk2_src            => null, --l_pk2_source,     
      p_table_rv_column_name     => l_rv_column,
      --
      p_display_column_list      => v_columns,        
      p_report_select_list       => replace(v_columns, v_pk_column||':', ''),
      --p_rpt_template             => null,
      --p_rpt_region_template      => apex_180200.wwv_flow_theme_dev.get_region_template_id (
      --                      p_application_id => i_app_id,
      --                      p_theme_id       => 42, -- UT
      --                      p_page_type      => 'REPORT' ), -- :f4000_p4703_rpt_plug_template,
      p_rpt_region_name          => l_rpt_page_name, --:f4000_p4703_rpt_plug_name,
      p_form_region_template     => apex_180200.wwv_flow_theme_dev.get_region_template_id (
                                      p_application_id => i_app_id,
                                      p_theme_id       => 42,
                                      p_page_type      => 'FORM' ), --:f4000_p4703_form_plug_template,        
      p_form_region_name         => l_form_page_name, --:f4000_p4703_form_plug_name,
      p_where_clause             => null, --f4000_p4703_where_clause,
      p_pagination_size          => 15, --:f4000_p4703_pagination_size,
      p_edit_link                => l_edit_link,
      --
      p_form_insert              => 'Y',
      p_form_update              => 'Y',
      p_form_delete              => 'Y' 
      ); 
    
    -- :fb_flow_page_id := :f4000_p4703_report_page_id;
    
  exception
    when others then
      raise_application_error(-20000, 'Error: '||sqlerrm||', '||DBMS_UTILITY.FORMAT_ERROR_BACKTRACE );
  end create_report_with_form_pages;
 
  --
  procedure generate_deployment_scripts(i_dep_objects_tab in table_list_type) is
    v_dep_sql clob;
    v_dep_bat clob;
  begin
    v_dep_sql := 
      'set verify off'|| nl ||
      'set document off'|| nl ||
      'set scan on'|| nl ||
      nl ||
      'define db_name = &1'|| nl ||
      'define schema_name = &2'|| nl ||
      'define schema_pwd = &3'|| nl ||
      nl ||
      'whenever sqlerror continue'|| nl ||
      'spool _deploy.log'|| nl ||
      nl ||
      'prompt connecting as &schema_name ...'|| nl ||
      'set scan on'|| nl ||
      'connect &schema_name/&schema_pwd@&db_name'|| nl ||
      'set scan off'|| nl ||
      'set serveroutput on size 1000000'|| nl || nl ||
      'prompt running scripts ...'|| nl;

    if i_dep_objects_tab.count > 0 then
      for i in i_dep_objects_tab.first..i_dep_objects_tab.last loop
        v_dep_sql := v_dep_sql||'pro '||i_dep_objects_tab(i)||nl;
        v_dep_sql := v_dep_sql||'@'||i_dep_objects_tab(i)||nl;
      end loop;
    end if;
    
    v_dep_sql := v_dep_sql || nl ||
      'spool off'|| nl ||
      'exit';
    
    write_clob_to_file(
      v_dep_sql
     ,'_deploy.sql'
     ,'APEX_EXPORT'
    );
    
    v_dep_bat := 
      '@SETLOCAL'|| nl ||
      nl ||  
      '@ECHO DB Objects and APEX Application Deployment'|| nl ||
      '@PAUSE'|| nl ||
      nl ||
      '@SET /p DB="Enter DB: "'|| nl ||
      '@SET /p SCHEMA="Enter Schema: "'|| nl ||
      '@SET /p PWD="Enter Password: "'|| nl ||
      nl ||  
      'sqlplus /nolog @_deploy.sql %DB% %SCHEMA% %PWD%'|| nl ||
      nl ||
      '@del /F _deploy_%DB%.log'|| nl ||
      '@ren _deploy.log _deploy_%DB%.log'|| nl ||
      '@attrib +R deploy_%DB%.log'|| nl ||
      nl ||
      '@ENDLOCAL'|| nl ||
      '@PAUSE';
    
    write_clob_to_file(
      v_dep_bat
     ,'_deploy.bat'
     ,'APEX_EXPORT'
    );
  end generate_deployment_scripts;
  
  --
  procedure create_table_ddl(i_app_gen_app_id in number, o_file_name out varchar2) is
    v_app_id   number;
    v_user_ddl clob;
  begin
    select app_id, user_ddl
      into v_app_id, v_user_ddl
      from app_gen_apps
     where app_gen_app_id = i_app_gen_app_id;
    
    o_file_name := 'f'||v_app_id||'_objects_ddl.sql';
    
    write_clob_to_file(
      replace(replace(replace(v_user_ddl, chr(10), ''), chr(13), ' '), ';', chr(13)||'/'||chr(13))
     ,o_file_name
     ,'APEX_EXPORT'
    );
  end create_table_ddl;
  
  --
  procedure create_deployment(
    i_app_gen_app_id in number
   ,i_owner          in varchar2
   ,i_pck_name       in varchar2
   ,i_table_list     in table_list_type
   ,i_workspace      in varchar2
   ,i_app_id         in number
  ) is
    v_dep_objects_tab table_list_type;
    v_file_name       varchar2(50);
  begin
    l('create_table_ddl');
    create_table_ddl(i_app_gen_app_id, v_file_name);
    v_dep_objects_tab(v_dep_objects_tab.COUNT+1) := v_file_name;
    
    l('create_table_api');
    create_table_api(i_app_gen_app_id, i_owner, i_pck_name, i_table_list);
    v_dep_objects_tab(v_dep_objects_tab.COUNT+1) := i_pck_name||'.pks';
    v_dep_objects_tab(v_dep_objects_tab.COUNT+1) := i_pck_name||'.pkb';
    
    for i in i_table_list.first .. i_table_list.last loop
      l('generate_api_view for '||i_table_list(i));
      generate_api_view(i_app_gen_app_id, i_table_list(i), i_pck_name, v_file_name);
      v_dep_objects_tab(v_dep_objects_tab.COUNT+1) := v_file_name;
    end loop;
    
    v_file_name := 'f'||i_app_id||'.sql';
    
    l('pck_apex_export.export');
    pck_apex_export.export(i_workspace, i_app_id, i_file_name => v_file_name);
    v_dep_objects_tab(v_dep_objects_tab.COUNT+1) := v_file_name;
    
    l('generate_deployment_scripts');
    generate_deployment_scripts(v_dep_objects_tab);
    
  end create_deployment; 
  
  ------------------------------------------------------------------------------------------------------------------------------
  -- function returns region template id
  --
  function get_standard_region_template_id(i_app_id in number) return number is
    v_region_template_id apex_application_temp_region.region_template_id%type;
  begin
    select region_template_id
      into v_region_template_id
      from apex_application_temp_region
     where application_id = i_app_id
       and internal_name = 'STANDARD';
       
    return v_region_template_id;
  end get_standard_region_template_id;
  
  ------------------------------------------------------------------------------------------------------------------------------
  -- main App Gen procedure
  --
  procedure create_app(
    i_sql            in varchar2
   ,i_app_id         in number
   ,i_app_name       in varchar2
   ,i_parsing_schema in varchar2
   ,i_app_lang       in varchar2
   ,i_tables         in varchar2 default null
  ) is
    v_tables         varchar2(4000);
    v_tables_arr     apex_application_global.vc_arr2;
    v_rep_page       pls_integer := 2;
    v_form_page      pls_integer := 3;
    v_table_list     table_list_type;
    v_app_gen_app_id number;
    l_theme          apex_180200.wwv_flow_create_app_v3.t_theme;
    v_view_name      varchar2(50);
    v_workspace      varchar2(50) := 'DEMO1'; -- TODO
  begin
    -- 1) run DDL if needed
    -- 2) create PK triggers if needed
    -- 3) generate API
    -- 4) generate views
    -- 5) generate app
    -- 6) store app_gen definition
    
    if i_tables is not null then
      v_tables := i_tables;
    else
      lg('run_sql: '||i_sql);
      run_sql(i_sql, v_tables);
    end if;
    lg('v_tables='||v_tables);
    
    v_app_gen_app_id := app_gen_apps_seq.nextval;
    
    apex_180200.wwv_flow_define_app_v3.init_wizard;

    l_theme.theme_type  := 'UT';
    l_theme.id          := null; --:P1_THEME_ID;
    l_theme.theme_style := 'Vita'; --:P1_THEME_STYLE;
    
    lg('wwv_flow_create_app_v3.create_app');
    lg('i_app_id='||i_app_id);
    lg('i_app_name='||i_app_name);
    lg('p_parsing_schema='||nvl(i_parsing_schema, c_parsing_schema));
    apex_180200.wwv_flow_create_app_v3.create_app (
        p_app_id                   => i_app_id,
        p_app_name                 => i_app_name,
        p_parsing_schema           => nvl(i_parsing_schema, c_parsing_schema),
        p_app_language             => i_app_lang,
        p_theme                    => l_theme,
        p_authentication_name      => apex_180200.wwv_flow_authentication_api.c_type_apex_accounts,
        p_base_table_prefix        => null, --':P5_BASE_TABLE_PREFIX',
        p_features                 => null, --:P1_FEATURES,
        p_translated_langs         => null, --:P1_TRANSLATED_LANGS,
        -- appearance
        p_nav_position             => 'SIDE', -- nvl(:P170_NAV_POSITION, :P1_NAV_POSITION),
        p_app_icon_class           => 'app-icon-bar-line-chart', -- nvl(:P170_APP_ICON_CLASS, :P1_APP_ICON_CLASS),
        p_app_color_class          => 'app-color-3', -- nvl(:P170_APP_COLOR_CLASS, :P1_APP_COLOR_CLASS),
        p_app_icon_color_hex       => '#81BB5F', -- nvl(:P170_APP_COLOR_HEX, :P1_APP_COLOR_HEX),
        -- advanced general
        p_learn_app_def            => false, --( nvl(:P5_LEARN_UI_DEF_YN, 'N') = 'Y' ),
        p_learn_existing_apps      => false, --( nvl(:P5_LEARN_YN,'N') = 'Y' ),
        p_seed_from_app_id         => null, --:P5_SEED_FROM_APP,
        p_short_description        => i_app_name,-- :P5_APP_SHORT_DESC,
        p_long_description         => null, --:P5_APP_DESC,
        p_app_version              => '1', --:P5_APP_VERSION,
        p_app_logging              => true,
        p_app_debugging            => true,
        -- advanced security
        p_deep_linking             => true,
        p_max_session_length_sec   => null, --:P5_MAX_SESSION_LENGTH,
        p_max_session_idle_sec     => null, --:P5_MAX_SESSION_IDLE_TIME,
        -- advanced globalization
        p_document_direction       => 'N',
        p_date_format              => 'dd.mm.rrrr',
        p_date_time_format         => 'dd.mm.rrrr hh24:mi',
        p_timestamp_format         => null, --:P5_TIMESTAMP_FORMAT,
        p_timestamp_tz_format      => null --:P5_TIMESTAMP_TZ_FORMAT
        );
        
    apex_180200.wwv_flow_api.create_page_plug(
       p_id=>null --wwv_flow_api.id(3397922051923904)
      ,p_flow_id=>i_app_id
      ,p_page_id=>1
      ,p_plug_name=>'Introduction'
      ,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
      ,p_plug_template=>get_standard_region_template_id(i_app_id)
      ,p_plug_display_sequence=>20
      ,p_include_in_reg_disp_sel_yn=>'Y'
      ,p_plug_display_point=>'BODY'
      ,p_plug_source=>'Welcome to the App Gen '||i_app_name||'!'
      ,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
      ,p_attribute_01=>'N'
      ,p_attribute_02=>'HTML'
    );
    
    lg('htmldb_util.clear_app_cache');
    htmldb_util.clear_app_cache(p_app_id => i_app_id);
    
    lg('insert into app_gen_apps');
    insert into app_gen_apps
    values (v_app_gen_app_id, i_app_id, i_sql, v_tables, null, null, null, sysdate, nvl(v('APP_USER'), user));

    v_tables_arr := apex_util.string_to_table(v_tables, ':');
    
    add_created_object('APP', i_app_id);
    
    if v_tables_arr.count > 0 then
      for i in 1..v_tables_arr.count loop
        if length(v_tables_arr(i)) > 0 then
          v_table_list(i) := v_tables_arr(i);
        end if;
      end loop;
      
      lg('create_table_api');
      create_table_api(
        i_app_gen_app_id => v_app_gen_app_id
       ,i_owner          => c_parsing_schema
       ,i_pck_name       => 'pck_f'||i_app_id||'_api'
       ,i_table_list     => v_table_list
      );

      for i in v_table_list.first..v_table_list.last
      loop
        lg('create API view for '||v_table_list(i));
        generate_api_view(
          i_app_gen_app_id => v_app_gen_app_id
         ,i_table          => v_table_list(i)
         ,i_package_name   => 'pck_f'||i_app_id||'_api'
         ,o_view_name      => v_view_name
        );

        lg('create page for '||v_table_list(i));
        create_report_with_form_pages(i_app_id, v_view_name, v_rep_page, v_form_page);
        v_rep_page  := v_form_page + 1;
        v_form_page := v_rep_page + 1;
      end loop;
    end if;
    
    lg('create_deployment');
    create_deployment(
      i_app_gen_app_id => v_app_gen_app_id
     ,i_owner          => c_parsing_schema
     ,i_pck_name       => 'pck_f'||i_app_id||'_api'
     ,i_table_list     => v_table_list
     ,i_workspace      => v_workspace
     ,i_app_id         => i_app_id
    );
  
  exception
    when others then
      lge('create_app: '||sqlerrm||' '||sys.dbms_utility.format_error_backtrace);
      
      if v_tables is not null then
        drop_tables(v_tables);
      end if;
      
      raise_application_error(-20000, 'Error: '||sqlerrm||' '||sys.dbms_utility.format_error_backtrace);
  end create_app;
  
  ------------------------------------------------------------------------------------------------------------------------------
  -- Tables App Gen procedure
  --
  procedure create_app_from_tables(i_tables in varchar2, i_app_id in number, i_app_name in varchar2) is
  begin
    if i_tables is not null then
      create_app(
        i_sql            => null
       ,i_app_id         => i_app_id
       ,i_app_name       => i_app_name
       ,i_parsing_schema => null
       ,i_app_lang       => 'hr'
       ,i_tables         => i_tables
      );
    else
      raise_application_error(-20210, 'Please select some Tables first.');
    end if;
    
  end create_app_from_tables;
  
  ------------------------------------------------------------------------------------------------------------------------------
  -- JSON App Gen procedure
  --
  procedure create_app_json(i_json_definition in varchar2, i_app_name in varchar2) is
    v_sql varchar2(4000);
    v_app_id number;
    l_values apex_json.t_values;
    v_last_table varchar2(50);
    ex_definition exception;
  begin
    if i_json_definition is null then
      raise ex_definition;
    else
      -- 1) Parse JSON, create DDL
      for rec in (select lower(replace(jsn.tbllabel, ' ', '_')) tbllabel
                       , lower(replace(jsn.columnname, ' ', '_')) columnname
                       , jsn.columntype
                       , jsn.nullable 
                    from json_table(
                      i_json_definition
                    , '$.tables[*]'
                    columns (tbllabel   varchar2(500) path '$.tableName',
                             columnname varchar2(500) path '$.columns.columnName',
                             columntype varchar2(500) path '$.columns.columnType',
                             nullable   varchar2(500) path '$.columns.nullable',
                             nested path '$.columns[*]' columns ( dummy VARCHAR2(500) PATH '$.columnName')
                             )
                        ) jsn)
      loop
        if v_last_table is null or v_last_table != rec.tbllabel then
          v_sql := rtrim(v_sql, ', ' || chr(10));
          v_sql := v_sql || ');' || chr(10) || 'CREATE TABLE '||rec.tbllabel||'('||chr(10);
          v_sql := v_sql || rec.tbllabel ||'_auto_id NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,'||chr(10);
        end if;
        
        v_sql := v_sql || rec.columnname || ' ' || rec.columntype || ' ' || rec.nullable || ', ' || chr(10);
        
        
        v_last_table := rec.tbllabel;
      end loop;
      
      v_sql := rtrim(v_sql, ', ' || chr(10));
      v_sql := ltrim(v_sql, ';)');
      v_sql := v_sql||');';
      
      select nvl(max(application_id), 200) + 1
        into v_app_id
        from apex_applications
       where application_id between 200 and 500;
      
      create_app(
        i_sql            => v_sql
       ,i_app_id         => v_app_id
       ,i_app_name       => nvl(i_app_name, 'App Gen Application '||v_app_id)
       ,i_parsing_schema => NULL
       ,i_app_lang       => 'hr'
      );
    end if;
  exception
    when ex_definition then
      raise_application_error(-20200, 'Please create some Tables first.');
    when others then
      lge('create_app: '||sqlerrm||' '||sys.dbms_utility.format_error_backtrace);
      raise_application_error(-20100, 'Error: '||sqlerrm||' '||sys.dbms_utility.format_error_backtrace);
  end create_app_json;

end pck_app_gen;
/
