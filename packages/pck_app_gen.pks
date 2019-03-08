create or replace package pck_app_gen authid current_user as
  type table_list_type is table of varchar2(256) index by binary_integer;
  
  --
  procedure run_sql(i_sql in varchar2, o_tables out varchar2);
  
  --
  procedure create_app(
    i_sql            in varchar2
   ,i_app_id         in number
   ,i_app_name       in varchar2
   ,i_parsing_schema in varchar2
   ,i_app_lang       in varchar2
  );
  
  --
  procedure create_report_with_form_pages(
    i_app_id       in number
   ,i_table_name   in varchar2
   ,i_rep_page_id  in number
   ,i_form_page_id in number
  );
  
  --
  procedure create_table_api(
    i_app_gen_app_id in number
   ,i_owner          in varchar2
   ,i_pck_name       in varchar2
   ,i_table_list     in table_list_type
  );
  
  --
  procedure create_deployment(
    i_app_gen_app_id in number
   ,i_owner          in varchar2
   ,i_pck_name       in varchar2
   ,i_table_list     in table_list_type
   ,i_workspace      in varchar2
   ,i_app_id         in number
  );
  
end pck_app_gen;
/
