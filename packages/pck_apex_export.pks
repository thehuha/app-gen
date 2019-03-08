create or replace package pck_apex_export as
  
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
  );
  
end pck_apex_export;

