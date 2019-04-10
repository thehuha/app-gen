/*
@author:  Daniel Huha
@created: 2018
@desc:    APEX Application Generator
@license: free to use and modify, just credit the @author 
*/
create or replace package pck_app_gen authid current_user as
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
  );
  
  ------------------------------------------------------------------------------------------------------------------------------
  -- Tables App Gen procedure
  --
  procedure create_app_from_tables(i_tables in varchar2, i_app_id in number, i_app_name in varchar2);
  
  ------------------------------------------------------------------------------------------------------------------------------
  -- JSON App Gen procedure
  --
  procedure create_app_json(i_json_definition in varchar2, i_app_name in varchar2);
  
end pck_app_gen;
/
