create table app_gen_apps(
  app_gen_app_id		number not null primary key
 ,app_id						number
 ,user_ddl					clob
 ,user_ddl_tables	  varchar2(4000)
 ,api_source				clob
 ,views_source			clob
 ,additional_source	clob
 ,created_on				date not null
 ,created_by				varchar2(50)
)
/

create sequence app_gen_apps_seq start with 1 increment by 1
/
