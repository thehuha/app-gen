declare
  v_apex_schema    varchar2(30) := 'APEX_180200';
  v_parsing_schema varchar2(30) := 'DEMO1';
begin
  execute immediate 'grant execute on '||v_apex_schema||'.wwv_flow_theme_dev to '||v_parsing_schema;
  execute immediate 'grant execute on '||v_apex_schema||'.wwv_flow_wizard_api to '||v_parsing_schema;
  execute immediate 'grant execute on '||v_apex_schema||'.wwv_flow_define_app_v3 to '||v_parsing_schema;
  execute immediate 'grant execute on '||v_apex_schema||'.wwv_flow_create_app_v3 to '||v_parsing_schema;
  execute immediate 'grant execute on '||v_apex_schema||'.wwv_flow_generate_table_api to '||v_parsing_schema;
  execute immediate 'grant execute on '||v_apex_schema||'.wwv_flow_gen_api2 to '||v_parsing_schema;
  execute immediate 'grant select on '||v_apex_schema||'.wwv_flow_user_interfaces to '||v_parsing_schema;
end;
/
