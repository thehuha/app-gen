

begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2016.08.24'
,p_release=>'5.1.1.00.08'
,p_default_workspace_id=>1470610789947540
,p_default_application_id=>100
,p_default_owner=>'HROUG');

end;
/

begin
  wwv_flow_api.g_mode := 'REPLACE';
end;
/


prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_180100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2018.04.04'
,p_release=>'18.1.0.00.45'
,p_default_workspace_id=>1470610789947540
,p_default_application_id=>100
,p_default_owner=>'HR'
);
end;
/
 
prompt APPLICATION 100 - My Demo App
--
-- Application Export:
--   Application:     100
--   Name:            My Demo App
--   Date and Time:   13:06 Nedjelja Ožujak 3, 2019
--   Exported By:     HR
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         18.1.0.00.45
--   Instance ID:     220717191816403
--

-- Application Statistics:
--   Pages:                      7
--     Items:                   12
--     Processes:                7
--     Regions:                  9
--     Buttons:                  5
--   Shared Components:
--     Logic:
--       Items:                  1
--     Navigation:
--       Lists:                  2
--       Breadcrumbs:            1
--         Entries:              1
--     Security:
--       Authentication:         1
--       Authorization:          1
--     User Interface:
--       Themes:                 1
--       Templates:
--         Page:                 9
--         Region:              15
--         Label:                7
--         List:                12
--         Popup LOV:            1
--         Calendar:             1
--         Breadcrumb:           1
--         Button:               3
--         Report:              10
--       LOVs:                   2
--       Shortcuts:              1
--     Globalization:
--       Messages:               4
--     Reports:
--     E-Mail:
--   Supporting Objects:  Excluded

prompt --application/delete_application
begin
wwv_flow_api.remove_flow(wwv_flow.g_flow_id);
end;
/
prompt --application/create_application
begin
wwv_flow_api.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_display_id=>nvl(wwv_flow_application_install.get_application_id,100)
,p_owner=>nvl(wwv_flow_application_install.get_schema,'HR')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'My Demo App')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'100')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'3501046A40009C8D172AC22F785FD9FA6339D67C978F23E1BDFCC664EA4B44BF'
,p_bookmark_checksum_function=>'SH1'
,p_compatibility_mode=>'5.1'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'SESSION'
,p_allow_feedback_yn=>'Y'
,p_date_format=>'DD.MM.RRRR'
,p_timestamp_format=>'DD.MM.RRRR'
,p_timestamp_tz_format=>'DD.MM.RRRR'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_documentation_banner=>'Application created from create application wizard 2018.10.11.'
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_api.id(1475449379980933)
,p_application_tab_set=>1
,p_logo_image=>'TEXT:My Demo App'
,p_app_builder_icon_name=>'app-icon.svg'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>'Release 1.0'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_runtime_api_usage=>'T:O:W'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_substitution_string_01=>'APP_NAME'
,p_substitution_value_01=>'My Demo App'
,p_last_updated_by=>'DHUHA'
,p_last_upd_yyyymmddhh24miss=>'20181104163820'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>3
,p_ui_type_name => null
);
end;
/
prompt --application/shared_components/navigation/lists/desktop_navigation_menu
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(1476249675980936)
,p_name=>'Desktop Navigation Menu'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1606485989981138)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Home'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:'
,p_list_item_icon=>'fa-home'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1610593773995748)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Employees'
,p_list_item_link_target=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-child'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1619542523999810)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Departments'
,p_list_item_link_target=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-tiles-8'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1751070861724137)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Translation Util'
,p_list_item_link_target=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-calendar-wrench'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'4'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1920510180146392)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'App Gen'
,p_list_item_link_target=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-cart-edit'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'7'
);
end;
/
prompt --application/shared_components/navigation/lists/desktop_navigation_bar
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(1596033144981064)
,p_name=>'Desktop Navigation Bar'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1608062339981151)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'&APP_USER.'
,p_list_item_link_target=>'#'
,p_list_item_icon=>'fa-user'
,p_list_text_02=>'has-username'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1608573375981151)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'---'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_api.id(1608062339981151)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1608946801981152)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Sign Out'
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_item_icon=>'fa-sign-out'
,p_parent_list_item_id=>wwv_flow_api.id(1608062339981151)
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
prompt --application/shared_components/files/app_icon_svg
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '3C73766720786D6C6E733D22687474703A2F2F7777772E77332E6F72672F323030302F7376672220786D6C6E733A786C696E6B3D22687474703A2F2F7777772E77332E6F72672F313939392F786C696E6B222076696577426F783D223020302036342036';
wwv_flow_api.g_varchar2_table(2) := '34223E3C646566733E3C7374796C653E2E636C732D317B66696C6C3A75726C282372616469616C2D6772616469656E74293B7D2E636C732D327B6F7061636974793A302E313B7D2E636C732D332C2E636C732D347B66696C6C3A236666663B7D2E636C73';
wwv_flow_api.g_varchar2_table(3) := '2D337B6F7061636974793A302E363B7D3C2F7374796C653E3C72616469616C4772616469656E742069643D2272616469616C2D6772616469656E74222063783D223332222063793D222E30352220723D22363422206772616469656E74556E6974733D22';
wwv_flow_api.g_varchar2_table(4) := '7573657253706163654F6E557365223E3C73746F70206F66667365743D2230222073746F702D636F6C6F723D2223666666222073746F702D6F7061636974793D22302E3135222F3E3C73746F70206F66667365743D222E35222073746F702D636F6C6F72';
wwv_flow_api.g_varchar2_table(5) := '3D2223666666222073746F702D6F7061636974793D22302E31222F3E3C73746F70206F66667365743D2231222073746F702D636F6C6F723D2223666666222073746F702D6F7061636974793D2230222F3E3C2F72616469616C4772616469656E743E3C73';
wwv_flow_api.g_varchar2_table(6) := '796D626F6C2069643D22616D6269656E742D6C69676874696E67222076696577426F783D22302030203634203634223E3C7061746820636C6173733D22636C732D312220643D224D302030683634763634682D36347A222F3E3C2F73796D626F6C3E3C2F';
wwv_flow_api.g_varchar2_table(7) := '646566733E3C7469746C653E6261722D6C696E652D63686172743C2F7469746C653E3C726563742077696474683D22363422206865696768743D223634222066696C6C3D2223453935423534222F3E3C672069643D2269636F6E73223E3C706174682063';
wwv_flow_api.g_varchar2_table(8) := '6C6173733D22636C732D322220643D224D313920343668357631682D357A4D323620343668357631682D357A4D333320343668357631682D357A4D343020343668357631682D357A222F3E3C7061746820636C6173733D22636C732D332220643D224D31';
wwv_flow_api.g_varchar2_table(9) := '3920333868357638682D357A4D32362033326835763134682D357A4D33332033326835763134682D357A4D34302032376835763139682D357A222F3E3C6720636C6173733D22636C732D32223E3C636972636C652063783D2234322E35222063793D2232';
wwv_flow_api.g_varchar2_table(10) := '302E352220723D22312E35222F3E3C636972636C652063783D2233352E35222063793D2232352E352220723D22312E35222F3E3C636972636C652063783D2232382E35222063793D2232352E352220723D22312E35222F3E3C636972636C652063783D22';
wwv_flow_api.g_varchar2_table(11) := '32312E35222063793D2233312E352220723D22312E35222F3E3C7061746820643D224D32312E3832352033312E3837396C2D2E36352D2E37353820372E31342D362E31323168372E3032356C362E3836392D342E3930372E3538322E3831342D372E3133';
wwv_flow_api.g_varchar2_table(12) := '3120352E303933682D362E3937356C2D362E383620352E3837397A222F3E3C2F673E3C636972636C6520636C6173733D22636C732D34222063783D2234322E35222063793D2231392E352220723D22312E35222F3E3C636972636C6520636C6173733D22';
wwv_flow_api.g_varchar2_table(13) := '636C732D34222063783D2233352E35222063793D2232342E352220723D22312E35222F3E3C636972636C6520636C6173733D22636C732D34222063783D2232382E35222063793D2232342E352220723D22312E35222F3E3C636972636C6520636C617373';
wwv_flow_api.g_varchar2_table(14) := '3D22636C732D34222063783D2232312E35222063793D2233302E352220723D22312E35222F3E3C7061746820636C6173733D22636C732D342220643D224D32312E3832352033302E3837396C2D2E36352D2E37353820372E31342D362E31323168372E30';
wwv_flow_api.g_varchar2_table(15) := '32356C362E3836392D342E3930372E3538322E3831342D372E31333120352E303933682D362E3937356C2D362E383620352E3837397A222F3E3C2F673E3C7573652077696474683D22363422206865696768743D2236342220786C696E6B3A687265663D';
wwv_flow_api.g_varchar2_table(16) := '2223616D6269656E742D6C69676874696E67222069643D226C69676874696E67222F3E3C2F7376673E';
wwv_flow_api.create_app_static_file(
 p_id=>wwv_flow_api.id(1597485258981099)
,p_file_name=>'app-icon.svg'
,p_mime_type=>'image/svg+xml'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/shared_components/files/app_icon_css
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2E6170702D69636F6E207B0A202020206261636B67726F756E642D696D6167653A2075726C286170702D69636F6E2E737667293B0A202020206261636B67726F756E642D7265706561743A206E6F2D7265706561743B0A202020206261636B67726F756E';
wwv_flow_api.g_varchar2_table(2) := '642D73697A653A20636F7665723B0A202020206261636B67726F756E642D706F736974696F6E3A203530253B0A202020206261636B67726F756E642D636F6C6F723A20234539354235343B0A7D';
wwv_flow_api.create_app_static_file(
 p_id=>wwv_flow_api.id(1597739187981100)
,p_file_name=>'app-icon.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/plugin_settings
begin
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(1473369218980928)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attribute_01=>'modern'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(1473692150980929)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_RICH_TEXT_EDITOR'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(1473967094980930)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attribute_01=>'Y'
,p_attribute_03=>'N'
,p_attribute_05=>'SWITCH'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(1474249801980930)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_CSS_CALENDAR'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(1474544511980930)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(1474806781980930)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IG'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(1475196115980930)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attribute_01=>'IG'
);
end;
/
prompt --application/shared_components/security/authorizations/administration_rights
begin
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(1599029038981101)
,p_name=>'Administration Rights'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return true;'
,p_error_message=>'Insufficient privileges, user is not an Administrator'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
prompt --application/shared_components/navigation/navigation_bar
begin
null;
end;
/
prompt --application/shared_components/logic/application_items
begin
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1635824653398557)
,p_name=>'FSP_LANGUAGE_PREFERENCE'
,p_protection_level=>'I'
);
end;
/
prompt --application/shared_components/logic/application_computations
begin
null;
end;
/
prompt --application/shared_components/logic/application_settings
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/standard
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/parent
begin
null;
end;
/
prompt --application/shared_components/user_interface/lovs/app_lang_lov
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1648569707114195)
,p_lov_name=>'APP_LANG_LOV'
,p_lov_query=>'.'||wwv_flow_api.id(1648569707114195)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1648872478114197)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Hrvatski'
,p_lov_return_value=>'hr'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1649210489114198)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Deutsch'
,p_lov_return_value=>'de'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1649631325114198)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'English'
,p_lov_return_value=>'en'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1650083753114198)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>unistr('Fran\00E7ais')
,p_lov_return_value=>'fr'
);
end;
/
prompt --application/shared_components/user_interface/lovs/login_remember_username
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1601624009981125)
,p_lov_name=>'LOGIN_REMEMBER_USERNAME'
,p_lov_query=>'.'||wwv_flow_api.id(1601624009981125)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1602006364981127)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Remember username'
,p_lov_return_value=>'Y'
);
end;
/
prompt --application/pages/page_groups
begin
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(1599679707981104)
,p_group_name=>'Administration'
);
end;
/
prompt --application/comments
begin
null;
end;
/
prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
wwv_flow_api.create_menu(
 p_id=>wwv_flow_api.id(1475783214980934)
,p_name=>'Breadcrumb'
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(1475936720980934)
,p_short_name=>'Home'
,p_link=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.'
,p_page_id=>1
);
end;
/
prompt --application/shared_components/user_interface/templates/page/left_side_column
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(1476565452980942)
,p_theme_id=>42
,p_name=>'Left Side Column'
,p_internal_name=>'LEFT_SIDE_COLUMN'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.leftSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>',
'</head>',
'<body class="t-PageBody t-PageBody--showLeft t-PageBody--hideActions no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Icon fa fa-bars" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'#SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">',
'      #REGION_POSITION_01#',
'    </div>',
'    <div class="t-Body-side" id="t_Body_side">',
'      #REGION_POSITION_02#',
'    </div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      <div class="t-Body-contentInner">',
'        #BODY#',
'      </div>',
'      <footer class="t-Footer">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>  ',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">',
'  #REGION_POSITION_04#',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525196570560608698
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1476849612980948)
,p_page_template_id=>wwv_flow_api.id(1476565452980942)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1477160241980949)
,p_page_template_id=>wwv_flow_api.id(1476565452980942)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1477436541980949)
,p_page_template_id=>wwv_flow_api.id(1476565452980942)
,p_name=>'Left Column'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1477734211980949)
,p_page_template_id=>wwv_flow_api.id(1476565452980942)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1478053182980949)
,p_page_template_id=>wwv_flow_api.id(1476565452980942)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1478330176980950)
,p_page_template_id=>wwv_flow_api.id(1476565452980942)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1478631859980950)
,p_page_template_id=>wwv_flow_api.id(1476565452980942)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1478908419980950)
,p_page_template_id=>wwv_flow_api.id(1476565452980942)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/left_and_right_side_columns
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(1479301295980952)
,p_theme_id=>42
,p_name=>'Left and Right Side Columns'
,p_internal_name=>'LEFT_AND_RIGHT_SIDE_COLUMNS'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.bothSideCols();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>',
'</head>',
'<body class="t-PageBody t-PageBody--showLeft no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Icon fa fa-bars" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'#SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">',
'      #REGION_POSITION_01#',
'    </div>',
'    <div class="t-Body-side" id="t_Body_side">',
'      #REGION_POSITION_02#',
'    </div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      <div class="t-Body-contentInner">',
'        #BODY#',
'      </div>',
'      <footer class="t-Footer">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>  ',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'  <div class="t-Body-actions" id="t_Body_actions">',
'    <button class="t-Button t-Button--icon t-Button--header t-Button--headerRight" title="#EXPAND_COLLAPSE_SIDE_COL_LABEL#" id="t_Button_rightControlButton" type="button"><span class="t-Icon fa fa-bars" aria-hidden="true"></span></button>',
'    <div class="t-Body-actionsContent">',
'    #REGION_POSITION_03#',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">',
'  #REGION_POSITION_04#',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>false
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525203692562657055
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1479608420980953)
,p_page_template_id=>wwv_flow_api.id(1479301295980952)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>6
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1479928958980953)
,p_page_template_id=>wwv_flow_api.id(1479301295980952)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1480297667980954)
,p_page_template_id=>wwv_flow_api.id(1479301295980952)
,p_name=>'Left Column'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>3
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1480598826980954)
,p_page_template_id=>wwv_flow_api.id(1479301295980952)
,p_name=>'Right Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>3
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1480889314980954)
,p_page_template_id=>wwv_flow_api.id(1479301295980952)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1481136743980954)
,p_page_template_id=>wwv_flow_api.id(1479301295980952)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>6
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1481411773980954)
,p_page_template_id=>wwv_flow_api.id(1479301295980952)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1481711577980954)
,p_page_template_id=>wwv_flow_api.id(1479301295980952)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1482018930980954)
,p_page_template_id=>wwv_flow_api.id(1479301295980952)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/login
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(1482456696980955)
,p_theme_id=>42
,p_name=>'Login'
,p_internal_name=>'LOGIN'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.appLogin();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>',
'</head>',
'<body class="t-PageBody--login no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #REGION_POSITION_01#',
'  #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'  <div class="t-Body-wrap">',
'    <div class="t-Body-col t-Body-col--main">',
'      <div class="t-Login-container">',
'      #BODY#',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>6
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2099711150063350616
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1482788371980955)
,p_page_template_id=>wwv_flow_api.id(1482456696980955)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1483030161980955)
,p_page_template_id=>wwv_flow_api.id(1482456696980955)
,p_name=>'Body Header'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/master_detail
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(1483236322980955)
,p_theme_id=>42
,p_name=>'Marquee'
,p_internal_name=>'MASTER_DETAIL'
,p_is_popup=>false
,p_javascript_file_urls=>'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.stickyTableHeader#MIN#.js?v=#APEX_VERSION#'
,p_javascript_code_onload=>'apex.theme42.initializePage.masterDetail();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>',
'</head>',
'<body class="t-PageBody t-PageBody--masterDetail t-PageBody--hideLeft no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Icon fa fa-bars" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'#SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">',
'      #REGION_POSITION_01#',
'    </div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      <div class="t-Body-info" id="t_Body_info">',
'        #REGION_POSITION_02#',
'      </div>',
'      <div class="t-Body-contentInner">',
'        #BODY#',
'      </div>',
'      <footer class="t-Footer">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>  ',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'  <div class="t-Body-actions" id="t_Body_actions">',
'    <button class="t-Button t-Button--icon t-Button--header t-Button--headerRight" title="#EXPAND_COLLAPSE_SIDE_COL_LABEL#" id="t_Button_rightControlButton" type="button"><span class="t-Icon fa fa-bars" aria-hidden="true"></span></button>',
'    <div class="t-Body-actionsContent">',
'    #REGION_POSITION_03#',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">',
'  #REGION_POSITION_04#',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>1996914646461572319
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1483581753980956)
,p_page_template_id=>wwv_flow_api.id(1483236322980955)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1483899727980956)
,p_page_template_id=>wwv_flow_api.id(1483236322980955)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1484167545980956)
,p_page_template_id=>wwv_flow_api.id(1483236322980955)
,p_name=>'Master Detail'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1484441164980957)
,p_page_template_id=>wwv_flow_api.id(1483236322980955)
,p_name=>'Right Side Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1484723390980957)
,p_page_template_id=>wwv_flow_api.id(1483236322980955)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1485033138980957)
,p_page_template_id=>wwv_flow_api.id(1483236322980955)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1485310542980957)
,p_page_template_id=>wwv_flow_api.id(1483236322980955)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1485662365980957)
,p_page_template_id=>wwv_flow_api.id(1483236322980955)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1485931661980958)
,p_page_template_id=>wwv_flow_api.id(1483236322980955)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/minimal_no_navigation
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(1486305075980958)
,p_theme_id=>42
,p_name=>'Minimal (No Navigation)'
,p_internal_name=>'MINIMAL_NO_NAVIGATION'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.noSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#  ',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft t-PageBody--hideActions no-anim #PAGE_CSS_CLASSES# t-PageBody--noNav" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Icon fa fa-bars" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'</header>',
'    '))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  <div class="t-Body-main">',
'      <div class="t-Body-title" id="t_Body_title">',
'        #REGION_POSITION_01#',
'      </div>',
'      <div class="t-Body-content" id="t_Body_content">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-contentInner">',
'          #BODY#',
'        </div>',
'        <footer class="t-Footer">',
'          <div class="t-Footer-body">',
'            <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'            <div class="t-Footer-apex">',
'              <div class="t-Footer-version">#APP_VERSION#</div>  ',
'              <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'              #BUILT_WITH_LOVE_USING_APEX#',
'            </div>',
'          </div>',
'          <div class="t-Footer-top">',
'            <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'          </div>',
'        </footer>',
'      </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">',
'  #REGION_POSITION_04#',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>',
''))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar t-NavigationBar--classic" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>4
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2977628563533209425
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1486654944980958)
,p_page_template_id=>wwv_flow_api.id(1486305075980958)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1486922349980958)
,p_page_template_id=>wwv_flow_api.id(1486305075980958)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1487255643980958)
,p_page_template_id=>wwv_flow_api.id(1486305075980958)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1487548897980959)
,p_page_template_id=>wwv_flow_api.id(1486305075980958)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1487887365980959)
,p_page_template_id=>wwv_flow_api.id(1486305075980958)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1488129871980959)
,p_page_template_id=>wwv_flow_api.id(1486305075980958)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1488414069980959)
,p_page_template_id=>wwv_flow_api.id(1486305075980958)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/modal_dialog
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(1488831444980960)
,p_theme_id=>42
,p_name=>'Modal Dialog'
,p_internal_name=>'MODAL_DIALOG'
,p_is_popup=>true
,p_javascript_code_onload=>'apex.theme42.initializePage.modalDialog();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>',
'</head>',
'<body class="t-Dialog-page t-Dialog-page--standard #DIALOG_CSS_CLASSES# #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Dialog" role="dialog" aria-label="#TITLE#">',
'  <div class="t-Dialog-header">#REGION_POSITION_01#</div>',
'  <div class="t-Dialog-bodyWrapperOut">',
'      <div class="t-Dialog-bodyWrapperIn"><div class="t-Dialog-body">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      #BODY#',
'      </div></div>',
'  </div>',
'  <div class="t-Dialog-footer">#REGION_POSITION_03#</div>',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>3
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},''t-Dialog-page--standard ''+#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_height=>'auto'
,p_dialog_width=>'720'
,p_dialog_max_width=>'960'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2098960803539086924
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1489157939980960)
,p_page_template_id=>wwv_flow_api.id(1488831444980960)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1489464382980960)
,p_page_template_id=>wwv_flow_api.id(1488831444980960)
,p_name=>'Dialog Header'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1489760503980960)
,p_page_template_id=>wwv_flow_api.id(1488831444980960)
,p_name=>'Dialog Footer'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/right_side_column
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(1490377407980960)
,p_theme_id=>42
,p_name=>'Right Side Column'
,p_internal_name=>'RIGHT_SIDE_COLUMN'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.rightSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8"> ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Icon fa fa-bars" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'#SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">',
'      #REGION_POSITION_01#',
'    </div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      <div class="t-Body-contentInner">',
'        #BODY#',
'      </div>',
'      <footer class="t-Footer">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>  ',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'  <div class="t-Body-actions" id="t_Body_actions">',
'    <button class="t-Button t-Button--icon t-Button--header t-Button--headerRight" title="#EXPAND_COLLAPSE_SIDE_COL_LABEL#" id="t_Button_rightControlButton" type="button"><span class="t-Icon fa fa-bars" aria-hidden="true"></span></button>',
'    <div class="t-Body-actionsContent">',
'    #REGION_POSITION_03#',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">',
'  #REGION_POSITION_04#',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>false
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525200116240651575
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1490672219980961)
,p_page_template_id=>wwv_flow_api.id(1490377407980960)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1490912588980961)
,p_page_template_id=>wwv_flow_api.id(1490377407980960)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1491217152980961)
,p_page_template_id=>wwv_flow_api.id(1490377407980960)
,p_name=>'Right Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1491572687980961)
,p_page_template_id=>wwv_flow_api.id(1490377407980960)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1491811216980961)
,p_page_template_id=>wwv_flow_api.id(1490377407980960)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1492121036980963)
,p_page_template_id=>wwv_flow_api.id(1490377407980960)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1492412394980965)
,p_page_template_id=>wwv_flow_api.id(1490377407980960)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1492792661980965)
,p_page_template_id=>wwv_flow_api.id(1490377407980960)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/standard
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(1493180315980965)
,p_theme_id=>42
,p_name=>'Standard'
,p_internal_name=>'STANDARD'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.noSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#  ',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft t-PageBody--hideActions no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Icon fa fa-bars" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>',
'    '))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'      <div class="t-Body-title" id="t_Body_title">',
'        #REGION_POSITION_01#',
'      </div>',
'      <div class="t-Body-content" id="t_Body_content">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-contentInner">',
'          #BODY#',
'        </div>',
'        <footer class="t-Footer">',
'          <div class="t-Footer-body">',
'            <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'            <div class="t-Footer-apex">',
'              <div class="t-Footer-version">#APP_VERSION#</div>  ',
'              <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'              #BUILT_WITH_LOVE_USING_APEX#',
'            </div>',
'          </div>',
'          <div class="t-Footer-top">',
'            <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'          </div>',
'        </footer>',
'      </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">',
'  #REGION_POSITION_04#',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>',
''))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar t-NavigationBar--classic" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>1
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>4070909157481059304
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1493488301980965)
,p_page_template_id=>wwv_flow_api.id(1493180315980965)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1493781164980966)
,p_page_template_id=>wwv_flow_api.id(1493180315980965)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1494098062980966)
,p_page_template_id=>wwv_flow_api.id(1493180315980965)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1494382787980966)
,p_page_template_id=>wwv_flow_api.id(1493180315980965)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1494681042980966)
,p_page_template_id=>wwv_flow_api.id(1493180315980965)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1494977755980967)
,p_page_template_id=>wwv_flow_api.id(1493180315980965)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1495296020980967)
,p_page_template_id=>wwv_flow_api.id(1493180315980965)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>false
);
end;
/
prompt --application/shared_components/user_interface/templates/page/wizard_modal_dialog
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(1495609046980967)
,p_theme_id=>42
,p_name=>'Wizard Modal Dialog'
,p_internal_name=>'WIZARD_MODAL_DIALOG'
,p_is_popup=>true
,p_javascript_code_onload=>'apex.theme42.initializePage.wizardModal();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>',
'</head>',
'<body class="t-Dialog-page t-Dialog-page--wizard #DIALOG_CSS_CLASSES# #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Dialog" role="dialog" aria-label="#TITLE#">',
'  <div class="t-Dialog-header">#REGION_POSITION_01#</div>',
'  <div class="t-Dialog-bodyWrapperOut">',
'      <div class="t-Dialog-bodyWrapperIn"><div class="t-Dialog-body">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      #BODY#',
'      </div></div>',
'  </div>',
'  <div class="t-Dialog-footer">#REGION_POSITION_03#</div>',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_theme_class_id=>3
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},''t-Dialog-page--wizard ''+#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_height=>'auto'
,p_dialog_width=>'720'
,p_dialog_max_width=>'960'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2120348229686426515
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1495978853980967)
,p_page_template_id=>wwv_flow_api.id(1495609046980967)
,p_name=>'Wizard Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1496288646980968)
,p_page_template_id=>wwv_flow_api.id(1495609046980967)
,p_name=>'Wizard Progress Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(1496506119980968)
,p_page_template_id=>wwv_flow_api.id(1495609046980967)
,p_name=>'Wizard Buttons'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/button/icon
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(1574392235981031)
,p_template_name=>'Icon'
,p_internal_name=>'ICON'
,p_template=>'<button class="t-Button t-Button--noLabel t-Button--icon #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" title="#LABEL#" aria-label="#LABEL#"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"><'
||'/span></button>'
,p_hot_template=>'<button class="t-Button t-Button--noLabel t-Button--icon #BUTTON_CSS_CLASSES# t-Button--hot" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" title="#LABEL#" aria-label="#LABEL#"><span class="t-Icon #ICON_CSS_CLASSES#" aria-h'
||'idden="true"></span></button>'
,p_reference_id=>2347660919680321258
,p_translate_this_template=>'N'
,p_theme_class_id=>5
,p_theme_id=>42
);
end;
/
prompt --application/shared_components/user_interface/templates/button/text
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(1574484596981032)
,p_template_name=>'Text'
,p_internal_name=>'TEXT'
,p_template=>'<button onclick="#JAVASCRIPT#" class="t-Button #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#"><span class="t-Button-label">#LABEL#</span></button>'
,p_hot_template=>'<button onclick="#JAVASCRIPT#" class="t-Button t-Button--hot #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#"><span class="t-Button-label">#LABEL#</span></button>'
,p_reference_id=>4070916158035059322
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>42
);
end;
/
prompt --application/shared_components/user_interface/templates/button/text_with_icon
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(1574539776981032)
,p_template_name=>'Text with Icon'
,p_internal_name=>'TEXT_WITH_ICON'
,p_template=>'<button class="t-Button t-Button--icon #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#"><span class="t-Icon t-Icon--left #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-Button-label">#LABEL#'
||'</span><span class="t-Icon t-Icon--right #ICON_CSS_CLASSES#" aria-hidden="true"></span></button>'
,p_hot_template=>'<button class="t-Button t-Button--icon #BUTTON_CSS_CLASSES# t-Button--hot" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#"><span class="t-Icon t-Icon--left #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-Button-'
||'label">#LABEL#</span><span class="t-Icon t-Icon--right #ICON_CSS_CLASSES#" aria-hidden="true"></span></button>'
,p_reference_id=>2081382742158699622
,p_translate_this_template=>'N'
,p_theme_class_id=>4
,p_preset_template_options=>'t-Button--iconRight'
,p_theme_id=>42
);
end;
/
prompt --application/shared_components/user_interface/templates/region/alert
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(1497177462980969)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-header">',
'        <h2 class="t-Alert-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'      </div>',
'      <div class="t-Alert-body">#BODY#</div>',
'    </div>',
'    <div class="t-Alert-buttons">#PREVIOUS##CLOSE##CREATE##NEXT#</div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Alert'
,p_internal_name=>'ALERT'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>21
,p_preset_template_options=>'t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--warning'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2039236646100190748
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(1497429917980972)
,p_plug_template_id=>wwv_flow_api.id(1497177462980969)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/blank_with_attributes
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(1500825512980975)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="#REGION_CSS_CLASSES#"> ',
'#PREVIOUS##BODY##SUB_REGIONS##NEXT#',
'</div>'))
,p_page_plug_template_name=>'Blank with Attributes'
,p_internal_name=>'BLANK_WITH_ATTRIBUTES'
,p_theme_id=>42
,p_theme_class_id=>7
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>4499993862448380551
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/blank_with_attributes_no_grid
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(1501023206980975)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="#REGION_CSS_CLASSES#"> ',
'#PREVIOUS##BODY##SUB_REGIONS##NEXT#',
'</div>'))
,p_page_plug_template_name=>'Blank with Attributes (No Grid)'
,p_internal_name=>'BLANK_WITH_ATTRIBUTES_NO_GRID'
,p_theme_id=>42
,p_theme_class_id=>7
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>3369790999010910123
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(1501319114980975)
,p_plug_template_id=>wwv_flow_api.id(1501023206980975)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(1501688067980976)
,p_plug_template_id=>wwv_flow_api.id(1501023206980975)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/buttons_container
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(1501892526980976)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ButtonRegion t-Form--floatLeft #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-ButtonRegion-wrap">',
'    <div class="t-ButtonRegion-col t-ButtonRegion-col--left"><div class="t-ButtonRegion-buttons">#PREVIOUS##CLOSE##DELETE#</div></div>',
'    <div class="t-ButtonRegion-col t-ButtonRegion-col--content">',
'      <h2 class="t-ButtonRegion-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'      #BODY#',
'      <div class="t-ButtonRegion-buttons">#CHANGE#</div>',
'    </div>',
'    <div class="t-ButtonRegion-col t-ButtonRegion-col--right"><div class="t-ButtonRegion-buttons">#EDIT##CREATE##NEXT#</div></div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Buttons Container'
,p_internal_name=>'BUTTONS_CONTAINER'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>17
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2124982336649579661
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(1502119321980976)
,p_plug_template_id=>wwv_flow_api.id(1501892526980976)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(1502485113980976)
,p_plug_template_id=>wwv_flow_api.id(1501892526980976)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/carousel_container
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(1504004054980977)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Region t-Region--carousel #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
' <div class="t-Region-header">',
'  <div class="t-Region-headerItems t-Region-headerItems--title">',
'    <span class="t-Region-headerIcon"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span></span>',
'    <h2 class="t-Region-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--buttons">#COPY##EDIT#<span class="js-maximizeButtonContainer"></span></div>',
' </div>',
' <div class="t-Region-bodyWrap">',
'   <div class="t-Region-buttons t-Region-buttons--top">',
'    <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'    <div class="t-Region-buttons-right">#NEXT#</div>',
'   </div>',
'   <div class="t-Region-body">',
'     #BODY#',
'   <div class="t-Region-carouselRegions">',
'     #SUB_REGIONS#',
'   </div>',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#CLOSE##HELP#</div>',
'    <div class="t-Region-buttons-right">#DELETE##CHANGE##CREATE#</div>',
'   </div>',
' </div>',
'</div>'))
,p_sub_plug_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div data-label="#SUB_REGION_TITLE#" id="SR_#SUB_REGION_ID#">',
'  #SUB_REGION#',
'</div>'))
,p_page_plug_template_name=>'Carousel Container'
,p_internal_name=>'CAROUSEL_CONTAINER'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#plugins/com.oracle.apex.carousel/1.1/com.oracle.apex.carousel#MIN#.js?v=#APEX_VERSION#'))
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>5
,p_default_template_options=>'t-Region--showCarouselControls'
,p_preset_template_options=>'t-Region--hiddenOverflow'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2865840475322558786
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(1504389692980977)
,p_plug_template_id=>wwv_flow_api.id(1504004054980977)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(1504668308980977)
,p_plug_template_id=>wwv_flow_api.id(1504004054980977)
,p_name=>'Slides'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/collapsible
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(1511275695980981)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Region t-Region--hideShow #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
' <div class="t-Region-header">',
'  <div class="t-Region-headerItems  t-Region-headerItems--controls">',
'    <button class="t-Button t-Button--icon t-Button--hideShow" type="button"></button>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--title">',
'    <h2 class="t-Region-title">#TITLE#</h2>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--buttons">#EDIT#</div>',
' </div>',
' <div class="t-Region-bodyWrap">',
'   <div class="t-Region-buttons t-Region-buttons--top">',
'    <div class="t-Region-buttons-left">#CLOSE#</div>',
'    <div class="t-Region-buttons-right">#CREATE#</div>',
'   </div>',
'   <div class="t-Region-body">',
'     #COPY#',
'     #BODY#',
'     #SUB_REGIONS#',
'     #CHANGE#',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'    <div class="t-Region-buttons-right">#NEXT#</div>',
'   </div>',
' </div>',
'</div>'))
,p_page_plug_template_name=>'Collapsible'
,p_internal_name=>'COLLAPSIBLE'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>1
,p_preset_template_options=>'is-expanded:t-Region--scrollBody'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2662888092628347716
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(1511517258980982)
,p_plug_template_id=>wwv_flow_api.id(1511275695980981)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(1511846638980982)
,p_plug_template_id=>wwv_flow_api.id(1511275695980981)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/content_block
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(1515845100980984)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ContentBlock #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-ContentBlock-header"><h1 class="t-ContentBlock-title">#TITLE#</h1></div>',
'  <div class="t-ContentBlock-body">#BODY#</div>',
'  <div class="t-ContentBlock-buttons">#PREVIOUS##NEXT#</div>',
'</div>'))
,p_page_plug_template_name=>'Content Block'
,p_internal_name=>'CONTENT_BLOCK'
,p_theme_id=>42
,p_theme_class_id=>21
,p_preset_template_options=>'t-ContentBlock--h1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2320668864738842174
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/hero
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(1517636123980985)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-HeroRegion #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-HeroRegion-wrap">',
'    <div class="t-HeroRegion-col t-HeroRegion-col--left"><span class="t-HeroRegion-icon t-Icon #ICON_CSS_CLASSES#"></span></div>',
'    <div class="t-HeroRegion-col t-HeroRegion-col--content">',
'      <h1 class="t-HeroRegion-title">#TITLE#</h1>',
'      #BODY#',
'    </div>',
'    <div class="t-HeroRegion-col t-HeroRegion-col--right"><div class="t-HeroRegion-form">#SUB_REGIONS#</div><div class="t-HeroRegion-buttons">#NEXT#</div></div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Hero'
,p_internal_name=>'HERO'
,p_theme_id=>42
,p_theme_class_id=>22
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2672571031438297268
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(1517971102980985)
,p_plug_template_id=>wwv_flow_api.id(1517636123980985)
,p_name=>'Region Body'
,p_placeholder=>'#BODY#'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/inline_dialog
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(1519149744980986)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#_parent">',
'<div id="#REGION_STATIC_ID#"  class="t-DialogRegion #REGION_CSS_CLASSES# js-regionDialog" #REGION_ATTRIBUTES# style="display:none" title="#TITLE#">',
'  <div class="t-DialogRegion-wrap">',
'    <div class="t-DialogRegion-bodyWrapperOut"><div class="t-DialogRegion-bodyWrapperIn"><div class="t-DialogRegion-body">#BODY#</div></div></div>',
'    <div class="t-DialogRegion-buttons">',
'       <div class="t-ButtonRegion t-ButtonRegion--dialogRegion">',
'         <div class="t-ButtonRegion-wrap">',
'           <div class="t-ButtonRegion-col t-ButtonRegion-col--left"><div class="t-ButtonRegion-buttons">#PREVIOUS##DELETE##CLOSE#</div></div>',
'           <div class="t-ButtonRegion-col t-ButtonRegion-col--right"><div class="t-ButtonRegion-buttons">#EDIT##CREATE##NEXT#</div></div>',
'         </div>',
'       </div>',
'    </div>',
'  </div>',
'</div>',
'</div>'))
,p_page_plug_template_name=>'Inline Dialog'
,p_internal_name=>'INLINE_DIALOG'
,p_theme_id=>42
,p_theme_class_id=>24
,p_default_template_options=>'js-modal:js-draggable:js-resizable'
,p_preset_template_options=>'js-dialog-size600x400'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2671226943886536762
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(1519471356980986)
,p_plug_template_id=>wwv_flow_api.id(1519149744980986)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/interactive_report
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(1521218643980987)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="t-IRR-region #REGION_CSS_CLASSES#">',
'  <h2 class="u-VisuallyHidden" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'#PREVIOUS##BODY##SUB_REGIONS##NEXT#',
'</div>'))
,p_page_plug_template_name=>'Interactive Report'
,p_internal_name=>'INTERACTIVE_REPORT'
,p_theme_id=>42
,p_theme_class_id=>9
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2099079838218790610
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/login
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(1521882212980987)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Login-region t-Form--stretchInputs t-Form--labelsAbove #REGION_CSS_CLASSES#" id="#REGION_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-Login-header">',
'    <span class="t-Login-logo #ICON_CSS_CLASSES#"></span>',
'    <h1 class="t-Login-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h1>',
'  </div>',
'  <div class="t-Login-body">',
'    #BODY#',
'  </div>',
'  <div class="t-Login-buttons">',
'    #NEXT#',
'  </div>',
'  <div class="t-Login-links">',
'    #EDIT##CREATE#',
'  </div>',
'  #SUB_REGIONS#',
'</div>'))
,p_page_plug_template_name=>'Login'
,p_internal_name=>'LOGIN'
,p_theme_id=>42
,p_theme_class_id=>23
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2672711194551076376
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(1522163234980988)
,p_plug_template_id=>wwv_flow_api.id(1521882212980987)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/standard
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(1522385093980988)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Region #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
' <div class="t-Region-header">',
'  <div class="t-Region-headerItems t-Region-headerItems--title">',
'    <span class="t-Region-headerIcon"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span></span>',
'    <h2 class="t-Region-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--buttons">#COPY##EDIT#<span class="js-maximizeButtonContainer"></span></div>',
' </div>',
' <div class="t-Region-bodyWrap">',
'   <div class="t-Region-buttons t-Region-buttons--top">',
'    <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'    <div class="t-Region-buttons-right">#NEXT#</div>',
'   </div>',
'   <div class="t-Region-body">',
'     #BODY#',
'     #SUB_REGIONS#',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#CLOSE##HELP#</div>',
'    <div class="t-Region-buttons-right">#DELETE##CHANGE##CREATE#</div>',
'   </div>',
' </div>',
'</div>',
''))
,p_page_plug_template_name=>'Standard'
,p_internal_name=>'STANDARD'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>8
,p_preset_template_options=>'t-Region--scrollBody'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>4070912133526059312
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(1522608300980988)
,p_plug_template_id=>wwv_flow_api.id(1522385093980988)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(1522996683980988)
,p_plug_template_id=>wwv_flow_api.id(1522385093980988)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/tabs_container
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(1529147161980992)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-TabsRegion #REGION_CSS_CLASSES# apex-tabs-region" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  #BODY#',
'  <div class="t-TabsRegion-items">',
'    #SUB_REGIONS#',
'  </div>',
'</div>'))
,p_sub_plug_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div data-label="#SUB_REGION_TITLE#" id="SR_#SUB_REGION_ID#">',
'  #SUB_REGION#',
'</div>'))
,p_page_plug_template_name=>'Tabs Container'
,p_internal_name=>'TABS_CONTAINER'
,p_javascript_file_urls=>'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#'
,p_theme_id=>42
,p_theme_class_id=>5
,p_preset_template_options=>'t-TabsRegion-mod--simple'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>3221725015618492759
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(1529424319980992)
,p_plug_template_id=>wwv_flow_api.id(1529147161980992)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(1529761428980992)
,p_plug_template_id=>wwv_flow_api.id(1529147161980992)
,p_name=>'Tabs'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/title_bar
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(1531766544980993)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="t-BreadcrumbRegion #REGION_CSS_CLASSES#"> ',
'  <div class="t-BreadcrumbRegion-body">',
'    <div class="t-BreadcrumbRegion-breadcrumb">',
'      #BODY#',
'    </div>',
'    <div class="t-BreadcrumbRegion-title">',
'      <h1 class="t-BreadcrumbRegion-titleText">#TITLE#</h1>',
'    </div>',
'  </div>',
'  <div class="t-BreadcrumbRegion-buttons">#PREVIOUS##CLOSE##DELETE##HELP##CHANGE##EDIT##COPY##CREATE##NEXT#</div>',
'</div>'))
,p_page_plug_template_name=>'Title Bar'
,p_internal_name=>'TITLE_BAR'
,p_theme_id=>42
,p_theme_class_id=>6
,p_default_template_options=>'t-BreadcrumbRegion--showBreadcrumb'
,p_preset_template_options=>'t-BreadcrumbRegion--useBreadcrumbTitle'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2530016523834132090
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/wizard_container
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(1532765651980994)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Wizard #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-Wizard-header">',
'    <h1 class="t-Wizard-title">#TITLE#</h1>',
'    <div class="u-Table t-Wizard-controls">',
'      <div class="u-Table-fit t-Wizard-buttons">#PREVIOUS##CLOSE#</div>',
'      <div class="u-Table-fill t-Wizard-steps">',
'        #BODY#',
'      </div>',
'      <div class="u-Table-fit t-Wizard-buttons">#NEXT#</div>',
'    </div>',
'  </div>',
'  <div class="t-Wizard-body">',
'    #SUB_REGIONS#',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Wizard Container'
,p_internal_name=>'WIZARD_CONTAINER'
,p_theme_id=>42
,p_theme_class_id=>8
,p_preset_template_options=>'t-Wizard--hideStepsXSmall'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2117602213152591491
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(1533034086980994)
,p_plug_template_id=>wwv_flow_api.id(1532765651980994)
,p_name=>'Wizard Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/list/badge_list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(1553457955981011)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item #A02#">',
'  <a class="t-BadgeList-wrap u-color #A04#" href="#LINK#" #A03#>',
'  <span class="t-BadgeList-label">#TEXT#</span>',
'  <span class="t-BadgeList-value">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item #A02#">',
'  <a class="t-BadgeList-wrap u-color #A04#" href="#LINK#" #A03#>',
'  <span class="t-BadgeList-label">#TEXT#</span>',
'  <span class="t-BadgeList-value">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_name=>'Badge List'
,p_internal_name=>'BADGE_LIST'
,p_theme_id=>42
,p_theme_class_id=>3
,p_preset_template_options=>'t-BadgeList--large:t-BadgeList--cols t-BadgeList--3cols:t-BadgeList--circular'
,p_list_template_before_rows=>'<ul class="t-BadgeList #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Value'
,p_a02_label=>'List item CSS Classes'
,p_a03_label=>'Link Attributes'
,p_a04_label=>'Link Classes'
,p_reference_id=>2062482847268086664
,p_list_template_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'A01: Large Number',
'A02: List Item Classes',
'A03: Link Attributes'))
);
end;
/
prompt --application/shared_components/user_interface/templates/list/cards
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(1557402507981015)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item is-active #A04#">',
'  <div class="t-Card">',
'    <a href="#LINK#" class="t-Card-wrap" #A05#>',
'      <div class="t-Card-icon u-color #A06#"><span class="t-Icon #ICON_CSS_CLASSES#"><span class="t-Card-initials" role="presentation">#A03#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#TEXT#</h3><h4 class="t-Card-subtitle">#A07#</h4></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#A01#</div>',
'        <div class="t-Card-info">#A02#</div>',
'      </div>',
'      <span class="t-Card-colorFill u-color #A06#"></span>',
'    </a>',
'  </div>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item #A04#">',
'  <div class="t-Card">',
'    <a href="#LINK#" class="t-Card-wrap" #A05#>',
'      <div class="t-Card-icon u-color #A06#"><span class="t-Icon #ICON_CSS_CLASSES#"><span class="t-Card-initials" role="presentation">#A03#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#TEXT#</h3><h4 class="t-Card-subtitle">#A07#</h4></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#A01#</div>',
'        <div class="t-Card-info">#A02#</div>',
'      </div>',
'      <span class="t-Card-colorFill u-color #A06#"></span>',
'    </a>',
'  </div>',
'</li>'))
,p_list_template_name=>'Cards'
,p_internal_name=>'CARDS'
,p_theme_id=>42
,p_theme_class_id=>4
,p_preset_template_options=>'t-Cards--animColorFill:t-Cards--3cols:t-Cards--basic'
,p_list_template_before_rows=>'<ul class="t-Cards #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Description'
,p_a02_label=>'Secondary Information'
,p_a03_label=>'Initials'
,p_a04_label=>'List Item CSS Classes'
,p_a05_label=>'Link Attributes'
,p_a06_label=>'Card Color Class'
,p_a07_label=>'Subtitle'
,p_reference_id=>2885322685880632508
);
end;
/
prompt --application/shared_components/user_interface/templates/list/links_list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(1562409980981018)
,p_list_template_current=>'<li class="t-LinksList-item is-current #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-b'
||'adge">#A01#</span></a></li>'
,p_list_template_noncurrent=>'<li class="t-LinksList-item #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-badge">#A01#'
||'</span></a></li>'
,p_list_template_name=>'Links List'
,p_internal_name=>'LINKS_LIST'
,p_theme_id=>42
,p_theme_class_id=>18
,p_list_template_before_rows=>'<ul class="t-LinksList #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'
,p_list_template_after_rows=>'</ul>'
,p_before_sub_list=>'<ul class="t-LinksList-list">'
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>'<li class="t-LinksList-item is-current #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-b'
||'adge">#A01#</span></a></li>'
,p_sub_list_item_noncurrent=>'<li class="t-LinksList-item#A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-badge">#A01#<'
||'/span></a></li>'
,p_item_templ_curr_w_child=>'<li class="t-LinksList-item is-current is-expanded #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t'
||'-LinksList-badge">#A01#</span></a>#SUB_LISTS#</li>'
,p_item_templ_noncurr_w_child=>'<li class="t-LinksList-item #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-badge">#A01#'
||'</span></a></li>'
,p_a01_label=>'Badge Value'
,p_a02_label=>'Link Attributes'
,p_a03_label=>'List Item CSS Classes'
,p_reference_id=>4070914341144059318
);
end;
/
prompt --application/shared_components/user_interface/templates/list/media_list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(1564028367981019)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item is-active #A04#">',
'    <a href="#LINK#" class="t-MediaList-itemWrap #A05#" #A03#>',
'        <div class="t-MediaList-iconWrap">',
'            <span class="t-MediaList-icon u-color #A06#"><span class="t-Icon #ICON_CSS_CLASSES#" #IMAGE_ATTR#></span></span>',
'        </div>',
'        <div class="t-MediaList-body">',
'            <h3 class="t-MediaList-title">#TEXT#</h3>',
'            <p class="t-MediaList-desc">#A01#</p>',
'        </div>',
'        <div class="t-MediaList-badgeWrap">',
'            <span class="t-MediaList-badge">#A02#</span>',
'        </div>',
'    </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item  #A04#">',
'    <a href="#LINK#" class="t-MediaList-itemWrap #A05#" #A03#>',
'        <div class="t-MediaList-iconWrap">',
'            <span class="t-MediaList-icon u-color #A06#"><span class="t-Icon #ICON_CSS_CLASSES#" #IMAGE_ATTR#></span></span>',
'        </div>',
'        <div class="t-MediaList-body">',
'            <h3 class="t-MediaList-title">#TEXT#</h3>',
'            <p class="t-MediaList-desc">#A01#</p>',
'        </div>',
'        <div class="t-MediaList-badgeWrap">',
'            <span class="t-MediaList-badge">#A02#</span>',
'        </div>',
'    </a>',
'</li>'))
,p_list_template_name=>'Media List'
,p_internal_name=>'MEDIA_LIST'
,p_theme_id=>42
,p_theme_class_id=>5
,p_default_template_options=>'t-MediaList--showIcons:t-MediaList--showDesc'
,p_list_template_before_rows=>'<ul class="t-MediaList #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Description'
,p_a02_label=>'Badge Value'
,p_a03_label=>'Link Attributes'
,p_a04_label=>'List Item CSS Classes'
,p_a05_label=>'Link Class'
,p_a06_label=>'Icon Color Class'
,p_reference_id=>2066548068783481421
);
end;
/
prompt --application/shared_components/user_interface/templates/list/menu_bar
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(1566494090981020)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Menu Bar'
,p_internal_name=>'MENU_BAR'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("##PARENT_STATIC_ID#_menubar", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  apex.actions.addFromMarkup( e );',
'}',
'e.menu({',
'  behaveLikeTabs: e.hasClass("js-tabLike"),',
'  menubarShowSubMenuIcon: e.hasClass("js-showSubMenuIcons") || null,',
'  iconType: ''fa'',',
'  slide: e.hasClass("js-slide"),',
'  menubar: true,',
'  menubarOverflow: true',
'});'))
,p_theme_id=>42
,p_theme_class_id=>20
,p_default_template_options=>'js-showSubMenuIcons'
,p_list_template_before_rows=>'<div class="t-MenuBar #COMPONENT_CSS_CLASSES#" id="#PARENT_STATIC_ID#_menubar"><ul style="display:none">'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_reference_id=>2008709236185638887
);
end;
/
prompt --application/shared_components/user_interface/templates/list/menu_popup
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(1567452134981022)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>',
''))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>',
''))
,p_list_template_name=>'Menu Popup'
,p_internal_name=>'MENU_POPUP'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("##PARENT_STATIC_ID#_menu", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  apex.actions.addFromMarkup( e );',
'}',
'e.menu({ slide: e.hasClass("js-slide")});'))
,p_theme_id=>42
,p_theme_class_id=>20
,p_list_template_before_rows=>'<div id="#PARENT_STATIC_ID#_menu" class="#COMPONENT_CSS_CLASSES#" style="display:none;"><ul>'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'Data ID'
,p_a02_label=>'Disabled (True/False)'
,p_a03_label=>'Hidden (True/False)'
,p_a04_label=>'Title Attribute'
,p_a05_label=>'Shortcut'
,p_reference_id=>3492264004432431646
);
end;
/
prompt --application/shared_components/user_interface/templates/list/navigation_bar
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(1567626872981022)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item is-active #A02#">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item #A02#">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_name=>'Navigation Bar'
,p_internal_name=>'NAVIGATION_BAR'
,p_theme_id=>42
,p_theme_class_id=>20
,p_list_template_before_rows=>'<ul class="t-NavigationBar #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'
,p_list_template_after_rows=>'</ul>'
,p_before_sub_list=>'<div class="t-NavigationBar-menu" style="display: none" id="menu_#PARENT_LIST_ITEM_ID#"><ul>'
,p_after_sub_list=>'</ul></div></li>'
,p_sub_list_item_current=>'<li data-current="true" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-current="false" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item is-active #A02#">',
'  <button class="t-Button t-Button--icon t-Button t-Button--header t-Button--navBar js-menuButton" type="button" id="#LIST_ITEM_ID#" data-menu="menu_#LIST_ITEM_ID#">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span><span class="a-Icon icon-down-arrow"></span>',
'  </button>'))
,p_item_templ_noncurr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item #A02#">',
'  <button class="t-Button t-Button--icon t-Button t-Button--header t-Button--navBar js-menuButton" type="button" id="#LIST_ITEM_ID#" data-menu="menu_#LIST_ITEM_ID#">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span><span class="a-Icon icon-down-arrow"></span>',
'  </button>'))
,p_sub_templ_curr_w_child=>'<li data-current="true" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_sub_templ_noncurr_w_child=>'<li data-current="false" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_a01_label=>'Badge Value'
,p_a02_label=>'List  Item CSS Classes'
,p_reference_id=>2846096252961119197
);
end;
/
prompt --application/shared_components/user_interface/templates/list/side_navigation_menu
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(1567840590981022)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Side Navigation Menu'
,p_internal_name=>'SIDE_NAVIGATION_MENU'
,p_javascript_file_urls=>'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.treeView#MIN#.js?v=#APEX_VERSION#'
,p_javascript_code_onload=>'apex.jQuery(''body'').addClass(''t-PageBody--leftNav'');'
,p_theme_id=>42
,p_theme_class_id=>19
,p_list_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-nav" id="t_Body_nav" role="navigation" aria-label="&APP_TITLE!ATTR.">',
'<div class="t-TreeNav #COMPONENT_CSS_CLASSES#" id="t_TreeNav" data-id="#PARENT_STATIC_ID#_tree" aria-label="&APP_TITLE!ATTR."><ul style="display:none">'))
,p_list_template_after_rows=>'</ul></div></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'ID Attribute'
,p_a02_label=>'Disabled True/False'
,p_a04_label=>'Title'
,p_reference_id=>2466292414354694776
);
end;
/
prompt --application/shared_components/user_interface/templates/list/tabs
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(1568278099981024)
,p_list_template_current=>'<li class="t-Tabs-item is-active"><a href="#LINK#" class="t-Tabs-link"><span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Tabs-label">#TEXT#</span></a></li>'
,p_list_template_noncurrent=>'<li class="t-Tabs-item"><a href="#LINK#" class="t-Tabs-link"><span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Tabs-label">#TEXT#</span></a></li>'
,p_list_template_name=>'Tabs'
,p_internal_name=>'TABS'
,p_javascript_file_urls=>'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#'
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-Tabs--simple'
,p_list_template_before_rows=>'<ul class="t-Tabs #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_reference_id=>3288206686691809997
);
end;
/
prompt --application/shared_components/user_interface/templates/list/top_navigation_menu
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(1569820044981024)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Top Navigation Menu'
,p_internal_name=>'TOP_NAVIGATION_MENU'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("##PARENT_STATIC_ID#_menubar", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  if ( apex.actions ) {',
'    apex.actions.addFromMarkup( e );',
'  } else {',
'    apex.debug.warn("Include actions.js to support menu shortcuts");',
'  }',
'}',
'e.menu({',
'  behaveLikeTabs: e.hasClass("js-tabLike"),',
'  menubarShowSubMenuIcon: e.hasClass("js-showSubMenuIcons") || null,',
'  slide: e.hasClass("js-slide"),',
'  menubar: true,',
'  menubarOverflow: true',
'});'))
,p_theme_id=>42
,p_theme_class_id=>20
,p_default_template_options=>'js-tabLike'
,p_list_template_before_rows=>'<div class="t-Header-nav-list #COMPONENT_CSS_CLASSES#" id="#PARENT_STATIC_ID#_menubar"><ul style="display:none">'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'ID Attribute'
,p_a02_label=>'Disabled True / False'
,p_a03_label=>'Hide'
,p_a04_label=>'Title Attribute'
,p_a05_label=>'Shortcut Key'
,p_reference_id=>2525307901300239072
);
end;
/
prompt --application/shared_components/user_interface/templates/list/top_navigation_tabs
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(1570849575981025)
,p_list_template_current=>'<li class="t-NavTabs-item #A03# is-active" id="#A01#"><a href="#LINK#" class="t-NavTabs-link #A04# " title="#TEXT_ESC_SC#"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-NavTabs-label">#TEXT_ESC_SC#</span><span class'
||'="t-NavTabs-badge #A05#">#A02#</span></a></li>'
,p_list_template_noncurrent=>'<li class="t-NavTabs-item #A03#" id="#A01#"><a href="#LINK#" class="t-NavTabs-link #A04# " title="#TEXT_ESC_SC#"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-NavTabs-label">#TEXT_ESC_SC#</span><span class="t-NavTab'
||'s-badge #A05#">#A02#</span></a></li>'
,p_list_template_name=>'Top Navigation Tabs'
,p_internal_name=>'TOP_NAVIGATION_TABS'
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-NavTabs--inlineLabels-lg:t-NavTabs--displayLabels-sm'
,p_list_template_before_rows=>'<ul class="t-NavTabs #COMPONENT_CSS_CLASSES#" id="#PARENT_STATIC_ID#_navtabs">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'List Item ID'
,p_a02_label=>'Badge Value'
,p_a03_label=>'List Item Class'
,p_a04_label=>'Link Class'
,p_a05_label=>'Badge Class'
,p_reference_id=>1453011561172885578
);
end;
/
prompt --application/shared_components/user_interface/templates/list/wizard_progress
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(1572406021981027)
,p_list_template_current=>'<li class="t-WizardSteps-step is-active" id="#LIST_ITEM_ID#"><div class="t-WizardSteps-wrap"><span class="t-WizardSteps-marker"></span><span class="t-WizardSteps-label">#TEXT# <span class="t-WizardSteps-labelState"></span></span></div></li>'
,p_list_template_noncurrent=>'<li class="t-WizardSteps-step" id="#LIST_ITEM_ID#"><div class="t-WizardSteps-wrap"><span class="t-WizardSteps-marker"><span class="t-Icon a-Icon icon-check"></span></span><span class="t-WizardSteps-label">#TEXT# <span class="t-WizardSteps-labelState"'
||'></span></span></div></li>'
,p_list_template_name=>'Wizard Progress'
,p_internal_name=>'WIZARD_PROGRESS'
,p_javascript_code_onload=>'apex.theme.initWizardProgressBar();'
,p_theme_id=>42
,p_theme_class_id=>17
,p_preset_template_options=>'t-WizardSteps--displayLabels'
,p_list_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h2 class="u-VisuallyHidden">#CURRENT_PROGRESS#</h2>',
'<ul class="t-WizardSteps #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'))
,p_list_template_after_rows=>'</ul>'
,p_reference_id=>2008702338707394488
);
end;
/
prompt --application/shared_components/user_interface/templates/report/alerts
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(1534029907980994)
,p_row_template_name=>'Alerts'
,p_internal_name=>'ALERTS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--horizontal t-Alert--colorBG t-Alert--defaultIcons t-Alert--#ALERT_TYPE#" role="alert">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-header">',
'        <h2 class="t-Alert-title">#ALERT_TITLE#</h2>',
'      </div>',
'      <div class="t-Alert-body">',
'        #ALERT_DESC#',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      #ALERT_ACTION#',
'    </div>',
'  </div>',
'</div>'))
,p_row_template_before_rows=>'<div class="t-Alerts #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_alerts" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</div>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>14
,p_reference_id=>2881456138952347027
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/badge_list
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(1534200029980996)
,p_row_template_name=>'Badge List'
,p_internal_name=>'BADGE_LIST'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item">',
' <span class="t-BadgeList-wrap u-color">',
'  <span class="t-BadgeList-label">#COLUMN_HEADER#</span>',
'  <span class="t-BadgeList-value">#COLUMN_VALUE#</span>',
' </span>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-BadgeList #COMPONENT_CSS_CLASSES#" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>6
,p_preset_template_options=>'t-BadgeList--large:t-BadgeList--fixed:t-BadgeList--circular'
,p_reference_id=>2103197159775914759
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/cards
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(1538206665980998)
,p_row_template_name=>'Cards'
,p_internal_name=>'CARDS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item #CARD_MODIFIERS#">',
'  <div class="t-Card">',
'    <a href="#CARD_LINK#" class="t-Card-wrap">',
'      <div class="t-Card-icon u-color #CARD_COLOR#"><span class="t-Icon fa #CARD_ICON#"><span class="t-Card-initials" role="presentation">#CARD_INITIALS#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#CARD_TITLE#</h3><h4 class="t-Card-subtitle">#CARD_SUBTITLE#</h4></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#CARD_TEXT#</div>',
'        <div class="t-Card-info">#CARD_SUBTEXT#</div>',
'      </div>',
'      <span class="t-Card-colorFill u-color #CARD_COLOR#"></span>',
'    </a>',
'  </div>',
'</li>'))
,p_row_template_condition1=>':CARD_LINK is not null'
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item #CARD_MODIFIERS#">',
'  <div class="t-Card">',
'    <div class="t-Card-wrap">',
'      <div class="t-Card-icon u-color #CARD_COLOR#"><span class="t-Icon fa #CARD_ICON#"><span class="t-Card-initials" role="presentation">#CARD_INITIALS#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#CARD_TITLE#</h3><h4 class="t-Card-subtitle">#CARD_SUBTITLE#</h4></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#CARD_TEXT#</div>',
'        <div class="t-Card-info">#CARD_SUBTEXT#</div>',
'      </div>',
'      <span class="t-Card-colorFill u-color #CARD_COLOR#"></span>',
'    </div>',
'  </div>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-Cards #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_cards" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-Cards--animColorFill:t-Cards--3cols:t-Cards--basic'
,p_reference_id=>2973535649510699732
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/comments
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(1543031146981003)
,p_row_template_name=>'Comments'
,p_internal_name=>'COMMENTS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Comments-item #COMMENT_MODIFIERS#">',
'    <div class="t-Comments-icon">',
'        <div class="t-Comments-userIcon #ICON_MODIFIER#" aria-hidden="true">#USER_ICON#</div>',
'    </div>',
'    <div class="t-Comments-body">',
'        <div class="t-Comments-info">',
'            #USER_NAME# <span class="t-Comments-date">#COMMENT_DATE#</span> <span class="t-Comments-actions">#ACTIONS#</span>',
'        </div>',
'        <div class="t-Comments-comment">',
'            #COMMENT_TEXT##ATTRIBUTE_1##ATTRIBUTE_2##ATTRIBUTE_3##ATTRIBUTE_4#',
'        </div>',
'    </div>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-Comments #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_report" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>',
''))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-Comments--chat'
,p_reference_id=>2611722012730764232
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/media_list
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(1543853833981004)
,p_row_template_name=>'Media List'
,p_internal_name=>'MEDIA_LIST'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item #LIST_CLASS#">',
'    <a href="#LINK#" class="t-MediaList-itemWrap #LINK_CLASS#" #LINK_ATTR#>',
'        <div class="t-MediaList-iconWrap">',
'            <span class="t-MediaList-icon u-color #ICON_COLOR_CLASS#"><span class="t-Icon #ICON_CLASS#"></span></span>',
'        </div>',
'        <div class="t-MediaList-body">',
'            <h3 class="t-MediaList-title">#LIST_TITLE#</h3>',
'            <p class="t-MediaList-desc">#LIST_TEXT#</p>',
'        </div>',
'        <div class="t-MediaList-badgeWrap">',
'            <span class="t-MediaList-badge">#LIST_BADGE#</span>',
'        </div>',
'    </a>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-MediaList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_report" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>1
,p_default_template_options=>'t-MediaList--showDesc:t-MediaList--showIcons'
,p_preset_template_options=>'t-MediaList--stack'
,p_reference_id=>2092157460408299055
,p_translate_this_template=>'N'
,p_row_template_comment=>' (SELECT link_text, link_target, detail1, detail2, last_modified)'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/search_results
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(1546460087981006)
,p_row_template_name=>'Search Results'
,p_internal_name=>'SEARCH_RESULTS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition1=>':LABEL_02 is null'
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition2=>':LABEL_03 is null'
,p_row_template3=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'      <span class="t-SearchResults-misc">#LABEL_03#: #VALUE_03#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition3=>':LABEL_04 is null'
,p_row_template4=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'      <span class="t-SearchResults-misc">#LABEL_03#: #VALUE_03#</span>',
'      <span class="t-SearchResults-misc">#LABEL_04#: #VALUE_04#</span>',
'    </div>',
'  </li>'))
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-SearchResults #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_report" data-region-id="#REGION_STATIC_ID#">',
'<ul class="t-SearchResults-list">'))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>',
'</div>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'NOT_CONDITIONAL'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>4070913431524059316
,p_translate_this_template=>'N'
,p_row_template_comment=>' (SELECT link_text, link_target, detail1, detail2, last_modified)'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/standard
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(1546658332981006)
,p_row_template_name=>'Standard'
,p_internal_name=>'STANDARD'
,p_row_template1=>'<td class="t-Report-cell" #ALIGNMENT# headers="#COLUMN_HEADER_NAME#">#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Report #COMPONENT_CSS_CLASSES#" id="report_#REGION_STATIC_ID#" #REPORT_ATTRIBUTES# data-region-id="#REGION_STATIC_ID#">',
'  <div class="t-Report-wrap">',
'    <table class="t-Report-pagination" role="presentation">#TOP_PAGINATION#</table>',
'    <div class="t-Report-tableWrap">',
'    <table class="t-Report-report" summary="#REGION_TITLE#">'))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'      </tbody>',
'    </table>',
'    </div>',
'    <div class="t-Report-links">#EXTERNAL_LINK##CSV_LINK#</div>',
'    <table class="t-Report-pagination t-Report-pagination--bottom" role="presentation">#PAGINATION#</table>',
'  </div>',
'</div>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_before_column_heading=>'<thead>'
,p_column_heading_template=>'<th class="t-Report-colHead" #ALIGNMENT# id="#COLUMN_HEADER_NAME#" #COLUMN_WIDTH#>#COLUMN_HEADER#</th>'
,p_after_column_heading=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</thead>',
'<tbody>'))
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>4
,p_preset_template_options=>'t-Report--altRowsDefault:t-Report--rowHighlight'
,p_reference_id=>2537207537838287671
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(1546658332981006)
,p_row_template_before_first=>'<tr>'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
end;
/
prompt --application/shared_components/user_interface/templates/report/timeline
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(1549271812981008)
,p_row_template_name=>'Timeline'
,p_internal_name=>'TIMELINE'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Timeline-item #EVENT_MODIFIERS#" #EVENT_ATTRIBUTES#>',
'  <div class="t-Timeline-wrap">',
'    <div class="t-Timeline-user">',
'      <div class="t-Timeline-avatar #USER_COLOR#">',
'        #USER_AVATAR#',
'      </div>',
'      <div class="t-Timeline-userinfo">',
'        <span class="t-Timeline-username">#USER_NAME#</span>',
'        <span class="t-Timeline-date">#EVENT_DATE#</span>',
'      </div>',
'    </div>',
'    <div class="t-Timeline-content">',
'      <div class="t-Timeline-typeWrap">',
'        <div class="t-Timeline-type #EVENT_STATUS#">',
'          <span class="t-Icon #EVENT_ICON#"></span>',
'          <span class="t-Timeline-typename">#EVENT_TYPE#</span>',
'        </div>',
'      </div>',
'      <div class="t-Timeline-body">',
'        <h3 class="t-Timeline-title">#EVENT_TITLE#</h3>',
'        <p class="t-Timeline-desc">#EVENT_DESC#</p>',
'      </div>',
'    </div>',
'  </div>',
'</li>'))
,p_row_template_condition1=>':EVENT_LINK is null'
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Timeline-item #EVENT_MODIFIERS#" #EVENT_ATTRIBUTES#>',
'  <a href="#EVENT_LINK#" class="t-Timeline-wrap">',
'    <div class="t-Timeline-user">',
'      <div class="t-Timeline-avatar #USER_COLOR#">',
'        #USER_AVATAR#',
'      </div>',
'      <div class="t-Timeline-userinfo">',
'        <span class="t-Timeline-username">#USER_NAME#</span>',
'        <span class="t-Timeline-date">#EVENT_DATE#</span>',
'      </div>',
'    </div>',
'    <div class="t-Timeline-content">',
'      <div class="t-Timeline-typeWrap">',
'        <div class="t-Timeline-type #EVENT_STATUS#">',
'          <span class="t-Icon #EVENT_ICON#"></span>',
'          <span class="t-Timeline-typename">#EVENT_TYPE#</span>',
'        </div>',
'      </div>',
'      <div class="t-Timeline-body">',
'        <h3 class="t-Timeline-title">#EVENT_TITLE#</h3>',
'        <p class="t-Timeline-desc">#EVENT_DESC#</p>',
'      </div>',
'    </div>',
'  </a>',
'</li>'))
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-Timeline #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_timeline" data-region-id="#REGION_STATIC_ID#">',
''))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_reference_id=>1513373588340069864
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/value_attribute_pairs_column
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(1549668440981008)
,p_row_template_name=>'Value Attribute Pairs - Column'
,p_internal_name=>'VALUE_ATTRIBUTE_PAIRS_COLUMN'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<dt class="t-AVPList-label">',
'  #COLUMN_HEADER#',
'</dt>',
'<dd class="t-AVPList-value">',
'  #COLUMN_VALUE#',
'</dd>'))
,p_row_template_before_rows=>'<dl class="t-AVPList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</dl>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>6
,p_preset_template_options=>'t-AVPList--leftAligned'
,p_reference_id=>2099068636272681754
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/value_attribute_pairs_row
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(1551696058981010)
,p_row_template_name=>'Value Attribute Pairs - Row'
,p_internal_name=>'VALUE_ATTRIBUTE_PAIRS_ROW'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<dt class="t-AVPList-label">',
'  #1#',
'</dt>',
'<dd class="t-AVPList-value">',
'  #2#',
'</dd>'))
,p_row_template_before_rows=>'<dl class="t-AVPList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</dl>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-AVPList--leftAligned'
,p_reference_id=>2099068321678681753
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/hidden
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(1573613739981028)
,p_template_name=>'Hidden'
,p_internal_name=>'HIDDEN'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer t-Form-labelContainer--hiddenLabel col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label u-VisuallyHidden">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--hiddenLabel rel-col #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer col col-#ITEM_COLUMN_SPAN_NUMBER#"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT##HELP_TEMPLATE#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>13
,p_reference_id=>2039339104148359505
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/optional
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(1573799104981029)
,p_template_name=>'Optional'
,p_internal_name=>'OPTIONAL'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>',
'</div>',
''))
,p_before_item=>'<div class="t-Form-fieldContainer rel-col #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer col col-#ITEM_COLUMN_SPAN_NUMBER#"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT##HELP_TEMPLATE#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>3
,p_reference_id=>2317154212072806530
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/optional_above
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(1573800596981030)
,p_template_name=>'Optional - Above'
,p_internal_name=>'OPTIONAL_ABOVE'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>#HELP_TEMPLATE#',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--stacked #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>3
,p_reference_id=>3030114864004968404
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/optional_floating
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(1573985718981030)
,p_template_name=>'Optional - Floating'
,p_internal_name=>'OPTIONAL_FLOATING'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--floatingLabel #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT##HELP_TEMPLATE#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>3
,p_reference_id=>1607675164727151865
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/required
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(1574095865981030)
,p_template_name=>'Required'
,p_internal_name=>'REQUIRED'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'  <label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
' <span class="u-VisuallyHidden">(#VALUE_REQUIRED#)</span></label>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer is-required rel-col #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer col col-#ITEM_COLUMN_SPAN_NUMBER#"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT##HELP_TEMPLATE#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>4
,p_reference_id=>2525313812251712801
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/required_above
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(1574100845981030)
,p_template_name=>'Required - Above'
,p_internal_name=>'REQUIRED_ABOVE'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'  <label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
' <span class="u-VisuallyHidden">(#VALUE_REQUIRED#)</span></label> #HELP_TEMPLATE#',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--stacked is-required #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>4
,p_reference_id=>3030115129444970113
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/required_floating
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(1574270348981030)
,p_template_name=>'Required - Floating'
,p_internal_name=>'REQUIRED_FLOATING'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'  <label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
' <span class="u-VisuallyHidden">(#VALUE_REQUIRED#)</span></label>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--floatingLabel is-required #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT##HELP_TEMPLATE#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>4
,p_reference_id=>1607675344320152883
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/breadcrumb/breadcrumb
begin
wwv_flow_api.create_menu_template(
 p_id=>wwv_flow_api.id(1575297595981032)
,p_name=>'Breadcrumb'
,p_internal_name=>'BREADCRUMB'
,p_before_first=>'<ul class="t-Breadcrumb #COMPONENT_CSS_CLASSES#">'
,p_current_page_option=>'<li class="t-Breadcrumb-item is-active"><h1 class="t-Breadcrumb-label">#NAME#</h1></li>'
,p_non_current_page_option=>'<li class="t-Breadcrumb-item"><a href="#LINK#" class="t-Breadcrumb-label">#NAME#</a></li>'
,p_after_last=>'</ul>'
,p_max_levels=>6
,p_start_with_node=>'PARENT_TO_LEAF'
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>4070916542570059325
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/popuplov
begin
wwv_flow_api.create_popup_lov_template(
 p_id=>wwv_flow_api.id(1575412815981036)
,p_page_name=>'winlov'
,p_page_title=>'Search Dialog'
,p_page_html_head=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html lang="&BROWSER_LANGUAGE.">',
'<head>',
'<title>#TITLE#</title>',
'#APEX_CSS#',
'#THEME_CSS#',
'#THEME_STYLE_CSS#',
'#FAVICONS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'<meta name="viewport" content="width=device-width,initial-scale=1.0" />',
'</head>'))
,p_page_body_attr=>'onload="first_field()" class="t-Page t-Page--popupLOV"'
,p_before_field_text=>'<div class="t-PopupLOV-actions t-Form--large">'
,p_filter_width=>'20'
,p_filter_max_width=>'100'
,p_filter_text_attr=>'class="apex-item-text"'
,p_find_button_text=>'Search'
,p_find_button_attr=>'class="t-Button t-Button--hot t-Button--padLeft"'
,p_close_button_text=>'Close'
,p_close_button_attr=>'class="t-Button u-pullRight"'
,p_next_button_text=>'Next &gt;'
,p_next_button_attr=>'class="t-Button t-PopupLOV-button"'
,p_prev_button_text=>'&lt; Previous'
,p_prev_button_attr=>'class="t-Button t-PopupLOV-button"'
,p_after_field_text=>'</div>'
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'380'
,p_result_row_x_of_y=>'<div class="t-PopupLOV-pagination">Row(s) #FIRST_ROW# - #LAST_ROW#</div>'
,p_result_rows_per_pg=>100
,p_before_result_set=>'<div class="t-PopupLOV-links">'
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>2885398517835871876
,p_translate_this_template=>'N'
,p_after_result_set=>'</div>'
);
end;
/
prompt --application/shared_components/user_interface/templates/calendar/calendar
begin
wwv_flow_api.create_calendar_template(
 p_id=>wwv_flow_api.id(1575314259981034)
,p_cal_template_name=>'Calendar'
,p_internal_name=>'CALENDAR'
,p_day_of_week_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<th id="#DY#" scope="col" class="t-ClassicCalendar-dayColumn">',
'  <span class="visible-md visible-lg">#IDAY#</span>',
'  <span class="hidden-md hidden-lg">#IDY#</span>',
'</th>'))
,p_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar">',
'<h1 class="t-ClassicCalendar-title">#IMONTH# #YYYY#</h1>'))
,p_month_open_format=>'<table class="t-ClassicCalendar-calendar" cellpadding="0" cellspacing="0" border="0" summary="#IMONTH# #YYYY#">'
,p_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>',
''))
,p_day_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#">#TITLE_FORMAT#<div class="t-ClassicCalendar-dayEvents">#DATA#</div>'
,p_day_close_format=>'</td>'
,p_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#">#TITLE_FORMAT#<div class="t-ClassicCalendar-dayEvents">#DATA#</div>'
,p_weekend_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_weekend_open_format=>'<td class="t-ClassicCalendar-day is-weekend" headers="#DY#">#TITLE_FORMAT#<div class="t-ClassicCalendar-dayEvents">#DATA#</div>'
,p_weekend_close_format=>'</td>'
,p_nonday_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_nonday_open_format=>'<td class="t-ClassicCalendar-day is-inactive" headers="#DY#">'
,p_nonday_close_format=>'</td>'
,p_week_open_format=>'<tr>'
,p_week_close_format=>'</tr> '
,p_daily_title_format=>'<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1DayCalendarHolder"> <tr> <td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>'
,p_daily_open_format=>'<tr>'
,p_daily_close_format=>'</tr>'
,p_weekly_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--weekly">',
'<h1 class="t-ClassicCalendar-title">#WTITLE#</h1>'))
,p_weekly_day_of_week_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<th scope="col" class="t-ClassicCalendar-dayColumn" id="#DY#">',
'  <span class="visible-md visible-lg">#DD# #IDAY#</span>',
'  <span class="hidden-md hidden-lg">#DD# #IDY#</span>',
'</th>'))
,p_weekly_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="t-ClassicCalendar-calendar">'
,p_weekly_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_weekly_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_weekly_day_close_format=>'</div></td>'
,p_weekly_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_weekly_weekend_open_format=>'<td class="t-ClassicCalendar-day is-weekend" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_weekly_weekend_close_format=>'</div></td>'
,p_weekly_time_open_format=>'<th scope="row" class="t-ClassicCalendar-day t-ClassicCalendar-timeCol">'
,p_weekly_time_close_format=>'</th>'
,p_weekly_time_title_format=>'#TIME#'
,p_weekly_hour_open_format=>'<tr>'
,p_weekly_hour_close_format=>'</tr>'
,p_daily_day_of_week_format=>'<th scope="col" id="#DY#" class="t-ClassicCalendar-dayColumn">#IDAY#</th>'
,p_daily_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--daily">',
'<h1 class="t-ClassicCalendar-title">#IMONTH# #DD#, #YYYY#</h1>'))
,p_daily_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL#" class="t-ClassicCalendar-calendar">'
,p_daily_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_daily_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_daily_day_close_format=>'</div></td>'
,p_daily_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_daily_time_open_format=>'<th scope="row" class="t-ClassicCalendar-day t-ClassicCalendar-timeCol" id="#TIME#">'
,p_daily_time_close_format=>'</th>'
,p_daily_time_title_format=>'#TIME#'
,p_daily_hour_open_format=>'<tr>'
,p_daily_hour_close_format=>'</tr>'
,p_cust_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar">',
'<h1 class="t-ClassicCalendar-title">#IMONTH# #YYYY#</h1>'))
,p_cust_day_of_week_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<th id="#DY#" scope="col" class="t-ClassicCalendar-dayColumn">',
'  <span class="visible-md visible-lg">#IDAY#</span>',
'  <span class="hidden-md hidden-lg">#IDY#</span>',
'</th>'))
,p_cust_month_open_format=>'<table class="t-ClassicCalendar-calendar" cellpadding="0" cellspacing="0" border="0" summary="#IMONTH# #YYYY#">'
,p_cust_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_cust_week_open_format=>'<tr>'
,p_cust_week_close_format=>'</tr> '
,p_cust_day_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_cust_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#">'
,p_cust_day_close_format=>'</td>'
,p_cust_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#">'
,p_cust_nonday_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_cust_nonday_open_format=>'<td class="t-ClassicCalendar-day is-inactive" headers="#DY#">'
,p_cust_nonday_close_format=>'</td>'
,p_cust_weekend_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_cust_weekend_open_format=>'<td class="t-ClassicCalendar-day is-weekend" headers="#DY#">'
,p_cust_weekend_close_format=>'</td>'
,p_cust_hour_open_format=>'<tr>'
,p_cust_hour_close_format=>'</tr>'
,p_cust_time_title_format=>'#TIME#'
,p_cust_time_open_format=>'<th scope="row" class="t-ClassicCalendar-day t-ClassicCalendar-timeCol">'
,p_cust_time_close_format=>'</th>'
,p_cust_wk_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar">',
'<h1 class="t-ClassicCalendar-title">#WTITLE#</h1>'))
,p_cust_wk_day_of_week_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<th scope="col" class="t-ClassicCalendar-dayColumn" id="#DY#">',
'  <span class="visible-md visible-lg">#DD# #IDAY#</span>',
'  <span class="hidden-md hidden-lg">#DD# #IDY#</span>',
'</th>'))
,p_cust_wk_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="t-ClassicCalendar-calendar">'
,p_cust_wk_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_cust_wk_week_open_format=>'<tr>'
,p_cust_wk_week_close_format=>'</tr> '
,p_cust_wk_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_cust_wk_day_close_format=>'</div></td>'
,p_cust_wk_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_cust_wk_weekend_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#">'
,p_cust_wk_weekend_close_format=>'</td>'
,p_agenda_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--list">',
'  <div class="t-ClassicCalendar-title">#IMONTH# #YYYY#</div>',
'  <ul class="t-ClassicCalendar-list">',
'    #DAYS#',
'  </ul>',
'</div>'))
,p_agenda_past_day_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-past">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_today_day_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-today">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_future_day_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-future">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_past_entry_format=>'  <li class="t-ClassicCalendar-listEvent is-past">#DATA#</li>'
,p_agenda_today_entry_format=>'  <li class="t-ClassicCalendar-listEvent is-today">#DATA#</li>'
,p_agenda_future_entry_format=>'  <li class="t-ClassicCalendar-listEvent is-future">#DATA#</li>'
,p_month_data_format=>'#DAYS#'
,p_month_data_entry_format=>'<span class="t-ClassicCalendar-event">#DATA#</span>'
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>4070916747979059326
);
end;
/
prompt --application/shared_components/user_interface/themes
begin
wwv_flow_api.create_theme(
 p_id=>wwv_flow_api.id(1576699267981043)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_ui_type_name=>'DESKTOP'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_reference_id=>4070917134413059350
,p_is_locked=>false
,p_default_page_template=>wwv_flow_api.id(1493180315980965)
,p_default_dialog_template=>wwv_flow_api.id(1488831444980960)
,p_error_template=>wwv_flow_api.id(1482456696980955)
,p_printer_friendly_template=>wwv_flow_api.id(1493180315980965)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_api.id(1482456696980955)
,p_default_button_template=>wwv_flow_api.id(1574484596981032)
,p_default_region_template=>wwv_flow_api.id(1522385093980988)
,p_default_chart_template=>wwv_flow_api.id(1522385093980988)
,p_default_form_template=>wwv_flow_api.id(1522385093980988)
,p_default_reportr_template=>wwv_flow_api.id(1522385093980988)
,p_default_tabform_template=>wwv_flow_api.id(1522385093980988)
,p_default_wizard_template=>wwv_flow_api.id(1522385093980988)
,p_default_menur_template=>wwv_flow_api.id(1531766544980993)
,p_default_listr_template=>wwv_flow_api.id(1522385093980988)
,p_default_irr_template=>wwv_flow_api.id(1521218643980987)
,p_default_report_template=>wwv_flow_api.id(1546658332981006)
,p_default_label_template=>wwv_flow_api.id(1573985718981030)
,p_default_menu_template=>wwv_flow_api.id(1575297595981032)
,p_default_calendar_template=>wwv_flow_api.id(1575314259981034)
,p_default_list_template=>wwv_flow_api.id(1562409980981018)
,p_default_nav_list_template=>wwv_flow_api.id(1569820044981024)
,p_default_top_nav_list_temp=>wwv_flow_api.id(1569820044981024)
,p_default_side_nav_list_temp=>wwv_flow_api.id(1567840590981022)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_api.id(1501892526980976)
,p_default_dialogr_template=>wwv_flow_api.id(1500825512980975)
,p_default_option_label=>wwv_flow_api.id(1573985718981030)
,p_default_required_label=>wwv_flow_api.id(1574270348981030)
,p_default_page_transition=>'NONE'
,p_default_popup_transition=>'NONE'
,p_default_navbar_list_template=>wwv_flow_api.id(1567626872981022)
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#IMAGE_PREFIX#themes/theme_42/1.2/')
,p_files_version=>62
,p_icon_library=>'FONTAPEX'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#THEME_IMAGES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_IMAGES#css/Core#MIN#.css?v=#APEX_VERSION#'
);
end;
/
prompt --application/shared_components/user_interface/theme_style
begin
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(1575676054981037)
,p_theme_id=>42
,p_name=>'Vista'
,p_css_file_urls=>'#THEME_IMAGES#css/Vista#MIN#.css?v=#APEX_VERSION#'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_read_only=>true
,p_reference_id=>4007676303523989775
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(1575806893981038)
,p_theme_id=>42
,p_name=>'Vita'
,p_is_current=>true
,p_is_public=>true
,p_is_accessible=>true
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>2719875314571594493
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(1576086635981038)
,p_theme_id=>42
,p_name=>'Vita - Dark'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Dark.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Dark#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>3543348412015319650
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(1576224523981038)
,p_theme_id=>42
,p_name=>'Vita - Red'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Red.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Red#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>1938457712423918173
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(1576489491981038)
,p_theme_id=>42
,p_name=>'Vita - Slate'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Slate.less'
,p_theme_roller_config=>'{"customCSS":"","vars":{"@g_Accent-BG":"#505f6d","@g_Accent-OG":"#ececec","@g_Body-Title-BG":"#dee1e4","@l_Link-Base":"#337ac0","@g_Body-BG":"#f5f5f5"}}'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Slate#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>3291983347983194966
);
end;
/
prompt --application/shared_components/user_interface/theme_files
begin
null;
end;
/
prompt --application/shared_components/user_interface/theme_display_points
begin
null;
end;
/
prompt --application/shared_components/user_interface/template_opt_groups
begin
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1497958048980974)
,p_theme_id=>42
,p_name=>'ALERT_TYPE'
,p_display_name=>'Alert Type'
,p_display_sequence=>3
,p_template_types=>'REGION'
,p_help_text=>'Sets the type of alert which can be used to determine the icon, icon color, and the background color.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1498397976980974)
,p_theme_id=>42
,p_name=>'ALERT_TITLE'
,p_display_name=>'Alert Title'
,p_display_sequence=>40
,p_template_types=>'REGION'
,p_help_text=>'Determines how the title of the alert is displayed.'
,p_null_text=>'Visible - Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1498970289980974)
,p_theme_id=>42
,p_name=>'ALERT_ICONS'
,p_display_name=>'Alert Icons'
,p_display_sequence=>2
,p_template_types=>'REGION'
,p_help_text=>'Sets how icons are handled for the Alert Region.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1499362613980974)
,p_theme_id=>42
,p_name=>'ALERT_DISPLAY'
,p_display_name=>'Alert Display'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the layout of the Alert Region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1502707205980976)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>40
,p_template_types=>'REGION'
,p_help_text=>'Determines how the region is styled. Use the "Remove Borders" template option to remove the region''s borders and shadows.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1503104617980976)
,p_theme_id=>42
,p_name=>'BODY_PADDING'
,p_display_name=>'Body Padding'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the Region Body padding for the region.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1504956221980978)
,p_theme_id=>42
,p_name=>'TIMER'
,p_display_name=>'Timer'
,p_display_sequence=>2
,p_template_types=>'REGION'
,p_help_text=>'Sets the timer for when to automatically navigate to the next region within the Carousel Region.'
,p_null_text=>'No Timer'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1505743051980978)
,p_theme_id=>42
,p_name=>'BODY_HEIGHT'
,p_display_name=>'Body Height'
,p_display_sequence=>10
,p_template_types=>'REGION'
,p_help_text=>'Sets the Region Body height. You can also specify a custom height by modifying the Region''s CSS Classes and using the height helper classes "i-hXXX" where XXX is any increment of 10 from 100 to 800.'
,p_null_text=>'Auto - Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1506988885980979)
,p_theme_id=>42
,p_name=>'ACCENT'
,p_display_name=>'Accent'
,p_display_sequence=>30
,p_template_types=>'REGION'
,p_help_text=>'Set the Region''s accent. This accent corresponds to a Theme-Rollable color and sets the background of the Region''s Header.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1508185672980980)
,p_theme_id=>42
,p_name=>'HEADER'
,p_display_name=>'Header'
,p_display_sequence=>20
,p_template_types=>'REGION'
,p_help_text=>'Determines the display of the Region Header which also contains the Region Title.'
,p_null_text=>'Visible - Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1508508457980980)
,p_theme_id=>42
,p_name=>'BODY_OVERFLOW'
,p_display_name=>'Body Overflow'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Determines the scroll behavior when the region contents are larger than their container.'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1510587002980981)
,p_theme_id=>42
,p_name=>'ANIMATION'
,p_display_name=>'Animation'
,p_display_sequence=>10
,p_template_types=>'REGION'
,p_help_text=>'Sets the animation when navigating within the Carousel Region.'
,p_null_text=>'Fade'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1513917328980983)
,p_theme_id=>42
,p_name=>'DEFAULT_STATE'
,p_display_name=>'Default State'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the default state of the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1516316990980984)
,p_theme_id=>42
,p_name=>'REGION_TITLE'
,p_display_name=>'Region Title'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the source of the Title Bar region''s title.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1517109998980985)
,p_theme_id=>42
,p_name=>'BODY_STYLE'
,p_display_name=>'Body Style'
,p_display_sequence=>20
,p_template_types=>'REGION'
,p_help_text=>'Controls the display of the region''s body container.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1518252090980985)
,p_theme_id=>42
,p_name=>'DISPLAY_ICON'
,p_display_name=>'Display Icon'
,p_display_sequence=>50
,p_template_types=>'REGION'
,p_help_text=>'Display the Hero Region icon.'
,p_null_text=>'Yes (Default)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1520182999980986)
,p_theme_id=>42
,p_name=>'DIALOG_SIZE'
,p_display_name=>'Dialog Size'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1530003350980992)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1530451193980992)
,p_theme_id=>42
,p_name=>'TAB_STYLE'
,p_display_name=>'Tab Style'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1531297039980993)
,p_theme_id=>42
,p_name=>'TABS_SIZE'
,p_display_name=>'Tabs Size'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1533372988980994)
,p_theme_id=>42
,p_name=>'HIDE_STEPS_FOR'
,p_display_name=>'Hide Steps For'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1534577341980996)
,p_theme_id=>42
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1534921513980996)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>30
,p_template_types=>'REPORT'
,p_help_text=>'Determines the layout of Cards in the report.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1536906422980997)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Determines the overall style for the component.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1538791472980999)
,p_theme_id=>42
,p_name=>'BODY_TEXT'
,p_display_name=>'Body Text'
,p_display_sequence=>40
,p_template_types=>'REPORT'
,p_help_text=>'Determines the height of the card body.'
,p_null_text=>'Auto'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1540538062981000)
,p_theme_id=>42
,p_name=>'ANIMATION'
,p_display_name=>'Animation'
,p_display_sequence=>70
,p_template_types=>'REPORT'
,p_help_text=>'Sets the hover and focus animation.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1541324232981001)
,p_theme_id=>42
,p_name=>'ICONS'
,p_display_name=>'Icons'
,p_display_sequence=>20
,p_template_types=>'REPORT'
,p_help_text=>'Controls how to handle icons in the report.'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1543347691981003)
,p_theme_id=>42
,p_name=>'COMMENTS_STYLE'
,p_display_name=>'Comments Style'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Determines the style in which comments are displayed.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1545197875981005)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>35
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1546987557981006)
,p_theme_id=>42
,p_name=>'ALTERNATING_ROWS'
,p_display_name=>'Alternating Rows'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Shades alternate rows in the report with slightly different background colors.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1547561397981006)
,p_theme_id=>42
,p_name=>'ROW_HIGHLIGHTING'
,p_display_name=>'Row Highlighting'
,p_display_sequence=>20
,p_template_types=>'REPORT'
,p_help_text=>'Determines whether you want the row to be highlighted on hover.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1547930732981007)
,p_theme_id=>42
,p_name=>'REPORT_BORDER'
,p_display_name=>'Report Border'
,p_display_sequence=>30
,p_template_types=>'REPORT'
,p_help_text=>'Controls the display of the Report''s borders.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1549977580981008)
,p_theme_id=>42
,p_name=>'LABEL_WIDTH'
,p_display_name=>'Label Width'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1553702366981013)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>30
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1554925326981014)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>10
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1556167843981014)
,p_theme_id=>42
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>70
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1557910538981016)
,p_theme_id=>42
,p_name=>'BODY_TEXT'
,p_display_name=>'Body Text'
,p_display_sequence=>40
,p_template_types=>'LIST'
,p_help_text=>'Determines the height of the card body.'
,p_null_text=>'Auto'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1559989756981017)
,p_theme_id=>42
,p_name=>'ANIMATION'
,p_display_name=>'Animation'
,p_display_sequence=>80
,p_template_types=>'LIST'
,p_help_text=>'Sets the hover and focus animation.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1560551831981017)
,p_theme_id=>42
,p_name=>'ICONS'
,p_display_name=>'Icons'
,p_display_sequence=>20
,p_template_types=>'LIST'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1563561219981019)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>30
,p_template_types=>'LIST'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1565360501981020)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1571106702981025)
,p_theme_id=>42
,p_name=>'MOBILE'
,p_display_name=>'Mobile'
,p_display_sequence=>100
,p_template_types=>'LIST'
,p_help_text=>'Determines the display for a mobile-sized screen'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1571767669981026)
,p_theme_id=>42
,p_name=>'DESKTOP'
,p_display_name=>'Desktop'
,p_display_sequence=>90
,p_template_types=>'LIST'
,p_help_text=>'Determines the display for a desktop-sized screen'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1572746040981027)
,p_theme_id=>42
,p_name=>'LABEL_DISPLAY'
,p_display_name=>'Label Display'
,p_display_sequence=>50
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1574743555981032)
,p_theme_id=>42
,p_name=>'ICON_POSITION'
,p_display_name=>'Icon Position'
,p_display_sequence=>50
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the position of the icon relative to the label.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1576844919981049)
,p_theme_id=>42
,p_name=>'TYPE'
,p_display_name=>'Type'
,p_display_sequence=>20
,p_template_types=>'BUTTON'
,p_null_text=>'Normal'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1577240695981050)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>30
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the style of the button. Use the "Simple" option for secondary actions or sets of buttons. Use the "Remove UI Decoration" option to make the button appear as text.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1577651152981050)
,p_theme_id=>42
,p_name=>'RADIO_GROUP_DISPLAY'
,p_display_name=>'Item Group Display'
,p_display_sequence=>300
,p_template_types=>'FIELD'
,p_help_text=>'Determines the display style for radio and check box items.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1578075035981051)
,p_theme_id=>42
,p_name=>'BOTTOM_MARGIN'
,p_display_name=>'Bottom Margin'
,p_display_sequence=>220
,p_template_types=>'FIELD'
,p_help_text=>'Set the bottom margin for this field.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1579071701981051)
,p_theme_id=>42
,p_name=>'LEFT_MARGIN'
,p_display_name=>'Left Margin'
,p_display_sequence=>220
,p_template_types=>'FIELD'
,p_help_text=>'Set the left margin for this field.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1580077918981052)
,p_theme_id=>42
,p_name=>'LABEL_ALIGNMENT'
,p_display_name=>'Label Alignment'
,p_display_sequence=>130
,p_template_types=>'REGION'
,p_help_text=>'Set the label text alignment for items within this region.'
,p_null_text=>'Right'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1580442992981052)
,p_theme_id=>42
,p_name=>'ITEM_PADDING'
,p_display_name=>'Item Padding'
,p_display_sequence=>100
,p_template_types=>'REGION'
,p_help_text=>'Sets the padding around items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1580841881981052)
,p_theme_id=>42
,p_name=>'ITEM_SIZE'
,p_display_name=>'Item Size'
,p_display_sequence=>110
,p_template_types=>'REGION'
,p_help_text=>'Sets the size of the form items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1581699037981052)
,p_theme_id=>42
,p_name=>'RIGHT_MARGIN'
,p_display_name=>'Right Margin'
,p_display_sequence=>230
,p_template_types=>'FIELD'
,p_help_text=>'Set the right margin for this field.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1582672840981053)
,p_theme_id=>42
,p_name=>'TOP_MARGIN'
,p_display_name=>'Top Margin'
,p_display_sequence=>200
,p_template_types=>'FIELD'
,p_help_text=>'Set the top margin for this field.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1583695642981054)
,p_theme_id=>42
,p_name=>'PAGINATION_DISPLAY'
,p_display_name=>'Pagination Display'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Controls the display of pagination for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1584032622981054)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>10
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the size of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1584400542981054)
,p_theme_id=>42
,p_name=>'SPACING_BOTTOM'
,p_display_name=>'Spacing Bottom'
,p_display_sequence=>100
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the bottom of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1584859453981054)
,p_theme_id=>42
,p_name=>'SPACING_LEFT'
,p_display_name=>'Spacing Left'
,p_display_sequence=>70
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the left of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1585280380981054)
,p_theme_id=>42
,p_name=>'SPACING_RIGHT'
,p_display_name=>'Spacing Right'
,p_display_sequence=>80
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the right of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1585689136981054)
,p_theme_id=>42
,p_name=>'SPACING_TOP'
,p_display_name=>'Spacing Top'
,p_display_sequence=>90
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the top of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1586051414981055)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>10
,p_template_types=>'FIELD'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1586657095981055)
,p_theme_id=>42
,p_name=>'BUTTON_SET'
,p_display_name=>'Button Set'
,p_display_sequence=>40
,p_template_types=>'BUTTON'
,p_help_text=>'Enables you to group many buttons together into a pill. You can use this option to specify where the button is within this set. Set the option to Default if this button is not part of a button set.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1587440938981055)
,p_theme_id=>42
,p_name=>'ITEM_POST_TEXT'
,p_display_name=>'Item Post Text'
,p_display_sequence=>30
,p_template_types=>'FIELD'
,p_help_text=>'Adjust the display of the Item Post Text'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1587834315981056)
,p_theme_id=>42
,p_name=>'ITEM_PRE_TEXT'
,p_display_name=>'Item Pre Text'
,p_display_sequence=>20
,p_template_types=>'FIELD'
,p_help_text=>'Adjust the display of the Item Pre Text'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1588475456981056)
,p_theme_id=>42
,p_name=>'REGION_BOTTOM_MARGIN'
,p_display_name=>'Bottom Margin'
,p_display_sequence=>210
,p_template_types=>'REGION'
,p_help_text=>'Set the bottom margin for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1589431648981056)
,p_theme_id=>42
,p_name=>'REGION_LEFT_MARGIN'
,p_display_name=>'Left Margin'
,p_display_sequence=>220
,p_template_types=>'REGION'
,p_help_text=>'Set the left margin for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1590423090981057)
,p_theme_id=>42
,p_name=>'REGION_RIGHT_MARGIN'
,p_display_name=>'Right Margin'
,p_display_sequence=>230
,p_template_types=>'REGION'
,p_help_text=>'Set the right margin for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1591441552981057)
,p_theme_id=>42
,p_name=>'REGION_TOP_MARGIN'
,p_display_name=>'Top Margin'
,p_display_sequence=>200
,p_template_types=>'REGION'
,p_help_text=>'Set the top margin for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1592445574981058)
,p_theme_id=>42
,p_name=>'LABEL_POSITION'
,p_display_name=>'Label Position'
,p_display_sequence=>140
,p_template_types=>'REGION'
,p_help_text=>'Sets the position of the label relative to the form item.'
,p_null_text=>'Inline - Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1594093069981059)
,p_theme_id=>42
,p_name=>'WIDTH'
,p_display_name=>'Width'
,p_display_sequence=>60
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the width of the button.'
,p_null_text=>'Auto - Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1594455688981059)
,p_theme_id=>42
,p_name=>'ITEM_WIDTH'
,p_display_name=>'Item Width'
,p_display_sequence=>120
,p_template_types=>'REGION'
,p_help_text=>'Sets the width of the form items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
end;
/
prompt --application/shared_components/user_interface/template_options
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1479263194980952)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(1476565452980942)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1482364838980955)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(1479301295980952)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1486287314980958)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(1483236322980955)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1488799248980959)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(1486305075980958)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1490059130980960)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>20
,p_page_template_id=>wwv_flow_api.id(1488831444980960)
,p_css_classes=>'t-Dialog--noPadding'
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1490288650980960)
,p_theme_id=>42
,p_name=>'STRETCH_TO_FIT_WINDOW'
,p_display_name=>'Stretch to Fit Window'
,p_display_sequence=>1
,p_page_template_id=>wwv_flow_api.id(1488831444980960)
,p_css_classes=>'ui-dialog--stretch'
,p_template_types=>'PAGE'
,p_help_text=>'Stretch the dialog to fit the browser window.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1493020534980965)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(1490377407980960)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1495518657980967)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(1493180315980965)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1496839529980969)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>20
,p_page_template_id=>wwv_flow_api.id(1495609046980967)
,p_css_classes=>'t-Dialog--noPadding'
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1497082262980969)
,p_theme_id=>42
,p_name=>'STRETCH_TO_FIT_WINDOW'
,p_display_name=>'Stretch to Fit Window'
,p_display_sequence=>10
,p_page_template_id=>wwv_flow_api.id(1495609046980967)
,p_css_classes=>'ui-dialog--stretch'
,p_template_types=>'PAGE'
,p_help_text=>'Stretch the dialog to fit the browser window.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1497739114980973)
,p_theme_id=>42
,p_name=>'COLOREDBACKGROUND'
,p_display_name=>'Highlight Background'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(1497177462980969)
,p_css_classes=>'t-Alert--colorBG'
,p_template_types=>'REGION'
,p_help_text=>'Set alert background color to that of the alert type (warning, success, etc.)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1498140090980974)
,p_theme_id=>42
,p_name=>'DANGER'
,p_display_name=>'Danger'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(1497177462980969)
,p_css_classes=>'t-Alert--danger'
,p_group_id=>wwv_flow_api.id(1497958048980974)
,p_template_types=>'REGION'
,p_help_text=>'Show an error or danger alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1498524106980974)
,p_theme_id=>42
,p_name=>'HIDDENHEADER'
,p_display_name=>'Hidden but Accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(1497177462980969)
,p_css_classes=>'t-Alert--accessibleHeading'
,p_group_id=>wwv_flow_api.id(1498397976980974)
,p_template_types=>'REGION'
,p_help_text=>'Visually hides the alert title, but assistive technologies can still read it.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1498774497980974)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(1497177462980969)
,p_css_classes=>'t-Alert--removeHeading'
,p_group_id=>wwv_flow_api.id(1498397976980974)
,p_template_types=>'REGION'
,p_help_text=>'Hides the Alert Title from being displayed.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1499106827980974)
,p_theme_id=>42
,p_name=>'HIDE_ICONS'
,p_display_name=>'Hide Icons'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(1497177462980969)
,p_css_classes=>'t-Alert--noIcon'
,p_group_id=>wwv_flow_api.id(1498970289980974)
,p_template_types=>'REGION'
,p_help_text=>'Hides alert icons'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1499552252980974)
,p_theme_id=>42
,p_name=>'HORIZONTAL'
,p_display_name=>'Horizontal'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(1497177462980969)
,p_css_classes=>'t-Alert--horizontal'
,p_group_id=>wwv_flow_api.id(1499362613980974)
,p_template_types=>'REGION'
,p_help_text=>'Show horizontal alert with buttons to the right.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1499735873980974)
,p_theme_id=>42
,p_name=>'INFORMATION'
,p_display_name=>'Information'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(1497177462980969)
,p_css_classes=>'t-Alert--info'
,p_group_id=>wwv_flow_api.id(1497958048980974)
,p_template_types=>'REGION'
,p_help_text=>'Show informational alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1499911382980974)
,p_theme_id=>42
,p_name=>'SHOW_CUSTOM_ICONS'
,p_display_name=>'Show Custom Icons'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(1497177462980969)
,p_css_classes=>'t-Alert--customIcons'
,p_group_id=>wwv_flow_api.id(1498970289980974)
,p_template_types=>'REGION'
,p_help_text=>'Set custom icons by modifying the Alert Region''s Icon CSS Classes property.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1500171444980975)
,p_theme_id=>42
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(1497177462980969)
,p_css_classes=>'t-Alert--success'
,p_group_id=>wwv_flow_api.id(1497958048980974)
,p_template_types=>'REGION'
,p_help_text=>'Show success alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1500356151980975)
,p_theme_id=>42
,p_name=>'USEDEFAULTICONS'
,p_display_name=>'Show Default Icons'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(1497177462980969)
,p_css_classes=>'t-Alert--defaultIcons'
,p_group_id=>wwv_flow_api.id(1498970289980974)
,p_template_types=>'REGION'
,p_help_text=>'Uses default icons for alert types.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1500575128980975)
,p_theme_id=>42
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(1497177462980969)
,p_css_classes=>'t-Alert--warning'
,p_group_id=>wwv_flow_api.id(1497958048980974)
,p_template_types=>'REGION'
,p_help_text=>'Show a warning alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1500758952980975)
,p_theme_id=>42
,p_name=>'WIZARD'
,p_display_name=>'Wizard'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(1497177462980969)
,p_css_classes=>'t-Alert--wizard'
,p_group_id=>wwv_flow_api.id(1499362613980974)
,p_template_types=>'REGION'
,p_help_text=>'Show the alert in a wizard style region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1502992116980976)
,p_theme_id=>42
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(1501892526980976)
,p_css_classes=>'t-ButtonRegion--noBorder'
,p_group_id=>wwv_flow_api.id(1502707205980976)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1503388057980976)
,p_theme_id=>42
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>3
,p_region_template_id=>wwv_flow_api.id(1501892526980976)
,p_css_classes=>'t-ButtonRegion--noPadding'
,p_group_id=>wwv_flow_api.id(1503104617980976)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1503538009980976)
,p_theme_id=>42
,p_name=>'REMOVEUIDECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>4
,p_region_template_id=>wwv_flow_api.id(1501892526980976)
,p_css_classes=>'t-ButtonRegion--noUI'
,p_group_id=>wwv_flow_api.id(1502707205980976)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1503776543980976)
,p_theme_id=>42
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>5
,p_region_template_id=>wwv_flow_api.id(1501892526980976)
,p_css_classes=>'t-ButtonRegion--slimPadding'
,p_group_id=>wwv_flow_api.id(1503104617980976)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1503926117980977)
,p_theme_id=>42
,p_name=>'STICK_TO_BOTTOM'
,p_display_name=>'Stick to Bottom for Mobile'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(1501892526980976)
,p_css_classes=>'t-ButtonRegion--stickToBottom'
,p_template_types=>'REGION'
,p_help_text=>'This will position the button container region to the bottom of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1505176051980978)
,p_theme_id=>42
,p_name=>'10_SECONDS'
,p_display_name=>'10 Seconds'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(1504004054980977)
,p_css_classes=>'js-cycle10s'
,p_group_id=>wwv_flow_api.id(1504956221980978)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1505340984980978)
,p_theme_id=>42
,p_name=>'15_SECONDS'
,p_display_name=>'15 Seconds'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(1504004054980977)
,p_css_classes=>'js-cycle15s'
,p_group_id=>wwv_flow_api.id(1504956221980978)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1505503200980978)
,p_theme_id=>42
,p_name=>'20_SECONDS'
,p_display_name=>'20 Seconds'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(1504004054980977)
,p_css_classes=>'js-cycle20s'
,p_group_id=>wwv_flow_api.id(1504956221980978)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1505918825980978)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(1504004054980977)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_api.id(1505743051980978)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1506197266980979)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(1504004054980977)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_api.id(1505743051980978)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1506382607980979)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(1504004054980977)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_api.id(1505743051980978)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1506571272980979)
,p_theme_id=>42
,p_name=>'5_SECONDS'
,p_display_name=>'5 Seconds'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(1504004054980977)
,p_css_classes=>'js-cycle5s'
,p_group_id=>wwv_flow_api.id(1504956221980978)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1506744854980979)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(1504004054980977)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_api.id(1505743051980978)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1507161949980979)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(1504004054980977)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_api.id(1506988885980979)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1507350224980979)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(1504004054980977)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_api.id(1506988885980979)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1507529513980979)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(1504004054980977)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_api.id(1506988885980979)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1507790851980979)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(1504004054980977)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_api.id(1506988885980979)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1507930674980980)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(1504004054980977)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_api.id(1506988885980979)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1508335326980980)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(1504004054980977)
,p_css_classes=>'t-Region--removeHeader'
,p_group_id=>wwv_flow_api.id(1508185672980980)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1508729841980980)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(1504004054980977)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_api.id(1508508457980980)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1508940749980980)
,p_theme_id=>42
,p_name=>'HIDEREGIONHEADER'
,p_display_name=>'Hidden but accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(1504004054980977)
,p_css_classes=>'t-Region--hideHeader'
,p_group_id=>wwv_flow_api.id(1508185672980980)
,p_template_types=>'REGION'
,p_help_text=>'This option will hide the region header.  Note that the region title will still be audible for Screen Readers. Buttons placed in the region header will be hidden and inaccessible.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1509177212980980)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(1504004054980977)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1509366673980980)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(1504004054980977)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_api.id(1502707205980976)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1509533775980980)
,p_theme_id=>42
,p_name=>'REMEMBER_CAROUSEL_SLIDE'
,p_display_name=>'Remember Carousel Slide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(1504004054980977)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1509751826980981)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(1504004054980977)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_api.id(1508508457980980)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1509913718980981)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(1504004054980977)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Region Header to maximize the region. Clicking this button will toggle the maximize state and stretch the region to fill the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1510149806980981)
,p_theme_id=>42
,p_name=>'SHOW_NEXT_AND_PREVIOUS_BUTTONS'
,p_display_name=>'Show Next and Previous Buttons'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(1504004054980977)
,p_css_classes=>'t-Region--showCarouselControls'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1510344588980981)
,p_theme_id=>42
,p_name=>'SHOW_REGION_ICON'
,p_display_name=>'Show Region Icon'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(1504004054980977)
,p_css_classes=>'t-Region--showIcon'
,p_template_types=>'REGION'
,p_help_text=>'Displays the region icon in the region header beside the region title'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1510774379980981)
,p_theme_id=>42
,p_name=>'SLIDE'
,p_display_name=>'Slide'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(1504004054980977)
,p_css_classes=>'t-Region--carouselSlide'
,p_group_id=>wwv_flow_api.id(1510587002980981)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1510955401980981)
,p_theme_id=>42
,p_name=>'SPIN'
,p_display_name=>'Spin'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(1504004054980977)
,p_css_classes=>'t-Region--carouselSpin'
,p_group_id=>wwv_flow_api.id(1510587002980981)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1511187017980981)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(1504004054980977)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_api.id(1502707205980976)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1512153159980982)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(1511275695980981)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_api.id(1505743051980978)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1512383071980982)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(1511275695980981)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_api.id(1505743051980978)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1512579010980982)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(1511275695980981)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_api.id(1505743051980978)
,p_template_types=>'REGION'
,p_help_text=>'Sets body height to 480px.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1512754050980982)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(1511275695980981)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_api.id(1505743051980978)
,p_template_types=>'REGION'
,p_help_text=>'Sets body height to 640px.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1512955795980982)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(1511275695980981)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_api.id(1506988885980979)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1513196215980982)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(1511275695980981)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_api.id(1506988885980979)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1513332353980982)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(1511275695980981)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_api.id(1506988885980979)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1513563679980983)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(1511275695980981)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_api.id(1506988885980979)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1513711996980983)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(1511275695980981)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_api.id(1506988885980979)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1514192431980983)
,p_theme_id=>42
,p_name=>'COLLAPSED'
,p_display_name=>'Collapsed'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(1511275695980981)
,p_css_classes=>'is-collapsed'
,p_group_id=>wwv_flow_api.id(1513917328980983)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1514316713980983)
,p_theme_id=>42
,p_name=>'EXPANDED'
,p_display_name=>'Expanded'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(1511275695980981)
,p_css_classes=>'is-expanded'
,p_group_id=>wwv_flow_api.id(1513917328980983)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1514519157980983)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(1511275695980981)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_api.id(1508508457980980)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1514739301980983)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(1511275695980981)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1514987364980983)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(1511275695980981)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_api.id(1502707205980976)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1515164007980983)
,p_theme_id=>42
,p_name=>'REMEMBER_COLLAPSIBLE_STATE'
,p_display_name=>'Remember Collapsible State'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(1511275695980981)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
,p_help_text=>'This option saves the current state of the collapsible region for the duration of the session.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1515326749980984)
,p_theme_id=>42
,p_name=>'REMOVE_UI_DECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(1511275695980981)
,p_css_classes=>'t-Region--noUI'
,p_group_id=>wwv_flow_api.id(1502707205980976)
,p_template_types=>'REGION'
,p_help_text=>'Removes UI decoration (borders, backgrounds, shadows, etc) from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1515577423980984)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll - Default'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(1511275695980981)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_api.id(1508508457980980)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1515719511980984)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(1511275695980981)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_api.id(1502707205980976)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1516109281980984)
,p_theme_id=>42
,p_name=>'ADD_BODY_PADDING'
,p_display_name=>'Add Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(1515845100980984)
,p_css_classes=>'t-ContentBlock--padded'
,p_template_types=>'REGION'
,p_help_text=>'Adds padding to the region''s body container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1516538604980984)
,p_theme_id=>42
,p_name=>'CONTENT_TITLE_H1'
,p_display_name=>'Heading Level 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(1515845100980984)
,p_css_classes=>'t-ContentBlock--h1'
,p_group_id=>wwv_flow_api.id(1516316990980984)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1516790948980984)
,p_theme_id=>42
,p_name=>'CONTENT_TITLE_H2'
,p_display_name=>'Heading Level 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(1515845100980984)
,p_css_classes=>'t-ContentBlock--h2'
,p_group_id=>wwv_flow_api.id(1516316990980984)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1516940443980984)
,p_theme_id=>42
,p_name=>'CONTENT_TITLE_H3'
,p_display_name=>'Heading Level 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(1515845100980984)
,p_css_classes=>'t-ContentBlock--h3'
,p_group_id=>wwv_flow_api.id(1516316990980984)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1517387997980985)
,p_theme_id=>42
,p_name=>'LIGHT_BACKGROUND'
,p_display_name=>'Light Background'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(1515845100980984)
,p_css_classes=>'t-ContentBlock--lightBG'
,p_group_id=>wwv_flow_api.id(1517109998980985)
,p_template_types=>'REGION'
,p_help_text=>'Gives the region body a slightly lighter background.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1517558526980985)
,p_theme_id=>42
,p_name=>'SHADOW_BACKGROUND'
,p_display_name=>'Shadow Background'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(1515845100980984)
,p_css_classes=>'t-ContentBlock--shadowBG'
,p_group_id=>wwv_flow_api.id(1517109998980985)
,p_template_types=>'REGION'
,p_help_text=>'Gives the region body a slightly darker background.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1518455970980986)
,p_theme_id=>42
,p_name=>'DISPLAY_ICON_NO'
,p_display_name=>'No'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(1517636123980985)
,p_css_classes=>'t-HeroRegion--hideIcon'
,p_group_id=>wwv_flow_api.id(1518252090980985)
,p_template_types=>'REGION'
,p_help_text=>'Hide the Hero Region icon.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1518620986980986)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(1517636123980985)
,p_css_classes=>'t-HeroRegion--featured'
,p_group_id=>wwv_flow_api.id(1502707205980976)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1518806512980986)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(1517636123980985)
,p_css_classes=>'t-HeroRegion--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes the padding around the hero region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1519093384980986)
,p_theme_id=>42
,p_name=>'STACKED_FEATURED'
,p_display_name=>'Stacked Featured'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(1517636123980985)
,p_css_classes=>'t-HeroRegion--featured t-HeroRegion--centered'
,p_group_id=>wwv_flow_api.id(1502707205980976)
,p_template_types=>'REGION'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1519709318980986)
,p_theme_id=>42
,p_name=>'AUTO_HEIGHT_INLINE_DIALOG'
,p_display_name=>'Auto Height'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(1519149744980986)
,p_css_classes=>'js-dialog-autoheight'
,p_template_types=>'REGION'
,p_help_text=>'This option will set the height of the dialog to fit its contents.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1519974838980986)
,p_theme_id=>42
,p_name=>'DRAGGABLE'
,p_display_name=>'Draggable'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(1519149744980986)
,p_css_classes=>'js-draggable'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1520375257980987)
,p_theme_id=>42
,p_name=>'LARGE_720X480'
,p_display_name=>'Large (720x480)'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(1519149744980986)
,p_css_classes=>'js-dialog-size720x480'
,p_group_id=>wwv_flow_api.id(1520182999980986)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1520593641980987)
,p_theme_id=>42
,p_name=>'MEDIUM_600X400'
,p_display_name=>'Medium (600x400)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(1519149744980986)
,p_css_classes=>'js-dialog-size600x400'
,p_group_id=>wwv_flow_api.id(1520182999980986)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1520755640980987)
,p_theme_id=>42
,p_name=>'MODAL'
,p_display_name=>'Modal'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(1519149744980986)
,p_css_classes=>'js-modal'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1520993980980987)
,p_theme_id=>42
,p_name=>'RESIZABLE'
,p_display_name=>'Resizable'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(1519149744980986)
,p_css_classes=>'js-resizable'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1521125694980987)
,p_theme_id=>42
,p_name=>'SMALL_480X320'
,p_display_name=>'Small (480x320)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(1519149744980986)
,p_css_classes=>'js-dialog-size480x320'
,p_group_id=>wwv_flow_api.id(1520182999980986)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1521549017980987)
,p_theme_id=>42
,p_name=>'REMOVEBORDERS'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(1521218643980987)
,p_css_classes=>'t-IRR-region--noBorders'
,p_template_types=>'REGION'
,p_help_text=>'Removes borders around the Interactive Report'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1521769983980987)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(1521218643980987)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Interactive Reports toolbar to maximize the report. Clicking this button will toggle the maximize state and stretch the report to fill the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1523268572980988)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(1522385093980988)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_api.id(1505743051980978)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1523485925980989)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(1522385093980988)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_api.id(1505743051980978)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1523636077980989)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(1522385093980988)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_api.id(1505743051980978)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1523853537980989)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(1522385093980988)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_api.id(1505743051980978)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1524059523980989)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(1522385093980988)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_api.id(1506988885980979)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1524267320980989)
,p_theme_id=>42
,p_name=>'ACCENT_10'
,p_display_name=>'Accent 10'
,p_display_sequence=>100
,p_region_template_id=>wwv_flow_api.id(1522385093980988)
,p_css_classes=>'t-Region--accent10'
,p_group_id=>wwv_flow_api.id(1506988885980979)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1524439685980989)
,p_theme_id=>42
,p_name=>'ACCENT_11'
,p_display_name=>'Accent 11'
,p_display_sequence=>110
,p_region_template_id=>wwv_flow_api.id(1522385093980988)
,p_css_classes=>'t-Region--accent11'
,p_group_id=>wwv_flow_api.id(1506988885980979)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1524618301980989)
,p_theme_id=>42
,p_name=>'ACCENT_12'
,p_display_name=>'Accent 12'
,p_display_sequence=>120
,p_region_template_id=>wwv_flow_api.id(1522385093980988)
,p_css_classes=>'t-Region--accent12'
,p_group_id=>wwv_flow_api.id(1506988885980979)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1524864671980990)
,p_theme_id=>42
,p_name=>'ACCENT_13'
,p_display_name=>'Accent 13'
,p_display_sequence=>130
,p_region_template_id=>wwv_flow_api.id(1522385093980988)
,p_css_classes=>'t-Region--accent13'
,p_group_id=>wwv_flow_api.id(1506988885980979)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1525086435980990)
,p_theme_id=>42
,p_name=>'ACCENT_14'
,p_display_name=>'Accent 14'
,p_display_sequence=>140
,p_region_template_id=>wwv_flow_api.id(1522385093980988)
,p_css_classes=>'t-Region--accent14'
,p_group_id=>wwv_flow_api.id(1506988885980979)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1525258036980990)
,p_theme_id=>42
,p_name=>'ACCENT_15'
,p_display_name=>'Accent 15'
,p_display_sequence=>150
,p_region_template_id=>wwv_flow_api.id(1522385093980988)
,p_css_classes=>'t-Region--accent15'
,p_group_id=>wwv_flow_api.id(1506988885980979)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1525463074980990)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(1522385093980988)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_api.id(1506988885980979)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1525691362980990)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(1522385093980988)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_api.id(1506988885980979)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1525844900980990)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(1522385093980988)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_api.id(1506988885980979)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1526073482980990)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(1522385093980988)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_api.id(1506988885980979)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1526237915980990)
,p_theme_id=>42
,p_name=>'ACCENT_6'
,p_display_name=>'Accent 6'
,p_display_sequence=>60
,p_region_template_id=>wwv_flow_api.id(1522385093980988)
,p_css_classes=>'t-Region--accent6'
,p_group_id=>wwv_flow_api.id(1506988885980979)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1526438011980990)
,p_theme_id=>42
,p_name=>'ACCENT_7'
,p_display_name=>'Accent 7'
,p_display_sequence=>70
,p_region_template_id=>wwv_flow_api.id(1522385093980988)
,p_css_classes=>'t-Region--accent7'
,p_group_id=>wwv_flow_api.id(1506988885980979)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1526696877980990)
,p_theme_id=>42
,p_name=>'ACCENT_8'
,p_display_name=>'Accent 8'
,p_display_sequence=>80
,p_region_template_id=>wwv_flow_api.id(1522385093980988)
,p_css_classes=>'t-Region--accent8'
,p_group_id=>wwv_flow_api.id(1506988885980979)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1526805443980990)
,p_theme_id=>42
,p_name=>'ACCENT_9'
,p_display_name=>'Accent 9'
,p_display_sequence=>90
,p_region_template_id=>wwv_flow_api.id(1522385093980988)
,p_css_classes=>'t-Region--accent9'
,p_group_id=>wwv_flow_api.id(1506988885980979)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1527092534980990)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(1522385093980988)
,p_css_classes=>'t-Region--removeHeader'
,p_group_id=>wwv_flow_api.id(1508185672980980)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1527280774980991)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(1522385093980988)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_api.id(1508508457980980)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1527439148980991)
,p_theme_id=>42
,p_name=>'HIDEREGIONHEADER'
,p_display_name=>'Hidden but accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(1522385093980988)
,p_css_classes=>'t-Region--hideHeader'
,p_group_id=>wwv_flow_api.id(1508185672980980)
,p_template_types=>'REGION'
,p_help_text=>'This option will hide the region header.  Note that the region title will still be audible for Screen Readers. Buttons placed in the region header will be hidden and inaccessible.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1527639554980991)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(1522385093980988)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1527880141980991)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(1522385093980988)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_api.id(1502707205980976)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1528040737980991)
,p_theme_id=>42
,p_name=>'REMOVE_UI_DECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(1522385093980988)
,p_css_classes=>'t-Region--noUI'
,p_group_id=>wwv_flow_api.id(1502707205980976)
,p_template_types=>'REGION'
,p_help_text=>'Removes UI decoration (borders, backgrounds, shadows, etc) from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1528206128980991)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll - Default'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(1522385093980988)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_api.id(1508508457980980)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1528469042980991)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(1522385093980988)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Region Header to maximize the region. Clicking this button will toggle the maximize state and stretch the region to fill the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1528693567980991)
,p_theme_id=>42
,p_name=>'SHOW_REGION_ICON'
,p_display_name=>'Show Region Icon'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(1522385093980988)
,p_css_classes=>'t-Region--showIcon'
,p_template_types=>'REGION'
,p_help_text=>'Displays the region icon in the region header beside the region title'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1528824985980992)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(1522385093980988)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_api.id(1502707205980976)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1529020915980992)
,p_theme_id=>42
,p_name=>'TEXT_CONTENT'
,p_display_name=>'Text Content'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(1522385093980988)
,p_css_classes=>'t-Region--textContent'
,p_group_id=>wwv_flow_api.id(1502707205980976)
,p_template_types=>'REGION'
,p_help_text=>'Useful for displaying primarily text-based content, such as FAQs and more.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1530239140980992)
,p_theme_id=>42
,p_name=>'FILL_TAB_LABELS'
,p_display_name=>'Fill Tab Labels'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(1529147161980992)
,p_css_classes=>'t-TabsRegion-mod--fillLabels'
,p_group_id=>wwv_flow_api.id(1530003350980992)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1530643245980992)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Pill'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(1529147161980992)
,p_css_classes=>'t-TabsRegion-mod--pill'
,p_group_id=>wwv_flow_api.id(1530451193980992)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1530804405980992)
,p_theme_id=>42
,p_name=>'REMEMBER_ACTIVE_TAB'
,p_display_name=>'Remember Active Tab'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(1529147161980992)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1531021724980993)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(1529147161980992)
,p_css_classes=>'t-TabsRegion-mod--simple'
,p_group_id=>wwv_flow_api.id(1530451193980992)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1531453115980993)
,p_theme_id=>42
,p_name=>'TABSLARGE'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(1529147161980992)
,p_css_classes=>'t-TabsRegion-mod--large'
,p_group_id=>wwv_flow_api.id(1531297039980993)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1531699495980993)
,p_theme_id=>42
,p_name=>'TABS_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(1529147161980992)
,p_css_classes=>'t-TabsRegion-mod--small'
,p_group_id=>wwv_flow_api.id(1531297039980993)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1532055325980993)
,p_theme_id=>42
,p_name=>'GET_TITLE_FROM_BREADCRUMB'
,p_display_name=>'Use Current Breadcrumb Entry'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(1531766544980993)
,p_css_classes=>'t-BreadcrumbRegion--useBreadcrumbTitle'
,p_group_id=>wwv_flow_api.id(1516316990980984)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1532248568980993)
,p_theme_id=>42
,p_name=>'HIDE_BREADCRUMB'
,p_display_name=>'Show Breadcrumbs'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(1531766544980993)
,p_css_classes=>'t-BreadcrumbRegion--showBreadcrumb'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1532402104980993)
,p_theme_id=>42
,p_name=>'REGION_HEADER_VISIBLE'
,p_display_name=>'Use Region Title'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(1531766544980993)
,p_css_classes=>'t-BreadcrumbRegion--useRegionTitle'
,p_group_id=>wwv_flow_api.id(1516316990980984)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1532652365980994)
,p_theme_id=>42
,p_name=>'USE_COMPACT_STYLE'
,p_display_name=>'Use Compact Style'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(1531766544980993)
,p_css_classes=>'t-BreadcrumbRegion--compactTitle'
,p_template_types=>'REGION'
,p_help_text=>'Uses a compact style for the breadcrumbs.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1533514130980994)
,p_theme_id=>42
,p_name=>'HIDESMALLSCREENS'
,p_display_name=>'Small Screens (Tablet)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(1532765651980994)
,p_css_classes=>'t-Wizard--hideStepsSmall'
,p_group_id=>wwv_flow_api.id(1533372988980994)
,p_template_types=>'REGION'
,p_help_text=>'Hides the wizard progress steps for screens that are smaller than 768px wide.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1533789162980994)
,p_theme_id=>42
,p_name=>'HIDEXSMALLSCREENS'
,p_display_name=>'X Small Screens (Mobile)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(1532765651980994)
,p_css_classes=>'t-Wizard--hideStepsXSmall'
,p_group_id=>wwv_flow_api.id(1533372988980994)
,p_template_types=>'REGION'
,p_help_text=>'Hides the wizard progress steps for screens that are smaller than 768px wide.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1533962308980994)
,p_theme_id=>42
,p_name=>'SHOW_TITLE'
,p_display_name=>'Show Title'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(1532765651980994)
,p_css_classes=>'t-Wizard--showTitle'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1534726490980996)
,p_theme_id=>42
,p_name=>'128PX'
,p_display_name=>'128px'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(1534200029980996)
,p_css_classes=>'t-BadgeList--xxlarge'
,p_group_id=>wwv_flow_api.id(1534577341980996)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1535181540980996)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(1534200029980996)
,p_css_classes=>'t-BadgeList--cols'
,p_group_id=>wwv_flow_api.id(1534921513980996)
,p_template_types=>'REPORT'
,p_help_text=>'Arrange badges in a two column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1535380466980996)
,p_theme_id=>42
,p_name=>'32PX'
,p_display_name=>'32px'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(1534200029980996)
,p_css_classes=>'t-BadgeList--small'
,p_group_id=>wwv_flow_api.id(1534577341980996)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1535546457980997)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(1534200029980996)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--3cols'
,p_group_id=>wwv_flow_api.id(1534921513980996)
,p_template_types=>'REPORT'
,p_help_text=>'Arrange badges in a 3 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1535779914980997)
,p_theme_id=>42
,p_name=>'48PX'
,p_display_name=>'48px'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(1534200029980996)
,p_css_classes=>'t-BadgeList--medium'
,p_group_id=>wwv_flow_api.id(1534577341980996)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1535947212980997)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(1534200029980996)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--4cols'
,p_group_id=>wwv_flow_api.id(1534921513980996)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1536135727980997)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(1534200029980996)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--5cols'
,p_group_id=>wwv_flow_api.id(1534921513980996)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1536386639980997)
,p_theme_id=>42
,p_name=>'64PX'
,p_display_name=>'64px'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(1534200029980996)
,p_css_classes=>'t-BadgeList--large'
,p_group_id=>wwv_flow_api.id(1534577341980996)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1536564591980997)
,p_theme_id=>42
,p_name=>'96PX'
,p_display_name=>'96px'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(1534200029980996)
,p_css_classes=>'t-BadgeList--xlarge'
,p_group_id=>wwv_flow_api.id(1534577341980996)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1536701383980997)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(1534200029980996)
,p_css_classes=>'u-colors'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1537190202980998)
,p_theme_id=>42
,p_name=>'CIRCULAR'
,p_display_name=>'Circular'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(1534200029980996)
,p_css_classes=>'t-BadgeList--circular'
,p_group_id=>wwv_flow_api.id(1536906422980997)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1537378569980998)
,p_theme_id=>42
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(1534200029980996)
,p_css_classes=>'t-BadgeList--fixed'
,p_group_id=>wwv_flow_api.id(1534921513980996)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1537559040980998)
,p_theme_id=>42
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>80
,p_report_template_id=>wwv_flow_api.id(1534200029980996)
,p_css_classes=>'t-BadgeList--flex'
,p_group_id=>wwv_flow_api.id(1534921513980996)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1537749035980998)
,p_theme_id=>42
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>70
,p_report_template_id=>wwv_flow_api.id(1534200029980996)
,p_css_classes=>'t-BadgeList--float'
,p_group_id=>wwv_flow_api.id(1534921513980996)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1537969390980998)
,p_theme_id=>42
,p_name=>'GRID'
,p_display_name=>'Grid'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(1534200029980996)
,p_css_classes=>'t-BadgeList--dash'
,p_group_id=>wwv_flow_api.id(1536906422980997)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1538193762980998)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(1534200029980996)
,p_css_classes=>'t-BadgeList--stacked'
,p_group_id=>wwv_flow_api.id(1534921513980996)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1538532225980999)
,p_theme_id=>42
,p_name=>'2_COLUMNS'
,p_display_name=>'2 Columns'
,p_display_sequence=>15
,p_report_template_id=>wwv_flow_api.id(1538206665980998)
,p_css_classes=>'t-Cards--cols'
,p_group_id=>wwv_flow_api.id(1534921513980996)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1538922999980999)
,p_theme_id=>42
,p_name=>'2_LINES'
,p_display_name=>'2 Lines'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(1538206665980998)
,p_css_classes=>'t-Cards--desc-2ln'
,p_group_id=>wwv_flow_api.id(1538791472980999)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1539138869980999)
,p_theme_id=>42
,p_name=>'3_COLUMNS'
,p_display_name=>'3 Columns'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(1538206665980998)
,p_css_classes=>'t-Cards--3cols'
,p_group_id=>wwv_flow_api.id(1534921513980996)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1539345840980999)
,p_theme_id=>42
,p_name=>'3_LINES'
,p_display_name=>'3 Lines'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(1538206665980998)
,p_css_classes=>'t-Cards--desc-3ln'
,p_group_id=>wwv_flow_api.id(1538791472980999)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1539537009980999)
,p_theme_id=>42
,p_name=>'4_COLUMNS'
,p_display_name=>'4 Columns'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(1538206665980998)
,p_css_classes=>'t-Cards--4cols'
,p_group_id=>wwv_flow_api.id(1534921513980996)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1539755593981000)
,p_theme_id=>42
,p_name=>'4_LINES'
,p_display_name=>'4 Lines'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(1538206665980998)
,p_css_classes=>'t-Cards--desc-4ln'
,p_group_id=>wwv_flow_api.id(1538791472980999)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1539917500981000)
,p_theme_id=>42
,p_name=>'5_COLUMNS'
,p_display_name=>'5 Columns'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(1538206665980998)
,p_css_classes=>'t-Cards--5cols'
,p_group_id=>wwv_flow_api.id(1534921513980996)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1540128768981000)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(1538206665980998)
,p_css_classes=>'t-Cards--basic'
,p_group_id=>wwv_flow_api.id(1536906422980997)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1540381543981000)
,p_theme_id=>42
,p_name=>'BLOCK'
,p_display_name=>'Block'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(1538206665980998)
,p_css_classes=>'t-Cards--featured t-Cards--block force-fa-lg'
,p_group_id=>wwv_flow_api.id(1536906422980997)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1540782511981000)
,p_theme_id=>42
,p_name=>'CARDS_COLOR_FILL'
,p_display_name=>'Color Fill'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(1538206665980998)
,p_css_classes=>'t-Cards--animColorFill'
,p_group_id=>wwv_flow_api.id(1540538062981000)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1540990852981000)
,p_theme_id=>42
,p_name=>'CARD_RAISE_CARD'
,p_display_name=>'Raise Card'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(1538206665980998)
,p_css_classes=>'t-Cards--animRaiseCard'
,p_group_id=>wwv_flow_api.id(1540538062981000)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1541176078981000)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(1538206665980998)
,p_css_classes=>'t-Cards--compact'
,p_group_id=>wwv_flow_api.id(1536906422980997)
,p_template_types=>'REPORT'
,p_help_text=>'Use this option when you want to show smaller cards.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1541583090981001)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(1538206665980998)
,p_css_classes=>'t-Cards--displayIcons'
,p_group_id=>wwv_flow_api.id(1541324232981001)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1541796556981002)
,p_theme_id=>42
,p_name=>'DISPLAY_INITIALS'
,p_display_name=>'Display Initials'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(1538206665980998)
,p_css_classes=>'t-Cards--displayInitials'
,p_group_id=>wwv_flow_api.id(1541324232981001)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1541929297981002)
,p_theme_id=>42
,p_name=>'DISPLAY_SUBTITLE'
,p_display_name=>'Display Subtitle'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(1538206665980998)
,p_css_classes=>'t-Cards--displaySubtitle'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1542178497981002)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(1538206665980998)
,p_css_classes=>'t-Cards--featured force-fa-lg'
,p_group_id=>wwv_flow_api.id(1536906422980997)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1542352970981002)
,p_theme_id=>42
,p_name=>'FLOAT'
,p_display_name=>'Float'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(1538206665980998)
,p_css_classes=>'t-Cards--float'
,p_group_id=>wwv_flow_api.id(1534921513980996)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1542510485981002)
,p_theme_id=>42
,p_name=>'HIDDEN_BODY_TEXT'
,p_display_name=>'Hidden'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(1538206665980998)
,p_css_classes=>'t-Cards--hideBody'
,p_group_id=>wwv_flow_api.id(1538791472980999)
,p_template_types=>'REPORT'
,p_help_text=>'This option hides the card body which contains description and subtext.'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1542773396981003)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>70
,p_report_template_id=>wwv_flow_api.id(1538206665980998)
,p_css_classes=>'t-Cards--spanHorizontally'
,p_group_id=>wwv_flow_api.id(1534921513980996)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1542992343981003)
,p_theme_id=>42
,p_name=>'USE_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(1538206665980998)
,p_css_classes=>'u-colors'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1543581183981003)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(1543031146981003)
,p_css_classes=>'t-Comments--basic'
,p_group_id=>wwv_flow_api.id(1543347691981003)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1543783276981004)
,p_theme_id=>42
,p_name=>'SPEECH_BUBBLES'
,p_display_name=>'Speech Bubbles'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(1543031146981003)
,p_css_classes=>'t-Comments--chat'
,p_group_id=>wwv_flow_api.id(1543347691981003)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1544180743981004)
,p_theme_id=>42
,p_name=>'2_COLUMN_GRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(1543853833981004)
,p_css_classes=>'t-MediaList--cols t-MediaList--2cols'
,p_group_id=>wwv_flow_api.id(1534921513980996)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1544351702981004)
,p_theme_id=>42
,p_name=>'3_COLUMN_GRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(1543853833981004)
,p_css_classes=>'t-MediaList--cols t-MediaList--3cols'
,p_group_id=>wwv_flow_api.id(1534921513980996)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1544549663981004)
,p_theme_id=>42
,p_name=>'4_COLUMN_GRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(1543853833981004)
,p_css_classes=>'t-MediaList--cols t-MediaList--4cols'
,p_group_id=>wwv_flow_api.id(1534921513980996)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1544742297981004)
,p_theme_id=>42
,p_name=>'5_COLUMN_GRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(1543853833981004)
,p_css_classes=>'t-MediaList--cols t-MediaList--5cols'
,p_group_id=>wwv_flow_api.id(1534921513980996)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1544986314981005)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(1543853833981004)
,p_css_classes=>'u-colors'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1545357578981005)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(1543853833981004)
,p_css_classes=>'t-MediaList--large force-fa-lg'
,p_group_id=>wwv_flow_api.id(1545197875981005)
,p_template_types=>'REPORT'
,p_help_text=>'Increases the size of the text and icons in the list.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1545557727981005)
,p_theme_id=>42
,p_name=>'SHOW_BADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(1543853833981004)
,p_css_classes=>'t-MediaList--showBadges'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1545756666981005)
,p_theme_id=>42
,p_name=>'SHOW_DESCRIPTION'
,p_display_name=>'Show Description'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(1543853833981004)
,p_css_classes=>'t-MediaList--showDesc'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1545974892981005)
,p_theme_id=>42
,p_name=>'SHOW_ICONS'
,p_display_name=>'Show Icons'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(1543853833981004)
,p_css_classes=>'t-MediaList--showIcons'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1546169429981005)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTAL'
,p_display_name=>'Span Horizontal'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(1543853833981004)
,p_css_classes=>'t-MediaList--horizontal'
,p_group_id=>wwv_flow_api.id(1534921513980996)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1546364747981005)
,p_theme_id=>42
,p_name=>'STACK'
,p_display_name=>'Stack'
,p_display_sequence=>5
,p_report_template_id=>wwv_flow_api.id(1543853833981004)
,p_css_classes=>'t-MediaList--stack'
,p_group_id=>wwv_flow_api.id(1534921513980996)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1547118379981006)
,p_theme_id=>42
,p_name=>'ALTROWCOLORSDISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(1546658332981006)
,p_css_classes=>'t-Report--staticRowColors'
,p_group_id=>wwv_flow_api.id(1546987557981006)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1547334596981006)
,p_theme_id=>42
,p_name=>'ALTROWCOLORSENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(1546658332981006)
,p_css_classes=>'t-Report--altRowsDefault'
,p_group_id=>wwv_flow_api.id(1546987557981006)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1547741837981007)
,p_theme_id=>42
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(1546658332981006)
,p_css_classes=>'t-Report--rowHighlight'
,p_group_id=>wwv_flow_api.id(1547561397981006)
,p_template_types=>'REPORT'
,p_help_text=>'Enable row highlighting on mouse over'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1548195861981007)
,p_theme_id=>42
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Only'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(1546658332981006)
,p_css_classes=>'t-Report--horizontalBorders'
,p_group_id=>wwv_flow_api.id(1547930732981007)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1548319277981007)
,p_theme_id=>42
,p_name=>'REMOVEALLBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(1546658332981006)
,p_css_classes=>'t-Report--noBorders'
,p_group_id=>wwv_flow_api.id(1547930732981007)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1548588334981007)
,p_theme_id=>42
,p_name=>'REMOVEOUTERBORDERS'
,p_display_name=>'No Outer Borders'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(1546658332981006)
,p_css_classes=>'t-Report--inline'
,p_group_id=>wwv_flow_api.id(1547930732981007)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1548744558981007)
,p_theme_id=>42
,p_name=>'ROWHIGHLIGHTDISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(1546658332981006)
,p_css_classes=>'t-Report--rowHighlightOff'
,p_group_id=>wwv_flow_api.id(1547561397981006)
,p_template_types=>'REPORT'
,p_help_text=>'Disable row highlighting on mouse over'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1548914873981008)
,p_theme_id=>42
,p_name=>'STRETCHREPORT'
,p_display_name=>'Stretch Report'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(1546658332981006)
,p_css_classes=>'t-Report--stretch'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1549195364981008)
,p_theme_id=>42
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Only'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(1546658332981006)
,p_css_classes=>'t-Report--verticalBorders'
,p_group_id=>wwv_flow_api.id(1547930732981007)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1549562900981008)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(1549271812981008)
,p_css_classes=>'t-Timeline--compact'
,p_group_id=>wwv_flow_api.id(1536906422980997)
,p_template_types=>'REPORT'
,p_help_text=>'Displays a compact version of timeline with smaller text and fewer columns.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1550159927981008)
,p_theme_id=>42
,p_name=>'FIXED_LARGE'
,p_display_name=>'Fixed - Large'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(1549668440981008)
,p_css_classes=>'t-AVPList--fixedLabelLarge'
,p_group_id=>wwv_flow_api.id(1549977580981008)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1550330348981009)
,p_theme_id=>42
,p_name=>'FIXED_MEDIUM'
,p_display_name=>'Fixed - Medium'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(1549668440981008)
,p_css_classes=>'t-AVPList--fixedLabelMedium'
,p_group_id=>wwv_flow_api.id(1549977580981008)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1550540393981009)
,p_theme_id=>42
,p_name=>'FIXED_SMALL'
,p_display_name=>'Fixed - Small'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(1549668440981008)
,p_css_classes=>'t-AVPList--fixedLabelSmall'
,p_group_id=>wwv_flow_api.id(1549977580981008)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1550790455981009)
,p_theme_id=>42
,p_name=>'LEFT_ALIGNED_DETAILS'
,p_display_name=>'Left Aligned Details'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(1549668440981008)
,p_css_classes=>'t-AVPList--leftAligned'
,p_group_id=>wwv_flow_api.id(1534921513980996)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1550948101981009)
,p_theme_id=>42
,p_name=>'RIGHT_ALIGNED_DETAILS'
,p_display_name=>'Right Aligned Details'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(1549668440981008)
,p_css_classes=>'t-AVPList--rightAligned'
,p_group_id=>wwv_flow_api.id(1534921513980996)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1551198729981009)
,p_theme_id=>42
,p_name=>'VARIABLE_LARGE'
,p_display_name=>'Variable - Large'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(1549668440981008)
,p_css_classes=>'t-AVPList--variableLabelLarge'
,p_group_id=>wwv_flow_api.id(1549977580981008)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1551387823981009)
,p_theme_id=>42
,p_name=>'VARIABLE_MEDIUM'
,p_display_name=>'Variable - Medium'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(1549668440981008)
,p_css_classes=>'t-AVPList--variableLabelMedium'
,p_group_id=>wwv_flow_api.id(1549977580981008)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1551512222981010)
,p_theme_id=>42
,p_name=>'VARIABLE_SMALL'
,p_display_name=>'Variable - Small'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(1549668440981008)
,p_css_classes=>'t-AVPList--variableLabelSmall'
,p_group_id=>wwv_flow_api.id(1549977580981008)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1551981065981010)
,p_theme_id=>42
,p_name=>'FIXED_LARGE'
,p_display_name=>'Fixed - Large'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(1551696058981010)
,p_css_classes=>'t-AVPList--fixedLabelLarge'
,p_group_id=>wwv_flow_api.id(1549977580981008)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1552164187981010)
,p_theme_id=>42
,p_name=>'FIXED_MEDIUM'
,p_display_name=>'Fixed - Medium'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(1551696058981010)
,p_css_classes=>'t-AVPList--fixedLabelMedium'
,p_group_id=>wwv_flow_api.id(1549977580981008)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1552366847981010)
,p_theme_id=>42
,p_name=>'FIXED_SMALL'
,p_display_name=>'Fixed - Small'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(1551696058981010)
,p_css_classes=>'t-AVPList--fixedLabelSmall'
,p_group_id=>wwv_flow_api.id(1549977580981008)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1552597827981010)
,p_theme_id=>42
,p_name=>'LEFT_ALIGNED_DETAILS'
,p_display_name=>'Left Aligned Details'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(1551696058981010)
,p_css_classes=>'t-AVPList--leftAligned'
,p_group_id=>wwv_flow_api.id(1534921513980996)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1552792825981010)
,p_theme_id=>42
,p_name=>'RIGHT_ALIGNED_DETAILS'
,p_display_name=>'Right Aligned Details'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(1551696058981010)
,p_css_classes=>'t-AVPList--rightAligned'
,p_group_id=>wwv_flow_api.id(1534921513980996)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1552952930981010)
,p_theme_id=>42
,p_name=>'VARIABLE_LARGE'
,p_display_name=>'Variable - Large'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(1551696058981010)
,p_css_classes=>'t-AVPList--variableLabelLarge'
,p_group_id=>wwv_flow_api.id(1549977580981008)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1553167245981010)
,p_theme_id=>42
,p_name=>'VARIABLE_MEDIUM'
,p_display_name=>'Variable - Medium'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(1551696058981010)
,p_css_classes=>'t-AVPList--variableLabelMedium'
,p_group_id=>wwv_flow_api.id(1549977580981008)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1553351403981010)
,p_theme_id=>42
,p_name=>'VARIABLE_SMALL'
,p_display_name=>'Variable - Small'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(1551696058981010)
,p_css_classes=>'t-AVPList--variableLabelSmall'
,p_group_id=>wwv_flow_api.id(1549977580981008)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1553932892981013)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(1553457955981011)
,p_css_classes=>'t-BadgeList--cols'
,p_group_id=>wwv_flow_api.id(1553702366981013)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a two column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554150171981013)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(1553457955981011)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--3cols'
,p_group_id=>wwv_flow_api.id(1553702366981013)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a 3 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554360657981013)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(1553457955981011)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--4cols'
,p_group_id=>wwv_flow_api.id(1553702366981013)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in 4 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554524250981013)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(1553457955981011)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--5cols'
,p_group_id=>wwv_flow_api.id(1553702366981013)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a 5 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554739186981014)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(1553457955981011)
,p_css_classes=>'u-colors'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1555197468981014)
,p_theme_id=>42
,p_name=>'CIRCULAR'
,p_display_name=>'Circular'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(1553457955981011)
,p_css_classes=>'t-BadgeList--circular'
,p_group_id=>wwv_flow_api.id(1554925326981014)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1555337564981014)
,p_theme_id=>42
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_api.id(1553457955981011)
,p_css_classes=>'t-BadgeList--fixed'
,p_group_id=>wwv_flow_api.id(1553702366981013)
,p_template_types=>'LIST'
,p_help_text=>'Span badges horizontally'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1555511918981014)
,p_theme_id=>42
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>80
,p_list_template_id=>wwv_flow_api.id(1553457955981011)
,p_css_classes=>'t-BadgeList--flex'
,p_group_id=>wwv_flow_api.id(1553702366981013)
,p_template_types=>'LIST'
,p_help_text=>'Use flexbox to arrange items'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1555774044981014)
,p_theme_id=>42
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>70
,p_list_template_id=>wwv_flow_api.id(1553457955981011)
,p_css_classes=>'t-BadgeList--float'
,p_group_id=>wwv_flow_api.id(1553702366981013)
,p_template_types=>'LIST'
,p_help_text=>'Float badges to left'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1555914768981014)
,p_theme_id=>42
,p_name=>'GRID'
,p_display_name=>'Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(1553457955981011)
,p_css_classes=>'t-BadgeList--dash'
,p_group_id=>wwv_flow_api.id(1554925326981014)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1556354778981014)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'64px'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(1553457955981011)
,p_css_classes=>'t-BadgeList--large'
,p_group_id=>wwv_flow_api.id(1556167843981014)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1556549161981014)
,p_theme_id=>42
,p_name=>'MEDIUM'
,p_display_name=>'48px'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(1553457955981011)
,p_css_classes=>'t-BadgeList--medium'
,p_group_id=>wwv_flow_api.id(1556167843981014)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1556786294981014)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'32px'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(1553457955981011)
,p_css_classes=>'t-BadgeList--small'
,p_group_id=>wwv_flow_api.id(1556167843981014)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1556928843981014)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(1553457955981011)
,p_css_classes=>'t-BadgeList--stacked'
,p_group_id=>wwv_flow_api.id(1553702366981013)
,p_template_types=>'LIST'
,p_help_text=>'Stack badges on top of each other'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1557155490981015)
,p_theme_id=>42
,p_name=>'XLARGE'
,p_display_name=>'96px'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(1553457955981011)
,p_css_classes=>'t-BadgeList--xlarge'
,p_group_id=>wwv_flow_api.id(1556167843981014)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1557380114981015)
,p_theme_id=>42
,p_name=>'XXLARGE'
,p_display_name=>'128px'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(1553457955981011)
,p_css_classes=>'t-BadgeList--xxlarge'
,p_group_id=>wwv_flow_api.id(1556167843981014)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1557755041981015)
,p_theme_id=>42
,p_name=>'2_COLUMNS'
,p_display_name=>'2 Columns'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(1557402507981015)
,p_css_classes=>'t-Cards--cols'
,p_group_id=>wwv_flow_api.id(1553702366981013)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1558129649981016)
,p_theme_id=>42
,p_name=>'2_LINES'
,p_display_name=>'2 Lines'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(1557402507981015)
,p_css_classes=>'t-Cards--desc-2ln'
,p_group_id=>wwv_flow_api.id(1557910538981016)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1558367167981016)
,p_theme_id=>42
,p_name=>'3_COLUMNS'
,p_display_name=>'3 Columns'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(1557402507981015)
,p_css_classes=>'t-Cards--3cols'
,p_group_id=>wwv_flow_api.id(1553702366981013)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1558532325981016)
,p_theme_id=>42
,p_name=>'3_LINES'
,p_display_name=>'3 Lines'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(1557402507981015)
,p_css_classes=>'t-Cards--desc-3ln'
,p_group_id=>wwv_flow_api.id(1557910538981016)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1558729863981016)
,p_theme_id=>42
,p_name=>'4_COLUMNS'
,p_display_name=>'4 Columns'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(1557402507981015)
,p_css_classes=>'t-Cards--4cols'
,p_group_id=>wwv_flow_api.id(1553702366981013)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1558901200981016)
,p_theme_id=>42
,p_name=>'4_LINES'
,p_display_name=>'4 Lines'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(1557402507981015)
,p_css_classes=>'t-Cards--desc-4ln'
,p_group_id=>wwv_flow_api.id(1557910538981016)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1559154946981016)
,p_theme_id=>42
,p_name=>'5_COLUMNS'
,p_display_name=>'5 Columns'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(1557402507981015)
,p_css_classes=>'t-Cards--5cols'
,p_group_id=>wwv_flow_api.id(1553702366981013)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1559346019981016)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(1557402507981015)
,p_css_classes=>'t-Cards--basic'
,p_group_id=>wwv_flow_api.id(1554925326981014)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1559562552981016)
,p_theme_id=>42
,p_name=>'BLOCK'
,p_display_name=>'Block'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(1557402507981015)
,p_css_classes=>'t-Cards--featured t-Cards--block force-fa-lg'
,p_group_id=>wwv_flow_api.id(1554925326981014)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1559777275981016)
,p_theme_id=>42
,p_name=>'CARDS_STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>5
,p_list_template_id=>wwv_flow_api.id(1557402507981015)
,p_css_classes=>'t-Cards--stacked'
,p_group_id=>wwv_flow_api.id(1553702366981013)
,p_template_types=>'LIST'
,p_help_text=>'Stacks the cards on top of each other.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1560189940981017)
,p_theme_id=>42
,p_name=>'COLOR_FILL'
,p_display_name=>'Color Fill'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(1557402507981015)
,p_css_classes=>'t-Cards--animColorFill'
,p_group_id=>wwv_flow_api.id(1559989756981017)
,p_template_types=>'LIST'
,p_help_text=>'Fills the card background with the color of the icon or default link style.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1560344513981017)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(1557402507981015)
,p_css_classes=>'t-Cards--compact'
,p_group_id=>wwv_flow_api.id(1554925326981014)
,p_template_types=>'LIST'
,p_help_text=>'Use this option when you want to show smaller cards.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1560740866981017)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(1557402507981015)
,p_css_classes=>'t-Cards--displayIcons'
,p_group_id=>wwv_flow_api.id(1560551831981017)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1560926547981017)
,p_theme_id=>42
,p_name=>'DISPLAY_INITIALS'
,p_display_name=>'Display Initials'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(1557402507981015)
,p_css_classes=>'t-Cards--displayInitials'
,p_group_id=>wwv_flow_api.id(1560551831981017)
,p_template_types=>'LIST'
,p_help_text=>'Initials come from List Attribute 3'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1561126330981017)
,p_theme_id=>42
,p_name=>'DISPLAY_SUBTITLE'
,p_display_name=>'Display Subtitle'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(1557402507981015)
,p_css_classes=>'t-Cards--displaySubtitle'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1561304925981018)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(1557402507981015)
,p_css_classes=>'t-Cards--featured force-fa-lg'
,p_group_id=>wwv_flow_api.id(1554925326981014)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1561559256981018)
,p_theme_id=>42
,p_name=>'FLOAT'
,p_display_name=>'Float'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_api.id(1557402507981015)
,p_css_classes=>'t-Cards--float'
,p_group_id=>wwv_flow_api.id(1553702366981013)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1561756838981018)
,p_theme_id=>42
,p_name=>'HIDDEN_BODY_TEXT'
,p_display_name=>'Hidden'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(1557402507981015)
,p_css_classes=>'t-Cards--hideBody'
,p_group_id=>wwv_flow_api.id(1557910538981016)
,p_template_types=>'LIST'
,p_help_text=>'This option hides the card body which contains description and subtext.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1561922972981018)
,p_theme_id=>42
,p_name=>'RAISE_CARD'
,p_display_name=>'Raise Card'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(1557402507981015)
,p_css_classes=>'t-Cards--animRaiseCard'
,p_group_id=>wwv_flow_api.id(1559989756981017)
,p_template_types=>'LIST'
,p_help_text=>'Raises the card so it pops up.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1562184706981018)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>70
,p_list_template_id=>wwv_flow_api.id(1557402507981015)
,p_css_classes=>'t-Cards--spanHorizontally'
,p_group_id=>wwv_flow_api.id(1553702366981013)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1562340853981018)
,p_theme_id=>42
,p_name=>'USE_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(1557402507981015)
,p_css_classes=>'u-colors'
,p_template_types=>'LIST'
,p_help_text=>'Applies the colors from the theme''s color palette to the icons or initials within cards.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1562779090981019)
,p_theme_id=>42
,p_name=>'ACTIONS'
,p_display_name=>'Actions'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(1562409980981018)
,p_css_classes=>'t-LinksList--actions'
,p_group_id=>wwv_flow_api.id(1554925326981014)
,p_template_types=>'LIST'
,p_help_text=>'Render as actions to be placed on the right side column.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1562968299981019)
,p_theme_id=>42
,p_name=>'DISABLETEXTWRAPPING'
,p_display_name=>'Disable Text Wrapping'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(1562409980981018)
,p_css_classes=>'t-LinksList--nowrap'
,p_template_types=>'LIST'
,p_help_text=>'Do not allow link text to wrap to new lines. Truncate with ellipsis.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1563131288981019)
,p_theme_id=>42
,p_name=>'SHOWBADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(1562409980981018)
,p_css_classes=>'t-LinksList--showBadge'
,p_template_types=>'LIST'
,p_help_text=>'Show badge to right of link (requires Attribute 1 to be populated)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1563362528981019)
,p_theme_id=>42
,p_name=>'SHOWGOTOARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(1562409980981018)
,p_css_classes=>'t-LinksList--showArrow'
,p_template_types=>'LIST'
,p_help_text=>'Show arrow to the right of link'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1563765294981019)
,p_theme_id=>42
,p_name=>'SHOWICONS'
,p_display_name=>'For All Items'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(1562409980981018)
,p_css_classes=>'t-LinksList--showIcons'
,p_group_id=>wwv_flow_api.id(1563561219981019)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1563914261981019)
,p_theme_id=>42
,p_name=>'SHOWTOPICONS'
,p_display_name=>'For Top Level Items Only'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(1562409980981018)
,p_css_classes=>'t-LinksList--showTopIcons'
,p_group_id=>wwv_flow_api.id(1563561219981019)
,p_template_types=>'LIST'
,p_help_text=>'This will show icons for top level items of the list only. It will not show icons for sub lists.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1564361379981020)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(1564028367981019)
,p_css_classes=>'t-MediaList--cols t-MediaList--2cols'
,p_group_id=>wwv_flow_api.id(1553702366981013)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1564522157981020)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(1564028367981019)
,p_css_classes=>'t-MediaList--cols t-MediaList--3cols'
,p_group_id=>wwv_flow_api.id(1553702366981013)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1564707203981020)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(1564028367981019)
,p_css_classes=>'t-MediaList--cols t-MediaList--4cols'
,p_group_id=>wwv_flow_api.id(1553702366981013)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1564960763981020)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(1564028367981019)
,p_css_classes=>'t-MediaList--cols t-MediaList--5cols'
,p_group_id=>wwv_flow_api.id(1553702366981013)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1565174483981020)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(1564028367981019)
,p_css_classes=>'u-colors'
,p_template_types=>'LIST'
,p_help_text=>'Applies colors from the Theme''s color palette to icons in the list.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1565558945981020)
,p_theme_id=>42
,p_name=>'LIST_SIZE_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(1564028367981019)
,p_css_classes=>'t-MediaList--large force-fa-lg'
,p_group_id=>wwv_flow_api.id(1565360501981020)
,p_template_types=>'LIST'
,p_help_text=>'Increases the size of the text and icons in the list.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1565725131981020)
,p_theme_id=>42
,p_name=>'SHOW_BADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(1564028367981019)
,p_css_classes=>'t-MediaList--showBadges'
,p_template_types=>'LIST'
,p_help_text=>'Show a badge (Attribute 2) to the right of the list item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1565956593981020)
,p_theme_id=>42
,p_name=>'SHOW_DESCRIPTION'
,p_display_name=>'Show Description'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(1564028367981019)
,p_css_classes=>'t-MediaList--showDesc'
,p_template_types=>'LIST'
,p_help_text=>'Shows the description (Attribute 1) for each list item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1566136227981020)
,p_theme_id=>42
,p_name=>'SHOW_ICONS'
,p_display_name=>'Show Icons'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(1564028367981019)
,p_css_classes=>'t-MediaList--showIcons'
,p_template_types=>'LIST'
,p_help_text=>'Display an icon next to the list item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1566336568981020)
,p_theme_id=>42
,p_name=>'SPANHORIZONTAL'
,p_display_name=>'Span Horizontal'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(1564028367981019)
,p_css_classes=>'t-MediaList--horizontal'
,p_group_id=>wwv_flow_api.id(1553702366981013)
,p_template_types=>'LIST'
,p_help_text=>'Show all list items in one horizontal row.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1566788113981021)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(1566494090981020)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1566949750981021)
,p_theme_id=>42
,p_name=>'BEHAVE_LIKE_TABS'
,p_display_name=>'Behave Like Tabs'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(1566494090981020)
,p_css_classes=>'js-tabLike'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1567123970981022)
,p_theme_id=>42
,p_name=>'ENABLE_SLIDE_ANIMATION'
,p_display_name=>'Enable Slide Animation'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(1566494090981020)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1567383628981022)
,p_theme_id=>42
,p_name=>'SHOW_SUB_MENU_ICONS'
,p_display_name=>'Show Sub Menu Icons'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(1566494090981020)
,p_css_classes=>'js-showSubMenuIcons'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1568112402981023)
,p_theme_id=>42
,p_name=>'COLLAPSED_DEFAULT'
,p_display_name=>'Collapsed by Default'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(1567840590981022)
,p_css_classes=>'js-defaultCollapsed'
,p_template_types=>'LIST'
,p_help_text=>'This option will load the side navigation menu in a collapsed state by default.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1568584363981024)
,p_theme_id=>42
,p_name=>'ABOVE_LABEL'
,p_display_name=>'Above Label'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(1568278099981024)
,p_css_classes=>'t-Tabs--iconsAbove'
,p_group_id=>wwv_flow_api.id(1560551831981017)
,p_template_types=>'LIST'
,p_help_text=>'Places icons above tab label.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1568794994981024)
,p_theme_id=>42
,p_name=>'FILL_LABELS'
,p_display_name=>'Fill Labels'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(1568278099981024)
,p_css_classes=>'t-Tabs--fillLabels'
,p_group_id=>wwv_flow_api.id(1553702366981013)
,p_template_types=>'LIST'
,p_help_text=>'Stretch tabs to fill to the width of the tabs container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1568932114981024)
,p_theme_id=>42
,p_name=>'INLINE_WITH_LABEL'
,p_display_name=>'Inline with Label'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(1568278099981024)
,p_css_classes=>'t-Tabs--inlineIcons'
,p_group_id=>wwv_flow_api.id(1560551831981017)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1569189746981024)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(1568278099981024)
,p_css_classes=>'t-Tabs--large'
,p_group_id=>wwv_flow_api.id(1565360501981020)
,p_template_types=>'LIST'
,p_help_text=>'Increases font size and white space around tab items.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1569338239981024)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Pill'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(1568278099981024)
,p_css_classes=>'t-Tabs--pill'
,p_group_id=>wwv_flow_api.id(1554925326981014)
,p_template_types=>'LIST'
,p_help_text=>'Displays tabs in a pill container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1569578546981024)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(1568278099981024)
,p_css_classes=>'t-Tabs--simple'
,p_group_id=>wwv_flow_api.id(1554925326981014)
,p_template_types=>'LIST'
,p_help_text=>'A very simplistic tab UI.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1569772513981024)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>5
,p_list_template_id=>wwv_flow_api.id(1568278099981024)
,p_css_classes=>'t-Tabs--small'
,p_group_id=>wwv_flow_api.id(1565360501981020)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1570117984981025)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(1569820044981024)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1570346739981025)
,p_theme_id=>42
,p_name=>'BEHAVE_LIKE_TABS'
,p_display_name=>'Behave Like Tabs'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(1569820044981024)
,p_css_classes=>'js-tabLike'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1570536677981025)
,p_theme_id=>42
,p_name=>'ENABLE_SLIDE_ANIMATION'
,p_display_name=>'Enable Slide Animation'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(1569820044981024)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1570789579981025)
,p_theme_id=>42
,p_name=>'SHOW_SUB_MENU_ICONS'
,p_display_name=>'Show Sub Menu Icons'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(1569820044981024)
,p_css_classes=>'js-showSubMenuIcons'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1571374625981025)
,p_theme_id=>42
,p_name=>'DISPLAY_LABELS_SM'
,p_display_name=>'Display labels'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(1570849575981025)
,p_css_classes=>'t-NavTabs--displayLabels-sm'
,p_group_id=>wwv_flow_api.id(1571106702981025)
,p_template_types=>'LIST'
,p_help_text=>'Displays the label for the list items below the icon'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1571556051981026)
,p_theme_id=>42
,p_name=>'HIDE_LABELS_SM'
,p_display_name=>'Do not display labels'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(1570849575981025)
,p_css_classes=>'t-NavTabs--hiddenLabels-sm'
,p_group_id=>wwv_flow_api.id(1571106702981025)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1571915578981026)
,p_theme_id=>42
,p_name=>'LABEL_ABOVE_LG'
,p_display_name=>'Display labels above'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(1570849575981025)
,p_css_classes=>'t-NavTabs--stacked'
,p_group_id=>wwv_flow_api.id(1571767669981026)
,p_template_types=>'LIST'
,p_help_text=>'Display the label stacked above the icon and badge'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1572145215981027)
,p_theme_id=>42
,p_name=>'LABEL_INLINE_LG'
,p_display_name=>'Display labels inline'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(1570849575981025)
,p_css_classes=>'t-NavTabs--inlineLabels-lg'
,p_group_id=>wwv_flow_api.id(1571767669981026)
,p_template_types=>'LIST'
,p_help_text=>'Display the label inline with the icon and badge'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1572375584981027)
,p_theme_id=>42
,p_name=>'NO_LABEL_LG'
,p_display_name=>'Do not display labels'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(1570849575981025)
,p_css_classes=>'t-NavTabs--hiddenLabels-lg'
,p_group_id=>wwv_flow_api.id(1571767669981026)
,p_template_types=>'LIST'
,p_help_text=>'Hides the label for the list item'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1572931207981028)
,p_theme_id=>42
,p_name=>'ALLSTEPS'
,p_display_name=>'All Steps'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(1572406021981027)
,p_css_classes=>'t-WizardSteps--displayLabels'
,p_group_id=>wwv_flow_api.id(1572746040981027)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1573126490981028)
,p_theme_id=>42
,p_name=>'CURRENTSTEPONLY'
,p_display_name=>'Current Step Only'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(1572406021981027)
,p_css_classes=>'t-WizardSteps--displayCurrentLabelOnly'
,p_group_id=>wwv_flow_api.id(1572746040981027)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1573371857981028)
,p_theme_id=>42
,p_name=>'HIDELABELS'
,p_display_name=>'Hide Labels'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(1572406021981027)
,p_css_classes=>'t-WizardSteps--hideLabels'
,p_group_id=>wwv_flow_api.id(1572746040981027)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1573526384981028)
,p_theme_id=>42
,p_name=>'VERTICAL_LIST'
,p_display_name=>'Vertical Orientation'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(1572406021981027)
,p_css_classes=>'t-WizardSteps--vertical'
,p_template_types=>'LIST'
,p_help_text=>'Displays the wizard progress list in a vertical orientation and is suitable for displaying within a side column of a page.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1574956396981032)
,p_theme_id=>42
,p_name=>'LEFTICON'
,p_display_name=>'Left'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_api.id(1574539776981032)
,p_css_classes=>'t-Button--iconLeft'
,p_group_id=>wwv_flow_api.id(1574743555981032)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1575181399981032)
,p_theme_id=>42
,p_name=>'RIGHTICON'
,p_display_name=>'Right'
,p_display_sequence=>20
,p_button_template_id=>wwv_flow_api.id(1574539776981032)
,p_css_classes=>'t-Button--iconRight'
,p_group_id=>wwv_flow_api.id(1574743555981032)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1577064313981050)
,p_theme_id=>42
,p_name=>'DANGER'
,p_display_name=>'Danger'
,p_display_sequence=>30
,p_css_classes=>'t-Button--danger'
,p_group_id=>wwv_flow_api.id(1576844919981049)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1577446376981050)
,p_theme_id=>42
,p_name=>'DISPLAY_AS_LINK'
,p_display_name=>'Display as Link'
,p_display_sequence=>30
,p_css_classes=>'t-Button--link'
,p_group_id=>wwv_flow_api.id(1577240695981050)
,p_template_types=>'BUTTON'
,p_help_text=>'This option makes the button appear as a text link.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1577832668981050)
,p_theme_id=>42
,p_name=>'DISPLAY_AS_PILL_BUTTON'
,p_display_name=>'Display as Pill Button'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--radioButtonGroup'
,p_group_id=>wwv_flow_api.id(1577651152981050)
,p_template_types=>'FIELD'
,p_help_text=>'Displays the radio buttons to look like a button set / pill button.  Note that the the radio buttons must all be in the same row for this option to work.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1578202209981051)
,p_theme_id=>42
,p_name=>'FBM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-bottom-lg'
,p_group_id=>wwv_flow_api.id(1578075035981051)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large bottom margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1578449915981051)
,p_theme_id=>42
,p_name=>'FBM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-bottom-md'
,p_group_id=>wwv_flow_api.id(1578075035981051)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium bottom margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1578664410981051)
,p_theme_id=>42
,p_name=>'FBM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-bottom-none'
,p_group_id=>wwv_flow_api.id(1578075035981051)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the bottom margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1578816711981051)
,p_theme_id=>42
,p_name=>'FBM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-bottom-sm'
,p_group_id=>wwv_flow_api.id(1578075035981051)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small bottom margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1579292721981051)
,p_theme_id=>42
,p_name=>'FLM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-left-lg'
,p_group_id=>wwv_flow_api.id(1579071701981051)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large left margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1579446305981051)
,p_theme_id=>42
,p_name=>'FLM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-left-md'
,p_group_id=>wwv_flow_api.id(1579071701981051)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium left margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1579634324981052)
,p_theme_id=>42
,p_name=>'FLM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-left-none'
,p_group_id=>wwv_flow_api.id(1579071701981051)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the left margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1579840446981052)
,p_theme_id=>42
,p_name=>'FLM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-left-sm'
,p_group_id=>wwv_flow_api.id(1579071701981051)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small left margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1580212889981052)
,p_theme_id=>42
,p_name=>'FORMLEFTLABELS'
,p_display_name=>'Left'
,p_display_sequence=>20
,p_css_classes=>'t-Form--leftLabels'
,p_group_id=>wwv_flow_api.id(1580077918981052)
,p_template_types=>'REGION'
,p_help_text=>'Align form labels to left.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1580638123981052)
,p_theme_id=>42
,p_name=>'FORMREMOVEPADDING'
,p_display_name=>'Remove Padding'
,p_display_sequence=>20
,p_css_classes=>'t-Form--noPadding'
,p_group_id=>wwv_flow_api.id(1580442992981052)
,p_template_types=>'REGION'
,p_help_text=>'Removes padding between items.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1581046961981052)
,p_theme_id=>42
,p_name=>'FORMSIZELARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_css_classes=>'t-Form--large'
,p_group_id=>wwv_flow_api.id(1580841881981052)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1581252955981052)
,p_theme_id=>42
,p_name=>'FORMSIZEXLARGE'
,p_display_name=>'X Large'
,p_display_sequence=>20
,p_css_classes=>'t-Form--xlarge'
,p_group_id=>wwv_flow_api.id(1580841881981052)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1581448566981052)
,p_theme_id=>42
,p_name=>'FORMSLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>10
,p_css_classes=>'t-Form--slimPadding'
,p_group_id=>wwv_flow_api.id(1580442992981052)
,p_template_types=>'REGION'
,p_help_text=>'Reduces form item padding to 4px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1581851310981053)
,p_theme_id=>42
,p_name=>'FRM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-right-lg'
,p_group_id=>wwv_flow_api.id(1581699037981052)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large right margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1582024821981053)
,p_theme_id=>42
,p_name=>'FRM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-right-md'
,p_group_id=>wwv_flow_api.id(1581699037981052)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium right margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1582205666981053)
,p_theme_id=>42
,p_name=>'FRM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-right-none'
,p_group_id=>wwv_flow_api.id(1581699037981052)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the right margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1582403804981053)
,p_theme_id=>42
,p_name=>'FRM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-right-sm'
,p_group_id=>wwv_flow_api.id(1581699037981052)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small right margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1582893763981053)
,p_theme_id=>42
,p_name=>'FTM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-top-lg'
,p_group_id=>wwv_flow_api.id(1582672840981053)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large top margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1583090421981053)
,p_theme_id=>42
,p_name=>'FTM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-top-md'
,p_group_id=>wwv_flow_api.id(1582672840981053)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium top margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1583204032981053)
,p_theme_id=>42
,p_name=>'FTM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-top-none'
,p_group_id=>wwv_flow_api.id(1582672840981053)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the top margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1583408392981053)
,p_theme_id=>42
,p_name=>'FTM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-top-sm'
,p_group_id=>wwv_flow_api.id(1582672840981053)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small top margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1583848998981054)
,p_theme_id=>42
,p_name=>'HIDE_WHEN_ALL_ROWS_DISPLAYED'
,p_display_name=>'Hide when all rows displayed'
,p_display_sequence=>10
,p_css_classes=>'t-Report--hideNoPagination'
,p_group_id=>wwv_flow_api.id(1583695642981054)
,p_template_types=>'REPORT'
,p_help_text=>'This option will hide the pagination when all rows are displayed.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1584244720981054)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>30
,p_css_classes=>'t-Button--large'
,p_group_id=>wwv_flow_api.id(1584032622981054)
,p_template_types=>'BUTTON'
,p_help_text=>'A large button.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1584662858981054)
,p_theme_id=>42
,p_name=>'LARGEBOTTOMMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapBottom'
,p_group_id=>wwv_flow_api.id(1584400542981054)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1585020503981054)
,p_theme_id=>42
,p_name=>'LARGELEFTMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapLeft'
,p_group_id=>wwv_flow_api.id(1584859453981054)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1585412616981054)
,p_theme_id=>42
,p_name=>'LARGERIGHTMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapRight'
,p_group_id=>wwv_flow_api.id(1585280380981054)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1585816828981054)
,p_theme_id=>42
,p_name=>'LARGETOPMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapTop'
,p_group_id=>wwv_flow_api.id(1585689136981054)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1586284603981055)
,p_theme_id=>42
,p_name=>'LARGE_FIELD'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--large'
,p_group_id=>wwv_flow_api.id(1586051414981055)
,p_template_types=>'FIELD'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1586403631981055)
,p_theme_id=>42
,p_name=>'NOUI'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>20
,p_css_classes=>'t-Button--noUI'
,p_group_id=>wwv_flow_api.id(1577240695981050)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1586859019981055)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Inner Button'
,p_display_sequence=>20
,p_css_classes=>'t-Button--pill'
,p_group_id=>wwv_flow_api.id(1586657095981055)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1587075557981055)
,p_theme_id=>42
,p_name=>'PILLEND'
,p_display_name=>'Last Button'
,p_display_sequence=>30
,p_css_classes=>'t-Button--pillEnd'
,p_group_id=>wwv_flow_api.id(1586657095981055)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1587223483981055)
,p_theme_id=>42
,p_name=>'PILLSTART'
,p_display_name=>'First Button'
,p_display_sequence=>10
,p_css_classes=>'t-Button--pillStart'
,p_group_id=>wwv_flow_api.id(1586657095981055)
,p_template_types=>'BUTTON'
,p_help_text=>'Use this for the start of a pill button.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1587622748981056)
,p_theme_id=>42
,p_name=>'POST_TEXT_BLOCK'
,p_display_name=>'Display as Block'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--postTextBlock'
,p_group_id=>wwv_flow_api.id(1587440938981055)
,p_template_types=>'FIELD'
,p_help_text=>'Displays the Item Post Text in a block style immediately after the item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1588036606981056)
,p_theme_id=>42
,p_name=>'PRE_TEXT_BLOCK'
,p_display_name=>'Display as Block'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--preTextBlock'
,p_group_id=>wwv_flow_api.id(1587834315981056)
,p_template_types=>'FIELD'
,p_help_text=>'Displays the Item Pre Text in a block style immediately before the item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1588228319981056)
,p_theme_id=>42
,p_name=>'PRIMARY'
,p_display_name=>'Primary'
,p_display_sequence=>10
,p_css_classes=>'t-Button--primary'
,p_group_id=>wwv_flow_api.id(1576844919981049)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1588620874981056)
,p_theme_id=>42
,p_name=>'RBM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-bottom-lg'
,p_group_id=>wwv_flow_api.id(1588475456981056)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large bottom margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1588853735981056)
,p_theme_id=>42
,p_name=>'RBM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-bottom-md'
,p_group_id=>wwv_flow_api.id(1588475456981056)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium bottom margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1589058643981056)
,p_theme_id=>42
,p_name=>'RBM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-bottom-none'
,p_group_id=>wwv_flow_api.id(1588475456981056)
,p_template_types=>'REGION'
,p_help_text=>'Removes the bottom margin for this region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1589259271981056)
,p_theme_id=>42
,p_name=>'RBM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-bottom-sm'
,p_group_id=>wwv_flow_api.id(1588475456981056)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small bottom margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1589652060981056)
,p_theme_id=>42
,p_name=>'RLM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-left-lg'
,p_group_id=>wwv_flow_api.id(1589431648981056)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large right margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1589891841981056)
,p_theme_id=>42
,p_name=>'RLM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-left-md'
,p_group_id=>wwv_flow_api.id(1589431648981056)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium right margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1590065562981057)
,p_theme_id=>42
,p_name=>'RLM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-left-none'
,p_group_id=>wwv_flow_api.id(1589431648981056)
,p_template_types=>'REGION'
,p_help_text=>'Removes the left margin from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1590253536981057)
,p_theme_id=>42
,p_name=>'RLM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-left-sm'
,p_group_id=>wwv_flow_api.id(1589431648981056)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small left margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1590699241981057)
,p_theme_id=>42
,p_name=>'RRM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-right-lg'
,p_group_id=>wwv_flow_api.id(1590423090981057)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large right margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1590882758981057)
,p_theme_id=>42
,p_name=>'RRM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-right-md'
,p_group_id=>wwv_flow_api.id(1590423090981057)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium right margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1591092650981057)
,p_theme_id=>42
,p_name=>'RRM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-right-none'
,p_group_id=>wwv_flow_api.id(1590423090981057)
,p_template_types=>'REGION'
,p_help_text=>'Removes the right margin from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1591243132981057)
,p_theme_id=>42
,p_name=>'RRM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-right-sm'
,p_group_id=>wwv_flow_api.id(1590423090981057)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small right margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1591615084981058)
,p_theme_id=>42
,p_name=>'RTM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-top-lg'
,p_group_id=>wwv_flow_api.id(1591441552981057)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large top margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1591894818981058)
,p_theme_id=>42
,p_name=>'RTM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-top-md'
,p_group_id=>wwv_flow_api.id(1591441552981057)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium top margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1592048954981058)
,p_theme_id=>42
,p_name=>'RTM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-top-none'
,p_group_id=>wwv_flow_api.id(1591441552981057)
,p_template_types=>'REGION'
,p_help_text=>'Removes the top margin for this region.'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1592283208981058)
,p_theme_id=>42
,p_name=>'RTM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-top-sm'
,p_group_id=>wwv_flow_api.id(1591441552981057)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small top margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1592691152981058)
,p_theme_id=>42
,p_name=>'SHOWFORMLABELSABOVE'
,p_display_name=>'Show Form Labels Above'
,p_display_sequence=>10
,p_css_classes=>'t-Form--labelsAbove'
,p_group_id=>wwv_flow_api.id(1592445574981058)
,p_template_types=>'REGION'
,p_help_text=>'Show form labels above input fields.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1592888063981058)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_css_classes=>'t-Button--simple'
,p_group_id=>wwv_flow_api.id(1577240695981050)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1593017012981058)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'t-Button--small'
,p_group_id=>wwv_flow_api.id(1584032622981054)
,p_template_types=>'BUTTON'
,p_help_text=>'A small button.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1593214866981058)
,p_theme_id=>42
,p_name=>'SMALLBOTTOMMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padBottom'
,p_group_id=>wwv_flow_api.id(1584400542981054)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1593449135981058)
,p_theme_id=>42
,p_name=>'SMALLLEFTMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padLeft'
,p_group_id=>wwv_flow_api.id(1584859453981054)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1593617963981058)
,p_theme_id=>42
,p_name=>'SMALLRIGHTMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padRight'
,p_group_id=>wwv_flow_api.id(1585280380981054)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1593877912981059)
,p_theme_id=>42
,p_name=>'SMALLTOPMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padTop'
,p_group_id=>wwv_flow_api.id(1585689136981054)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1594290978981059)
,p_theme_id=>42
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>10
,p_css_classes=>'t-Button--stretch'
,p_group_id=>wwv_flow_api.id(1594093069981059)
,p_template_types=>'BUTTON'
,p_help_text=>'Stretches button to fill container'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1594671799981059)
,p_theme_id=>42
,p_name=>'STRETCH_FORM_FIELDS'
,p_display_name=>'Stretch Form Fields'
,p_display_sequence=>10
,p_css_classes=>'t-Form--stretchInputs'
,p_group_id=>wwv_flow_api.id(1594455688981059)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1594856779981060)
,p_theme_id=>42
,p_name=>'STRETCH_FORM_ITEM'
,p_display_name=>'Stretch Form Item'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--stretchInputs'
,p_template_types=>'FIELD'
,p_help_text=>'Stretches the form item to fill its container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1595055279981060)
,p_theme_id=>42
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>40
,p_css_classes=>'t-Button--success'
,p_group_id=>wwv_flow_api.id(1576844919981049)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1595286815981060)
,p_theme_id=>42
,p_name=>'TINY'
,p_display_name=>'Tiny'
,p_display_sequence=>10
,p_css_classes=>'t-Button--tiny'
,p_group_id=>wwv_flow_api.id(1584032622981054)
,p_template_types=>'BUTTON'
,p_help_text=>'A very small button.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1595496171981060)
,p_theme_id=>42
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>20
,p_css_classes=>'t-Button--warning'
,p_group_id=>wwv_flow_api.id(1576844919981049)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1595666322981060)
,p_theme_id=>42
,p_name=>'X_LARGE_SIZE'
,p_display_name=>'X Large'
,p_display_sequence=>20
,p_css_classes=>'t-Form-fieldContainer--xlarge'
,p_group_id=>wwv_flow_api.id(1586051414981055)
,p_template_types=>'FIELD'
);
end;
/
prompt --application/shared_components/logic/build_options
begin
null;
end;
/
prompt --application/shared_components/globalization/language
begin
wwv_flow_api.create_language_map(
 p_id=>wwv_flow_api.id(1648066739102587)
,p_translation_flow_id=>1001
,p_translation_flow_language_cd=>'hr'
,p_direction_right_to_left=>'N'
);
wwv_flow_api.create_language_map(
 p_id=>wwv_flow_api.id(1648198705104235)
,p_translation_flow_id=>1002
,p_translation_flow_language_cd=>'de'
,p_direction_right_to_left=>'N'
);
wwv_flow_api.create_language_map(
 p_id=>wwv_flow_api.id(1648213965105768)
,p_translation_flow_id=>1003
,p_translation_flow_language_cd=>'fr'
,p_direction_right_to_left=>'N'
);
end;
/
prompt --application/shared_components/globalization/translations
begin
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1655161100778126)
,p_page_id=>1
,p_translated_flow_id=>1001
,p_translate_to_id=>1.1001
,p_translate_from_id=>1
,p_translate_column_id=>5
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Home'
,p_translate_from_text=>'Home'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1655217105778126)
,p_page_id=>9999
,p_translated_flow_id=>1001
,p_translate_to_id=>9999.1001
,p_translate_from_id=>9999
,p_translate_column_id=>5
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Login Page'
,p_translate_from_text=>'Login Page'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1655456860778126)
,p_page_id=>0
,p_translated_flow_id=>1001
,p_translate_to_id=>.1001
,p_translate_from_id=>0
,p_translate_column_id=>5
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Global Page - Desktop'
,p_translate_from_text=>'Global Page - Desktop'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1655600964778127)
,p_page_id=>3
,p_translated_flow_id=>1001
,p_translate_to_id=>3.1001
,p_translate_from_id=>3
,p_translate_column_id=>5
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Departments'
,p_translate_from_text=>'Departments'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1655862584778127)
,p_page_id=>2
,p_translated_flow_id=>1001
,p_translate_to_id=>2.1001
,p_translate_from_id=>2
,p_translate_column_id=>5
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Employees'
,p_translate_from_text=>'Employees'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1656000860778130)
,p_page_id=>1
,p_translated_flow_id=>1001
,p_translate_to_id=>1.1001
,p_translate_from_id=>1
,p_translate_column_id=>6
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'My Demo App'
,p_translate_from_text=>'My Demo App'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1656227576778131)
,p_page_id=>9999
,p_translated_flow_id=>1001
,p_translate_to_id=>9999.1001
,p_translate_from_id=>9999
,p_translate_column_id=>6
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'My Demo App - Sign In'
,p_translate_from_text=>'My Demo App - Sign In'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1656436830778131)
,p_page_id=>0
,p_translated_flow_id=>1001
,p_translate_to_id=>.1001
,p_translate_from_id=>0
,p_translate_column_id=>6
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Global Page - Desktop'
,p_translate_from_text=>'Global Page - Desktop'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1656685228778131)
,p_page_id=>3
,p_translated_flow_id=>1001
,p_translate_to_id=>3.1001
,p_translate_from_id=>3
,p_translate_column_id=>6
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Departments'
,p_translate_from_text=>'Departments'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1656873387778131)
,p_page_id=>2
,p_translated_flow_id=>1001
,p_translate_to_id=>2.1001
,p_translate_from_id=>2
,p_translate_column_id=>6
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Employees'
,p_translate_from_text=>'Employees'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1657002717778148)
,p_page_id=>2
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1641412958083305.1001)
,p_translate_from_id=>wwv_flow_api.id(1641412958083305)
,p_translate_column_id=>13
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Add Employee'
,p_translate_from_text=>'Add Employee'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1657229822778148)
,p_page_id=>3
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1641301676083304.1001)
,p_translate_from_id=>wwv_flow_api.id(1641301676083304)
,p_translate_column_id=>13
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Add Department'
,p_translate_from_text=>'Add Department'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1657448756778148)
,p_page_id=>9999
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1603366456981130.1001)
,p_translate_from_id=>wwv_flow_api.id(1603366456981130)
,p_translate_column_id=>13
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Sign In'
,p_translate_from_text=>'Sign In'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1657626474778150)
,p_page_id=>1
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1641504035083306.1001)
,p_translate_from_id=>wwv_flow_api.id(1641504035083306)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'App Language'
,p_translate_from_text=>'App Language'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1657866711778151)
,p_page_id=>3
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1641043859083301.1001)
,p_translate_from_id=>wwv_flow_api.id(1641043859083301)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Department Name'
,p_translate_from_text=>'Department Name'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1658044376778151)
,p_page_id=>3
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1641136182083302.1001)
,p_translate_from_id=>wwv_flow_api.id(1641136182083302)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Manager'
,p_translate_from_text=>'Manager'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1658234426778151)
,p_page_id=>3
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1641257616083303.1001)
,p_translate_from_id=>wwv_flow_api.id(1641257616083303)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Location'
,p_translate_from_text=>'Location'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1658428386778151)
,p_page_id=>9999
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1600900224981124.1001)
,p_translate_from_id=>wwv_flow_api.id(1600900224981124)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'username'
,p_translate_from_text=>'username'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1658694937778151)
,p_page_id=>9999
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1601327831981124.1001)
,p_translate_from_id=>wwv_flow_api.id(1601327831981124)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'password'
,p_translate_from_text=>'password'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1658865727778151)
,p_page_id=>9999
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1602416749981127.1001)
,p_translate_from_id=>wwv_flow_api.id(1602416749981127)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Remember username'
,p_translate_from_text=>'Remember username'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1659024083778163)
,p_page_id=>1
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1625329803016601.1001)
,p_translate_from_id=>wwv_flow_api.id(1625329803016601)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'About'
,p_translate_from_text=>'About'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1659223328778163)
,p_page_id=>1
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1641790804083308.1001)
,p_translate_from_id=>wwv_flow_api.id(1641790804083308)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'Lang display'
,p_translate_from_text=>'Lang display'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1659447585778164)
,p_page_id=>2
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1610924665995774.1001)
,p_translate_from_id=>wwv_flow_api.id(1610924665995774)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'Employees'
,p_translate_from_text=>'Employees'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1659692406778164)
,p_page_id=>3
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1619932187999811.1001)
,p_translate_from_id=>wwv_flow_api.id(1619932187999811)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'Departments'
,p_translate_from_text=>'Departments'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1659803941778164)
,p_page_id=>9999
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1600554547981121.1001)
,p_translate_from_id=>wwv_flow_api.id(1600554547981121)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'My Demo App'
,p_translate_from_text=>'My Demo App'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1660019909778164)
,p_page_id=>9999
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1605216128981133.1001)
,p_translate_from_id=>wwv_flow_api.id(1605216128981133)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'Language Selector'
,p_translate_from_text=>'Language Selector'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1660261181778167)
,p_page_id=>1
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1625329803016601.1001)
,p_translate_from_id=>wwv_flow_api.id(1625329803016601)
,p_translate_column_id=>21
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This is a Demo App for HrOUG 2018.',
'<br />',
'<br />'))
,p_translate_from_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This is a Demo App for HrOUG 2018.',
'<br />',
'<br />'))
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1660436616778167)
,p_page_id=>1
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1641790804083308.1001)
,p_translate_from_id=>wwv_flow_api.id(1641790804083308)
,p_translate_column_id=>21
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'htp.p(''App language is set to: <b>''||nvl(APEX_UTIL.GET_SESSION_LANG, ''en'')||''</b>'');'
,p_translate_from_text=>'htp.p(''App language is set to: <b>''||nvl(APEX_UTIL.GET_SESSION_LANG, ''en'')||''</b>'');'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1660654767778167)
,p_page_id=>2
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1610924665995774.1001)
,p_translate_from_id=>wwv_flow_api.id(1610924665995774)
,p_translate_column_id=>21
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select EMPLOYEE_ID,',
'       FIRST_NAME,',
'       LAST_NAME,',
'       EMAIL,',
'       PHONE_NUMBER,',
'       HIRE_DATE,',
'       JOB_ID,',
'       SALARY,',
'       COMMISSION_PCT,',
'       MANAGER_ID,',
'       DEPARTMENT_ID',
'  from EMPLOYEES'))
,p_translate_from_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select EMPLOYEE_ID,',
'       FIRST_NAME,',
'       LAST_NAME,',
'       EMAIL,',
'       PHONE_NUMBER,',
'       HIRE_DATE,',
'       JOB_ID,',
'       SALARY,',
'       COMMISSION_PCT,',
'       MANAGER_ID,',
'       DEPARTMENT_ID',
'  from EMPLOYEES'))
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1660887749778168)
,p_page_id=>3
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1619932187999811.1001)
,p_translate_from_id=>wwv_flow_api.id(1619932187999811)
,p_translate_column_id=>21
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DEPARTMENT_ID,',
'       DEPARTMENT_NAME,',
'       MANAGER_ID,',
'       LOCATION_ID',
'  from DEPARTMENTS'))
,p_translate_from_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DEPARTMENT_ID,',
'       DEPARTMENT_NAME,',
'       MANAGER_ID,',
'       LOCATION_ID',
'  from DEPARTMENTS'))
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1661022075778168)
,p_page_id=>9999
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1605216128981133.1001)
,p_translate_from_id=>wwv_flow_api.id(1605216128981133)
,p_translate_column_id=>21
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'apex_lang.emit_language_selector_list;'
,p_translate_from_text=>'apex_lang.emit_language_selector_list;'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1661273206778183)
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1606485989981138.1001)
,p_translate_from_id=>wwv_flow_api.id(1606485989981138)
,p_translate_column_id=>28
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Home'
,p_translate_from_text=>'Home'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1661458523778183)
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1610593773995748.1001)
,p_translate_from_id=>wwv_flow_api.id(1610593773995748)
,p_translate_column_id=>28
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Employees'
,p_translate_from_text=>'Employees'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1661647230778183)
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1619542523999810.1001)
,p_translate_from_id=>wwv_flow_api.id(1619542523999810)
,p_translate_column_id=>28
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Departments'
,p_translate_from_text=>'Departments'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1661864452778183)
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1608062339981151.1001)
,p_translate_from_id=>wwv_flow_api.id(1608062339981151)
,p_translate_column_id=>28
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'&APP_USER.'
,p_translate_from_text=>'&APP_USER.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1662020713778183)
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1608573375981151.1001)
,p_translate_from_id=>wwv_flow_api.id(1608573375981151)
,p_translate_column_id=>28
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'---'
,p_translate_from_text=>'---'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1662297258778184)
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1608946801981152.1001)
,p_translate_from_id=>wwv_flow_api.id(1608946801981152)
,p_translate_column_id=>28
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Sign Out'
,p_translate_from_text=>'Sign Out'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1662476535778269)
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1575412815981036.1001)
,p_translate_from_id=>wwv_flow_api.id(1575412815981036)
,p_translate_column_id=>63
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Search Dialog'
,p_translate_from_text=>'Search Dialog'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1662571227778278)
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1575412815981036.1001)
,p_translate_from_id=>wwv_flow_api.id(1575412815981036)
,p_translate_column_id=>66
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'<div class="t-PopupLOV-actions t-Form--large">'
,p_translate_from_text=>'<div class="t-PopupLOV-actions t-Form--large">'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1662721148778280)
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1575412815981036.1001)
,p_translate_from_id=>wwv_flow_api.id(1575412815981036)
,p_translate_column_id=>67
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'</div>'
,p_translate_from_text=>'</div>'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1662970692778288)
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1575412815981036.1001)
,p_translate_from_id=>wwv_flow_api.id(1575412815981036)
,p_translate_column_id=>70
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'<div class="t-PopupLOV-links">'
,p_translate_from_text=>'<div class="t-PopupLOV-links">'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1663121001778291)
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1575412815981036.1001)
,p_translate_from_id=>wwv_flow_api.id(1575412815981036)
,p_translate_column_id=>71
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'</div>'
,p_translate_from_text=>'</div>'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1663306599778293)
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1575412815981036.1001)
,p_translate_from_id=>wwv_flow_api.id(1575412815981036)
,p_translate_column_id=>72
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Search'
,p_translate_from_text=>'Search'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1663581727778295)
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1575412815981036.1001)
,p_translate_from_id=>wwv_flow_api.id(1575412815981036)
,p_translate_column_id=>73
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Close'
,p_translate_from_text=>'Close'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1663711311778297)
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1575412815981036.1001)
,p_translate_from_id=>wwv_flow_api.id(1575412815981036)
,p_translate_column_id=>74
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Next &gt;'
,p_translate_from_text=>'Next &gt;'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1663955653778300)
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1575412815981036.1001)
,p_translate_from_id=>wwv_flow_api.id(1575412815981036)
,p_translate_column_id=>75
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'&lt; Previous'
,p_translate_from_text=>'&lt; Previous'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1664112575778312)
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1599424533981103.1001)
,p_translate_from_id=>wwv_flow_api.id(1599424533981103)
,p_translate_column_id=>79
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Would you like to perform this delete action?'
,p_translate_from_text=>'Would you like to perform this delete action?'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1664271369778315)
,p_translated_flow_id=>1001
,p_translate_to_id=>100.1001
,p_translate_from_id=>100
,p_translate_column_id=>80
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'My Demo App'
,p_translate_from_text=>'My Demo App'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1664413261778366)
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1475936720980934.1001)
,p_translate_from_id=>wwv_flow_api.id(1475936720980934)
,p_translate_column_id=>100
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Home'
,p_translate_from_text=>'Home'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1664641884778373)
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1602006364981127.1001)
,p_translate_from_id=>wwv_flow_api.id(1602006364981127)
,p_translate_column_id=>103
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Remember username'
,p_translate_from_text=>'Remember username'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1664871112778373)
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1648872478114197.1001)
,p_translate_from_id=>wwv_flow_api.id(1648872478114197)
,p_translate_column_id=>103
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Hrvatski'
,p_translate_from_text=>'Hrvatski'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1665068928778373)
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1649210489114198.1001)
,p_translate_from_id=>wwv_flow_api.id(1649210489114198)
,p_translate_column_id=>103
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Deutsch'
,p_translate_from_text=>'Deutsch'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1665278258778373)
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1649631325114198.1001)
,p_translate_from_id=>wwv_flow_api.id(1649631325114198)
,p_translate_column_id=>103
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'English'
,p_translate_from_text=>'English'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1665425967778373)
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1650083753114198.1001)
,p_translate_from_id=>wwv_flow_api.id(1650083753114198)
,p_translate_column_id=>103
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>unistr('Fran\00E7ais')
,p_translate_from_text=>unistr('Fran\00E7ais')
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1665641410778390)
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1602416749981127.1001)
,p_translate_from_id=>wwv_flow_api.id(1602416749981127)
,p_translate_column_id=>111
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'If you select this checkbox, the application will save your username in a persistent browser cookie named "LOGIN_USERNAME_COOKIE".',
'When you go to the login page the next time,',
'the username field will be automatically populated with this value.',
'</p>',
'<p>',
'If you deselect this checkbox and your username is already saved in the cookie,',
'the application will overwrite it with an empty value.',
'You can also use your browser''s developer tools to completely remove the cookie.',
'</p>'))
,p_translate_from_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'If you select this checkbox, the application will save your username in a persistent browser cookie named "LOGIN_USERNAME_COOKIE".',
'When you go to the login page the next time,',
'the username field will be automatically populated with this value.',
'</p>',
'<p>',
'If you deselect this checkbox and your username is already saved in the cookie,',
'the application will overwrite it with an empty value.',
'You can also use your browser''s developer tools to completely remove the cookie.',
'</p>'))
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1665875253778392)
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1575412815981036.1001)
,p_translate_from_id=>wwv_flow_api.id(1575412815981036)
,p_translate_column_id=>112
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'<div class="t-PopupLOV-pagination">Row(s) #FIRST_ROW# - #LAST_ROW#</div>'
,p_translate_from_text=>'<div class="t-PopupLOV-pagination">Row(s) #FIRST_ROW# - #LAST_ROW#</div>'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1666096638778678)
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1599029038981101.1001)
,p_translate_from_id=>wwv_flow_api.id(1599029038981101)
,p_translate_column_id=>257
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Insufficient privileges, user is not an Administrator'
,p_translate_from_text=>'Insufficient privileges, user is not an Administrator'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1666116106778702)
,p_page_id=>1
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1641504035083306.1001)
,p_translate_from_id=>wwv_flow_api.id(1641504035083306)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'SUBMIT'
,p_translate_from_text=>'SUBMIT'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1666303362778703)
,p_page_id=>3
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1641043859083301.1001)
,p_translate_from_id=>wwv_flow_api.id(1641043859083301)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1666535569778703)
,p_page_id=>3
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1641136182083302.1001)
,p_translate_from_id=>wwv_flow_api.id(1641136182083302)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1666720532778703)
,p_page_id=>3
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1641257616083303.1001)
,p_translate_from_id=>wwv_flow_api.id(1641257616083303)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1666953589778703)
,p_page_id=>9999
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1600900224981124.1001)
,p_translate_from_id=>wwv_flow_api.id(1600900224981124)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1667154469778703)
,p_page_id=>9999
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1601327831981124.1001)
,p_translate_from_id=>wwv_flow_api.id(1601327831981124)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1667358773778703)
,p_page_id=>9999
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1602416749981127.1001)
,p_translate_from_id=>wwv_flow_api.id(1602416749981127)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'1'
,p_translate_from_text=>'1'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1667536046778705)
,p_page_id=>3
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1641043859083301.1001)
,p_translate_from_id=>wwv_flow_api.id(1641043859083301)
,p_translate_column_id=>269
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1667794735778706)
,p_page_id=>3
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1641136182083302.1001)
,p_translate_from_id=>wwv_flow_api.id(1641136182083302)
,p_translate_column_id=>269
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1667902979778706)
,p_page_id=>3
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1641257616083303.1001)
,p_translate_from_id=>wwv_flow_api.id(1641257616083303)
,p_translate_column_id=>269
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1668147633778706)
,p_page_id=>9999
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1600900224981124.1001)
,p_translate_from_id=>wwv_flow_api.id(1600900224981124)
,p_translate_column_id=>269
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
end;
/
begin
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1668358361778706)
,p_page_id=>9999
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1601327831981124.1001)
,p_translate_from_id=>wwv_flow_api.id(1601327831981124)
,p_translate_column_id=>269
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1668534789778709)
,p_page_id=>1
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1641504035083306.1001)
,p_translate_from_id=>wwv_flow_api.id(1641504035083306)
,p_translate_column_id=>270
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1668747237778709)
,p_page_id=>9999
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1600900224981124.1001)
,p_translate_from_id=>wwv_flow_api.id(1600900224981124)
,p_translate_column_id=>270
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1668988783778711)
,p_page_id=>3
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1641043859083301.1001)
,p_translate_from_id=>wwv_flow_api.id(1641043859083301)
,p_translate_column_id=>271
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'TEXT'
,p_translate_from_text=>'TEXT'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1669112828778711)
,p_page_id=>3
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1641136182083302.1001)
,p_translate_from_id=>wwv_flow_api.id(1641136182083302)
,p_translate_column_id=>271
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'TEXT'
,p_translate_from_text=>'TEXT'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1669340367778711)
,p_page_id=>3
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1641257616083303.1001)
,p_translate_from_id=>wwv_flow_api.id(1641257616083303)
,p_translate_column_id=>271
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'TEXT'
,p_translate_from_text=>'TEXT'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1669511597778711)
,p_page_id=>9999
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1600900224981124.1001)
,p_translate_from_id=>wwv_flow_api.id(1600900224981124)
,p_translate_column_id=>271
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'TEXT'
,p_translate_from_text=>'TEXT'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1669747417778714)
,p_page_id=>3
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1641043859083301.1001)
,p_translate_from_id=>wwv_flow_api.id(1641043859083301)
,p_translate_column_id=>272
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'BOTH'
,p_translate_from_text=>'BOTH'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1669873299778714)
,p_page_id=>3
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1641136182083302.1001)
,p_translate_from_id=>wwv_flow_api.id(1641136182083302)
,p_translate_column_id=>272
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'BOTH'
,p_translate_from_text=>'BOTH'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1670005213778714)
,p_page_id=>3
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1641257616083303.1001)
,p_translate_from_id=>wwv_flow_api.id(1641257616083303)
,p_translate_column_id=>272
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'BOTH'
,p_translate_from_text=>'BOTH'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1670217844778714)
,p_page_id=>9999
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1600900224981124.1001)
,p_translate_from_id=>wwv_flow_api.id(1600900224981124)
,p_translate_column_id=>272
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'NONE'
,p_translate_from_text=>'NONE'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1670448388778727)
,p_page_id=>9999
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1604959651981132.1001)
,p_translate_from_id=>wwv_flow_api.id(1604959651981132)
,p_translate_column_id=>278
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'CLEAR_CACHE_CURRENT_PAGE'
,p_translate_from_text=>'CLEAR_CACHE_CURRENT_PAGE'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1670676606778770)
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1473369218980928.1001)
,p_translate_from_id=>wwv_flow_api.id(1473369218980928)
,p_translate_column_id=>298
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'modern'
,p_translate_from_text=>'modern'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1670863958778770)
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1473692150980929.1001)
,p_translate_from_id=>wwv_flow_api.id(1473692150980929)
,p_translate_column_id=>298
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1671080906778770)
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1473967094980930.1001)
,p_translate_from_id=>wwv_flow_api.id(1473967094980930)
,p_translate_column_id=>298
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1671207284778770)
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1474544511980930.1001)
,p_translate_from_id=>wwv_flow_api.id(1474544511980930)
,p_translate_column_id=>298
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1671439981778770)
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1475196115980930.1001)
,p_translate_from_id=>wwv_flow_api.id(1475196115980930)
,p_translate_column_id=>298
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'IG'
,p_translate_from_text=>'IG'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1671635235778775)
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1473967094980930.1001)
,p_translate_from_id=>wwv_flow_api.id(1473967094980930)
,p_translate_column_id=>300
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1671873703778780)
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1473967094980930.1001)
,p_translate_from_id=>wwv_flow_api.id(1473967094980930)
,p_translate_column_id=>302
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'SWITCH'
,p_translate_from_text=>'SWITCH'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1672096404778796)
,p_page_id=>1
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1625329803016601.1001)
,p_translate_from_id=>wwv_flow_api.id(1625329803016601)
,p_translate_column_id=>308
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1672243585778796)
,p_page_id=>9999
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1600554547981121.1001)
,p_translate_from_id=>wwv_flow_api.id(1600554547981121)
,p_translate_column_id=>308
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1672445842778799)
,p_page_id=>1
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1625329803016601.1001)
,p_translate_from_id=>wwv_flow_api.id(1625329803016601)
,p_translate_column_id=>309
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'HTML'
,p_translate_from_text=>'HTML'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1672610706778799)
,p_page_id=>9999
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1600554547981121.1001)
,p_translate_from_id=>wwv_flow_api.id(1600554547981121)
,p_translate_column_id=>309
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'TEXT'
,p_translate_from_text=>'TEXT'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1672830265778802)
,p_page_id=>9999
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1600554547981121.1001)
,p_translate_from_id=>wwv_flow_api.id(1600554547981121)
,p_translate_column_id=>310
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1673051938778875)
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1599029038981101.1001)
,p_translate_from_id=>wwv_flow_api.id(1599029038981101)
,p_translate_column_id=>343
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'return true;'
,p_translate_from_text=>'return true;'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1673133728778954)
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1608062339981151.1001)
,p_translate_from_id=>wwv_flow_api.id(1608062339981151)
,p_translate_column_id=>377
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'has-username'
,p_translate_from_text=>'has-username'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1673222651778995)
,p_page_id=>9999
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1600900224981124.1001)
,p_translate_from_id=>wwv_flow_api.id(1600900224981124)
,p_translate_column_id=>396
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'username'
,p_translate_from_text=>'username'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1673469410778995)
,p_page_id=>9999
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1601327831981124.1001)
,p_translate_from_id=>wwv_flow_api.id(1601327831981124)
,p_translate_column_id=>396
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'password'
,p_translate_from_text=>'password'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1673694029778998)
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1596365551981065.1001)
,p_translate_from_id=>wwv_flow_api.id(1596365551981065)
,p_translate_column_id=>397
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Desktop'
,p_translate_from_text=>'Desktop'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1673814818779042)
,p_page_id=>2
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1612714061995790.1001)
,p_translate_from_id=>wwv_flow_api.id(1612714061995790)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Employee ID'
,p_translate_from_text=>'Employee ID'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1673900078779042)
,p_page_id=>2
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1613353149995792.1001)
,p_translate_from_id=>wwv_flow_api.id(1613353149995792)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'First Name'
,p_translate_from_text=>'First Name'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1674139689779042)
,p_page_id=>2
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1613949719995792.1001)
,p_translate_from_id=>wwv_flow_api.id(1613949719995792)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Last Name'
,p_translate_from_text=>'Last Name'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1674343636779043)
,p_page_id=>2
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1614572293995793.1001)
,p_translate_from_id=>wwv_flow_api.id(1614572293995793)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'E-mail'
,p_translate_from_text=>'E-mail'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1674524135779043)
,p_page_id=>2
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1615162268995794.1001)
,p_translate_from_id=>wwv_flow_api.id(1615162268995794)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Phone Number'
,p_translate_from_text=>'Phone Number'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1674745353779043)
,p_page_id=>2
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1615744592995795.1001)
,p_translate_from_id=>wwv_flow_api.id(1615744592995795)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Hire Date'
,p_translate_from_text=>'Hire Date'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1674915138779043)
,p_page_id=>2
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1616358871995796.1001)
,p_translate_from_id=>wwv_flow_api.id(1616358871995796)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Job'
,p_translate_from_text=>'Job'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1675124395779043)
,p_page_id=>2
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1616960401995796.1001)
,p_translate_from_id=>wwv_flow_api.id(1616960401995796)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Salary'
,p_translate_from_text=>'Salary'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1675369799779043)
,p_page_id=>2
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1617565030995797.1001)
,p_translate_from_id=>wwv_flow_api.id(1617565030995797)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Commission Pct.'
,p_translate_from_text=>'Commission Pct.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1675596773779043)
,p_page_id=>2
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1618147416995797.1001)
,p_translate_from_id=>wwv_flow_api.id(1618147416995797)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Manager'
,p_translate_from_text=>'Manager'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1675790818779043)
,p_page_id=>2
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1618761327995798.1001)
,p_translate_from_id=>wwv_flow_api.id(1618761327995798)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Department'
,p_translate_from_text=>'Department'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1675989667779044)
,p_page_id=>3
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1621718313999813.1001)
,p_translate_from_id=>wwv_flow_api.id(1621718313999813)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'ID odjela'
,p_translate_from_text=>'Department ID'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1676163494779044)
,p_page_id=>3
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1622366115999813.1001)
,p_translate_from_id=>wwv_flow_api.id(1622366115999813)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Naziv odjela'
,p_translate_from_text=>'Department Name'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1676332318779044)
,p_page_id=>3
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1622919268999814.1001)
,p_translate_from_id=>wwv_flow_api.id(1622919268999814)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Voditelj'
,p_translate_from_text=>'Manager'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1676535089779044)
,p_page_id=>3
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1623519793999814.1001)
,p_translate_from_id=>wwv_flow_api.id(1623519793999814)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Lokacija'
,p_translate_from_text=>'Location'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1676776938779047)
,p_page_id=>2
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1612154531995785.1001)
,p_translate_from_id=>wwv_flow_api.id(1612154531995785)
,p_translate_column_id=>422
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1676903741779047)
,p_page_id=>2
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1613353149995792.1001)
,p_translate_from_id=>wwv_flow_api.id(1613353149995792)
,p_translate_column_id=>422
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1677158434779047)
,p_page_id=>2
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1613949719995792.1001)
,p_translate_from_id=>wwv_flow_api.id(1613949719995792)
,p_translate_column_id=>422
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1677336405779047)
,p_page_id=>2
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1615162268995794.1001)
,p_translate_from_id=>wwv_flow_api.id(1615162268995794)
,p_translate_column_id=>422
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1677534520779047)
,p_page_id=>3
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1621144687999812.1001)
,p_translate_from_id=>wwv_flow_api.id(1621144687999812)
,p_translate_column_id=>422
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1677755013779047)
,p_page_id=>3
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1622366115999813.1001)
,p_translate_from_id=>wwv_flow_api.id(1622366115999813)
,p_translate_column_id=>422
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1677963652779050)
,p_page_id=>2
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1613353149995792.1001)
,p_translate_from_id=>wwv_flow_api.id(1613353149995792)
,p_translate_column_id=>423
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1678127630779050)
,p_page_id=>2
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1613949719995792.1001)
,p_translate_from_id=>wwv_flow_api.id(1613949719995792)
,p_translate_column_id=>423
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1678322481779050)
,p_page_id=>2
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1615162268995794.1001)
,p_translate_from_id=>wwv_flow_api.id(1615162268995794)
,p_translate_column_id=>423
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1678560309779050)
,p_page_id=>3
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1622366115999813.1001)
,p_translate_from_id=>wwv_flow_api.id(1622366115999813)
,p_translate_column_id=>423
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1678714059779053)
,p_page_id=>2
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1612714061995790.1001)
,p_translate_from_id=>wwv_flow_api.id(1612714061995790)
,p_translate_column_id=>424
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'right'
,p_translate_from_text=>'right'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1678974129779053)
,p_page_id=>2
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1613353149995792.1001)
,p_translate_from_id=>wwv_flow_api.id(1613353149995792)
,p_translate_column_id=>424
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1679142729779053)
,p_page_id=>2
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1613949719995792.1001)
,p_translate_from_id=>wwv_flow_api.id(1613949719995792)
,p_translate_column_id=>424
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1679317946779053)
,p_page_id=>2
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1615162268995794.1001)
,p_translate_from_id=>wwv_flow_api.id(1615162268995794)
,p_translate_column_id=>424
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1679579798779053)
,p_page_id=>2
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1616960401995796.1001)
,p_translate_from_id=>wwv_flow_api.id(1616960401995796)
,p_translate_column_id=>424
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'right'
,p_translate_from_text=>'right'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1679773998779053)
,p_page_id=>2
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1617565030995797.1001)
,p_translate_from_id=>wwv_flow_api.id(1617565030995797)
,p_translate_column_id=>424
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'right'
,p_translate_from_text=>'right'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1679934282779054)
,p_page_id=>3
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1621718313999813.1001)
,p_translate_from_id=>wwv_flow_api.id(1621718313999813)
,p_translate_column_id=>424
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'right'
,p_translate_from_text=>'right'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1680172615779054)
,p_page_id=>3
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1622366115999813.1001)
,p_translate_from_id=>wwv_flow_api.id(1622366115999813)
,p_translate_column_id=>424
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1680354433779056)
,p_page_id=>2
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1613353149995792.1001)
,p_translate_from_id=>wwv_flow_api.id(1613353149995792)
,p_translate_column_id=>425
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'TEXT'
,p_translate_from_text=>'TEXT'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1680536689779056)
,p_page_id=>2
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1613949719995792.1001)
,p_translate_from_id=>wwv_flow_api.id(1613949719995792)
,p_translate_column_id=>425
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'TEXT'
,p_translate_from_text=>'TEXT'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1680711853779056)
,p_page_id=>2
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1615162268995794.1001)
,p_translate_from_id=>wwv_flow_api.id(1615162268995794)
,p_translate_column_id=>425
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'TEXT'
,p_translate_from_text=>'TEXT'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1680979038779056)
,p_page_id=>2
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1615744592995795.1001)
,p_translate_from_id=>wwv_flow_api.id(1615744592995795)
,p_translate_column_id=>425
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'button'
,p_translate_from_text=>'button'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1681108083779057)
,p_page_id=>3
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1622366115999813.1001)
,p_translate_from_id=>wwv_flow_api.id(1622366115999813)
,p_translate_column_id=>425
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'TEXT'
,p_translate_from_text=>'TEXT'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1681390797779059)
,p_page_id=>2
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1613353149995792.1001)
,p_translate_from_id=>wwv_flow_api.id(1613353149995792)
,p_translate_column_id=>426
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'BOTH'
,p_translate_from_text=>'BOTH'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1681536913779059)
,p_page_id=>2
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1613949719995792.1001)
,p_translate_from_id=>wwv_flow_api.id(1613949719995792)
,p_translate_column_id=>426
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'BOTH'
,p_translate_from_text=>'BOTH'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1681743742779059)
,p_page_id=>2
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1614572293995793.1001)
,p_translate_from_id=>wwv_flow_api.id(1614572293995793)
,p_translate_column_id=>426
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'BOTH'
,p_translate_from_text=>'BOTH'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1681905606779060)
,p_page_id=>2
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1615162268995794.1001)
,p_translate_from_id=>wwv_flow_api.id(1615162268995794)
,p_translate_column_id=>426
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'BOTH'
,p_translate_from_text=>'BOTH'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1682149779779060)
,p_page_id=>2
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1615744592995795.1001)
,p_translate_from_id=>wwv_flow_api.id(1615744592995795)
,p_translate_column_id=>426
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1682336943779060)
,p_page_id=>3
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1622366115999813.1001)
,p_translate_from_id=>wwv_flow_api.id(1622366115999813)
,p_translate_column_id=>426
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'BOTH'
,p_translate_from_text=>'BOTH'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1682549262779065)
,p_page_id=>2
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1615744592995795.1001)
,p_translate_from_id=>wwv_flow_api.id(1615744592995795)
,p_translate_column_id=>428
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'NONE'
,p_translate_from_text=>'NONE'
);
end;
/
begin
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1682798586779183)
,p_page_id=>1
,p_translated_flow_id=>1003
,p_translate_to_id=>1.1003
,p_translate_from_id=>1
,p_translate_column_id=>5
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Home'
,p_translate_from_text=>'Home'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1682892816779183)
,p_page_id=>9999
,p_translated_flow_id=>1003
,p_translate_to_id=>9999.1003
,p_translate_from_id=>9999
,p_translate_column_id=>5
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Login Page'
,p_translate_from_text=>'Login Page'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1683063413779184)
,p_page_id=>0
,p_translated_flow_id=>1003
,p_translate_to_id=>.1003
,p_translate_from_id=>0
,p_translate_column_id=>5
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Global Page - Desktop'
,p_translate_from_text=>'Global Page - Desktop'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1683228170779184)
,p_page_id=>3
,p_translated_flow_id=>1003
,p_translate_to_id=>3.1003
,p_translate_from_id=>3
,p_translate_column_id=>5
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Departments'
,p_translate_from_text=>'Departments'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1683461199779184)
,p_page_id=>2
,p_translated_flow_id=>1003
,p_translate_to_id=>2.1003
,p_translate_from_id=>2
,p_translate_column_id=>5
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Employees'
,p_translate_from_text=>'Employees'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1683600800779187)
,p_page_id=>1
,p_translated_flow_id=>1003
,p_translate_to_id=>1.1003
,p_translate_from_id=>1
,p_translate_column_id=>6
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'My Demo App'
,p_translate_from_text=>'My Demo App'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1683851518779187)
,p_page_id=>9999
,p_translated_flow_id=>1003
,p_translate_to_id=>9999.1003
,p_translate_from_id=>9999
,p_translate_column_id=>6
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'My Demo App - Sign In'
,p_translate_from_text=>'My Demo App - Sign In'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1684035925779187)
,p_page_id=>0
,p_translated_flow_id=>1003
,p_translate_to_id=>.1003
,p_translate_from_id=>0
,p_translate_column_id=>6
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Global Page - Desktop'
,p_translate_from_text=>'Global Page - Desktop'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1684223447779187)
,p_page_id=>3
,p_translated_flow_id=>1003
,p_translate_to_id=>3.1003
,p_translate_from_id=>3
,p_translate_column_id=>6
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Departments'
,p_translate_from_text=>'Departments'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1684411818779187)
,p_page_id=>2
,p_translated_flow_id=>1003
,p_translate_to_id=>2.1003
,p_translate_from_id=>2
,p_translate_column_id=>6
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Employees'
,p_translate_from_text=>'Employees'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1684699396779202)
,p_page_id=>2
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1641412958083305.1003)
,p_translate_from_id=>wwv_flow_api.id(1641412958083305)
,p_translate_column_id=>13
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Add Employee'
,p_translate_from_text=>'Add Employee'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1684814705779202)
,p_page_id=>3
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1641301676083304.1003)
,p_translate_from_id=>wwv_flow_api.id(1641301676083304)
,p_translate_column_id=>13
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Add Department'
,p_translate_from_text=>'Add Department'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1685077843779203)
,p_page_id=>9999
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1603366456981130.1003)
,p_translate_from_id=>wwv_flow_api.id(1603366456981130)
,p_translate_column_id=>13
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Sign In'
,p_translate_from_text=>'Sign In'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1685280023779205)
,p_page_id=>1
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1641504035083306.1003)
,p_translate_from_id=>wwv_flow_api.id(1641504035083306)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'App Language'
,p_translate_from_text=>'App Language'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1685407505779205)
,p_page_id=>3
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1641043859083301.1003)
,p_translate_from_id=>wwv_flow_api.id(1641043859083301)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Department Name'
,p_translate_from_text=>'Department Name'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1685632155779205)
,p_page_id=>3
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1641136182083302.1003)
,p_translate_from_id=>wwv_flow_api.id(1641136182083302)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Manager'
,p_translate_from_text=>'Manager'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1685801138779205)
,p_page_id=>3
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1641257616083303.1003)
,p_translate_from_id=>wwv_flow_api.id(1641257616083303)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Location'
,p_translate_from_text=>'Location'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1686002040779205)
,p_page_id=>9999
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1600900224981124.1003)
,p_translate_from_id=>wwv_flow_api.id(1600900224981124)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'username'
,p_translate_from_text=>'username'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1686271055779205)
,p_page_id=>9999
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1601327831981124.1003)
,p_translate_from_id=>wwv_flow_api.id(1601327831981124)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'password'
,p_translate_from_text=>'password'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1686467320779206)
,p_page_id=>9999
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1602416749981127.1003)
,p_translate_from_id=>wwv_flow_api.id(1602416749981127)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Remember username'
,p_translate_from_text=>'Remember username'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1686610159779217)
,p_page_id=>1
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1625329803016601.1003)
,p_translate_from_id=>wwv_flow_api.id(1625329803016601)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'About'
,p_translate_from_text=>'About'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1686768369779217)
,p_page_id=>1
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1641790804083308.1003)
,p_translate_from_id=>wwv_flow_api.id(1641790804083308)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'Lang display'
,p_translate_from_text=>'Lang display'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1686907139779218)
,p_page_id=>2
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1610924665995774.1003)
,p_translate_from_id=>wwv_flow_api.id(1610924665995774)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'Employees'
,p_translate_from_text=>'Employees'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1687119645779218)
,p_page_id=>3
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1619932187999811.1003)
,p_translate_from_id=>wwv_flow_api.id(1619932187999811)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'Departments'
,p_translate_from_text=>'Departments'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1687399531779218)
,p_page_id=>9999
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1600554547981121.1003)
,p_translate_from_id=>wwv_flow_api.id(1600554547981121)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'My Demo App'
,p_translate_from_text=>'My Demo App'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1687542742779218)
,p_page_id=>9999
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1605216128981133.1003)
,p_translate_from_id=>wwv_flow_api.id(1605216128981133)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'Language Selector'
,p_translate_from_text=>'Language Selector'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1687739743779221)
,p_page_id=>1
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1625329803016601.1003)
,p_translate_from_id=>wwv_flow_api.id(1625329803016601)
,p_translate_column_id=>21
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This is a Demo App for HrOUG 2018.',
'<br />',
'<br />'))
,p_translate_from_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This is a Demo App for HrOUG 2018.',
'<br />',
'<br />'))
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1687961953779221)
,p_page_id=>1
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1641790804083308.1003)
,p_translate_from_id=>wwv_flow_api.id(1641790804083308)
,p_translate_column_id=>21
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'htp.p(''App language is set to: <b>''||nvl(APEX_UTIL.GET_SESSION_LANG, ''en'')||''</b>'');'
,p_translate_from_text=>'htp.p(''App language is set to: <b>''||nvl(APEX_UTIL.GET_SESSION_LANG, ''en'')||''</b>'');'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1688116716779221)
,p_page_id=>2
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1610924665995774.1003)
,p_translate_from_id=>wwv_flow_api.id(1610924665995774)
,p_translate_column_id=>21
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select EMPLOYEE_ID,',
'       FIRST_NAME,',
'       LAST_NAME,',
'       EMAIL,',
'       PHONE_NUMBER,',
'       HIRE_DATE,',
'       JOB_ID,',
'       SALARY,',
'       COMMISSION_PCT,',
'       MANAGER_ID,',
'       DEPARTMENT_ID',
'  from EMPLOYEES'))
,p_translate_from_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select EMPLOYEE_ID,',
'       FIRST_NAME,',
'       LAST_NAME,',
'       EMAIL,',
'       PHONE_NUMBER,',
'       HIRE_DATE,',
'       JOB_ID,',
'       SALARY,',
'       COMMISSION_PCT,',
'       MANAGER_ID,',
'       DEPARTMENT_ID',
'  from EMPLOYEES'))
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1688397871779221)
,p_page_id=>3
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1619932187999811.1003)
,p_translate_from_id=>wwv_flow_api.id(1619932187999811)
,p_translate_column_id=>21
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DEPARTMENT_ID,',
'       DEPARTMENT_NAME,',
'       MANAGER_ID,',
'       LOCATION_ID',
'  from DEPARTMENTS'))
,p_translate_from_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DEPARTMENT_ID,',
'       DEPARTMENT_NAME,',
'       MANAGER_ID,',
'       LOCATION_ID',
'  from DEPARTMENTS'))
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1688598008779221)
,p_page_id=>9999
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1605216128981133.1003)
,p_translate_from_id=>wwv_flow_api.id(1605216128981133)
,p_translate_column_id=>21
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'apex_lang.emit_language_selector_list;'
,p_translate_from_text=>'apex_lang.emit_language_selector_list;'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1688717991779235)
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1606485989981138.1003)
,p_translate_from_id=>wwv_flow_api.id(1606485989981138)
,p_translate_column_id=>28
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Home'
,p_translate_from_text=>'Home'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1688995591779235)
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1610593773995748.1003)
,p_translate_from_id=>wwv_flow_api.id(1610593773995748)
,p_translate_column_id=>28
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Employees'
,p_translate_from_text=>'Employees'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1689132080779236)
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1619542523999810.1003)
,p_translate_from_id=>wwv_flow_api.id(1619542523999810)
,p_translate_column_id=>28
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Departments'
,p_translate_from_text=>'Departments'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1689333890779236)
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1608062339981151.1003)
,p_translate_from_id=>wwv_flow_api.id(1608062339981151)
,p_translate_column_id=>28
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'&APP_USER.'
,p_translate_from_text=>'&APP_USER.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1689516729779236)
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1608573375981151.1003)
,p_translate_from_id=>wwv_flow_api.id(1608573375981151)
,p_translate_column_id=>28
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'---'
,p_translate_from_text=>'---'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1689720045779236)
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1608946801981152.1003)
,p_translate_from_id=>wwv_flow_api.id(1608946801981152)
,p_translate_column_id=>28
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Sign Out'
,p_translate_from_text=>'Sign Out'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1689972762779315)
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1575412815981036.1003)
,p_translate_from_id=>wwv_flow_api.id(1575412815981036)
,p_translate_column_id=>63
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Search Dialog'
,p_translate_from_text=>'Search Dialog'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1690071867779321)
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1575412815981036.1003)
,p_translate_from_id=>wwv_flow_api.id(1575412815981036)
,p_translate_column_id=>66
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'<div class="t-PopupLOV-actions t-Form--large">'
,p_translate_from_text=>'<div class="t-PopupLOV-actions t-Form--large">'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1690235478779323)
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1575412815981036.1003)
,p_translate_from_id=>wwv_flow_api.id(1575412815981036)
,p_translate_column_id=>67
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'</div>'
,p_translate_from_text=>'</div>'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1690452387779330)
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1575412815981036.1003)
,p_translate_from_id=>wwv_flow_api.id(1575412815981036)
,p_translate_column_id=>70
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'<div class="t-PopupLOV-links">'
,p_translate_from_text=>'<div class="t-PopupLOV-links">'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1690659368779332)
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1575412815981036.1003)
,p_translate_from_id=>wwv_flow_api.id(1575412815981036)
,p_translate_column_id=>71
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'</div>'
,p_translate_from_text=>'</div>'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1690892842779335)
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1575412815981036.1003)
,p_translate_from_id=>wwv_flow_api.id(1575412815981036)
,p_translate_column_id=>72
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Search'
,p_translate_from_text=>'Search'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1691063256779337)
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1575412815981036.1003)
,p_translate_from_id=>wwv_flow_api.id(1575412815981036)
,p_translate_column_id=>73
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Close'
,p_translate_from_text=>'Close'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1691209711779340)
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1575412815981036.1003)
,p_translate_from_id=>wwv_flow_api.id(1575412815981036)
,p_translate_column_id=>74
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Next &gt;'
,p_translate_from_text=>'Next &gt;'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1691408938779343)
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1575412815981036.1003)
,p_translate_from_id=>wwv_flow_api.id(1575412815981036)
,p_translate_column_id=>75
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'&lt; Previous'
,p_translate_from_text=>'&lt; Previous'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1691639156779352)
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1599424533981103.1003)
,p_translate_from_id=>wwv_flow_api.id(1599424533981103)
,p_translate_column_id=>79
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Would you like to perform this delete action?'
,p_translate_from_text=>'Would you like to perform this delete action?'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1691897788779355)
,p_translated_flow_id=>1003
,p_translate_to_id=>100.1003
,p_translate_from_id=>100
,p_translate_column_id=>80
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'My Demo App'
,p_translate_from_text=>'My Demo App'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1692059436779399)
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1475936720980934.1003)
,p_translate_from_id=>wwv_flow_api.id(1475936720980934)
,p_translate_column_id=>100
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Home'
,p_translate_from_text=>'Home'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1692269011779407)
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1602006364981127.1003)
,p_translate_from_id=>wwv_flow_api.id(1602006364981127)
,p_translate_column_id=>103
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Remember username'
,p_translate_from_text=>'Remember username'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1692444694779407)
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1648872478114197.1003)
,p_translate_from_id=>wwv_flow_api.id(1648872478114197)
,p_translate_column_id=>103
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Hrvatski'
,p_translate_from_text=>'Hrvatski'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1692695731779407)
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1649210489114198.1003)
,p_translate_from_id=>wwv_flow_api.id(1649210489114198)
,p_translate_column_id=>103
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Deutsch'
,p_translate_from_text=>'Deutsch'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1692863163779407)
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1649631325114198.1003)
,p_translate_from_id=>wwv_flow_api.id(1649631325114198)
,p_translate_column_id=>103
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'English'
,p_translate_from_text=>'English'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1693091342779407)
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1650083753114198.1003)
,p_translate_from_id=>wwv_flow_api.id(1650083753114198)
,p_translate_column_id=>103
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>unistr('Fran\00E7ais')
,p_translate_from_text=>unistr('Fran\00E7ais')
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1693235781779428)
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1602416749981127.1003)
,p_translate_from_id=>wwv_flow_api.id(1602416749981127)
,p_translate_column_id=>111
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'If you select this checkbox, the application will save your username in a persistent browser cookie named "LOGIN_USERNAME_COOKIE".',
'When you go to the login page the next time,',
'the username field will be automatically populated with this value.',
'</p>',
'<p>',
'If you deselect this checkbox and your username is already saved in the cookie,',
'the application will overwrite it with an empty value.',
'You can also use your browser''s developer tools to completely remove the cookie.',
'</p>'))
,p_translate_from_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'If you select this checkbox, the application will save your username in a persistent browser cookie named "LOGIN_USERNAME_COOKIE".',
'When you go to the login page the next time,',
'the username field will be automatically populated with this value.',
'</p>',
'<p>',
'If you deselect this checkbox and your username is already saved in the cookie,',
'the application will overwrite it with an empty value.',
'You can also use your browser''s developer tools to completely remove the cookie.',
'</p>'))
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1693347698779430)
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1575412815981036.1003)
,p_translate_from_id=>wwv_flow_api.id(1575412815981036)
,p_translate_column_id=>112
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'<div class="t-PopupLOV-pagination">Row(s) #FIRST_ROW# - #LAST_ROW#</div>'
,p_translate_from_text=>'<div class="t-PopupLOV-pagination">Row(s) #FIRST_ROW# - #LAST_ROW#</div>'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1693503687779723)
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1599029038981101.1003)
,p_translate_from_id=>wwv_flow_api.id(1599029038981101)
,p_translate_column_id=>257
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Insufficient privileges, user is not an Administrator'
,p_translate_from_text=>'Insufficient privileges, user is not an Administrator'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1693694866779747)
,p_page_id=>1
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1641504035083306.1003)
,p_translate_from_id=>wwv_flow_api.id(1641504035083306)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'SUBMIT'
,p_translate_from_text=>'SUBMIT'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1693865210779747)
,p_page_id=>3
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1641043859083301.1003)
,p_translate_from_id=>wwv_flow_api.id(1641043859083301)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1694095164779747)
,p_page_id=>3
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1641136182083302.1003)
,p_translate_from_id=>wwv_flow_api.id(1641136182083302)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1694215285779747)
,p_page_id=>3
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1641257616083303.1003)
,p_translate_from_id=>wwv_flow_api.id(1641257616083303)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1694425930779748)
,p_page_id=>9999
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1600900224981124.1003)
,p_translate_from_id=>wwv_flow_api.id(1600900224981124)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1694617818779748)
,p_page_id=>9999
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1601327831981124.1003)
,p_translate_from_id=>wwv_flow_api.id(1601327831981124)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1694814451779748)
,p_page_id=>9999
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1602416749981127.1003)
,p_translate_from_id=>wwv_flow_api.id(1602416749981127)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'1'
,p_translate_from_text=>'1'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1695014996779751)
,p_page_id=>3
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1641043859083301.1003)
,p_translate_from_id=>wwv_flow_api.id(1641043859083301)
,p_translate_column_id=>269
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1695223248779751)
,p_page_id=>3
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1641136182083302.1003)
,p_translate_from_id=>wwv_flow_api.id(1641136182083302)
,p_translate_column_id=>269
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1695436014779751)
,p_page_id=>3
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1641257616083303.1003)
,p_translate_from_id=>wwv_flow_api.id(1641257616083303)
,p_translate_column_id=>269
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1695628617779751)
,p_page_id=>9999
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1600900224981124.1003)
,p_translate_from_id=>wwv_flow_api.id(1600900224981124)
,p_translate_column_id=>269
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1695880298779751)
,p_page_id=>9999
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1601327831981124.1003)
,p_translate_from_id=>wwv_flow_api.id(1601327831981124)
,p_translate_column_id=>269
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
end;
/
begin
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1696069437779754)
,p_page_id=>1
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1641504035083306.1003)
,p_translate_from_id=>wwv_flow_api.id(1641504035083306)
,p_translate_column_id=>270
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1696223660779754)
,p_page_id=>9999
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1600900224981124.1003)
,p_translate_from_id=>wwv_flow_api.id(1600900224981124)
,p_translate_column_id=>270
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1696425842779756)
,p_page_id=>3
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1641043859083301.1003)
,p_translate_from_id=>wwv_flow_api.id(1641043859083301)
,p_translate_column_id=>271
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'TEXT'
,p_translate_from_text=>'TEXT'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1696686518779757)
,p_page_id=>3
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1641136182083302.1003)
,p_translate_from_id=>wwv_flow_api.id(1641136182083302)
,p_translate_column_id=>271
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'TEXT'
,p_translate_from_text=>'TEXT'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1696887438779757)
,p_page_id=>3
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1641257616083303.1003)
,p_translate_from_id=>wwv_flow_api.id(1641257616083303)
,p_translate_column_id=>271
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'TEXT'
,p_translate_from_text=>'TEXT'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1697008110779757)
,p_page_id=>9999
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1600900224981124.1003)
,p_translate_from_id=>wwv_flow_api.id(1600900224981124)
,p_translate_column_id=>271
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'TEXT'
,p_translate_from_text=>'TEXT'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1697229997779759)
,p_page_id=>3
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1641043859083301.1003)
,p_translate_from_id=>wwv_flow_api.id(1641043859083301)
,p_translate_column_id=>272
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'BOTH'
,p_translate_from_text=>'BOTH'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1697484706779759)
,p_page_id=>3
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1641136182083302.1003)
,p_translate_from_id=>wwv_flow_api.id(1641136182083302)
,p_translate_column_id=>272
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'BOTH'
,p_translate_from_text=>'BOTH'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1697671024779759)
,p_page_id=>3
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1641257616083303.1003)
,p_translate_from_id=>wwv_flow_api.id(1641257616083303)
,p_translate_column_id=>272
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'BOTH'
,p_translate_from_text=>'BOTH'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1697829002779760)
,p_page_id=>9999
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1600900224981124.1003)
,p_translate_from_id=>wwv_flow_api.id(1600900224981124)
,p_translate_column_id=>272
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'NONE'
,p_translate_from_text=>'NONE'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1698087512779773)
,p_page_id=>9999
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1604959651981132.1003)
,p_translate_from_id=>wwv_flow_api.id(1604959651981132)
,p_translate_column_id=>278
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'CLEAR_CACHE_CURRENT_PAGE'
,p_translate_from_text=>'CLEAR_CACHE_CURRENT_PAGE'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1698278155779817)
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1473369218980928.1003)
,p_translate_from_id=>wwv_flow_api.id(1473369218980928)
,p_translate_column_id=>298
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'modern'
,p_translate_from_text=>'modern'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1698303859779817)
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1473692150980929.1003)
,p_translate_from_id=>wwv_flow_api.id(1473692150980929)
,p_translate_column_id=>298
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1698577590779817)
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1473967094980930.1003)
,p_translate_from_id=>wwv_flow_api.id(1473967094980930)
,p_translate_column_id=>298
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1698781765779818)
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1474544511980930.1003)
,p_translate_from_id=>wwv_flow_api.id(1474544511980930)
,p_translate_column_id=>298
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1698949982779818)
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1475196115980930.1003)
,p_translate_from_id=>wwv_flow_api.id(1475196115980930)
,p_translate_column_id=>298
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'IG'
,p_translate_from_text=>'IG'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1699146591779823)
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1473967094980930.1003)
,p_translate_from_id=>wwv_flow_api.id(1473967094980930)
,p_translate_column_id=>300
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1699361010779828)
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1473967094980930.1003)
,p_translate_from_id=>wwv_flow_api.id(1473967094980930)
,p_translate_column_id=>302
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'SWITCH'
,p_translate_from_text=>'SWITCH'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1699526510779841)
,p_page_id=>1
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1625329803016601.1003)
,p_translate_from_id=>wwv_flow_api.id(1625329803016601)
,p_translate_column_id=>308
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1699738812779841)
,p_page_id=>9999
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1600554547981121.1003)
,p_translate_from_id=>wwv_flow_api.id(1600554547981121)
,p_translate_column_id=>308
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1699913156779844)
,p_page_id=>1
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1625329803016601.1003)
,p_translate_from_id=>wwv_flow_api.id(1625329803016601)
,p_translate_column_id=>309
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'HTML'
,p_translate_from_text=>'HTML'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1700181539779844)
,p_page_id=>9999
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1600554547981121.1003)
,p_translate_from_id=>wwv_flow_api.id(1600554547981121)
,p_translate_column_id=>309
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'TEXT'
,p_translate_from_text=>'TEXT'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1700395356779846)
,p_page_id=>9999
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1600554547981121.1003)
,p_translate_from_id=>wwv_flow_api.id(1600554547981121)
,p_translate_column_id=>310
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1700569977779917)
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1599029038981101.1003)
,p_translate_from_id=>wwv_flow_api.id(1599029038981101)
,p_translate_column_id=>343
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'return true;'
,p_translate_from_text=>'return true;'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1700627632779993)
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1608062339981151.1003)
,p_translate_from_id=>wwv_flow_api.id(1608062339981151)
,p_translate_column_id=>377
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'has-username'
,p_translate_from_text=>'has-username'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1700887975780036)
,p_page_id=>9999
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1600900224981124.1003)
,p_translate_from_id=>wwv_flow_api.id(1600900224981124)
,p_translate_column_id=>396
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'username'
,p_translate_from_text=>'username'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1700924509780036)
,p_page_id=>9999
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1601327831981124.1003)
,p_translate_from_id=>wwv_flow_api.id(1601327831981124)
,p_translate_column_id=>396
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'password'
,p_translate_from_text=>'password'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1701160923780039)
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1596365551981065.1003)
,p_translate_from_id=>wwv_flow_api.id(1596365551981065)
,p_translate_column_id=>397
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Desktop'
,p_translate_from_text=>'Desktop'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1701358820780086)
,p_page_id=>2
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1612714061995790.1003)
,p_translate_from_id=>wwv_flow_api.id(1612714061995790)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Employee ID'
,p_translate_from_text=>'Employee ID'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1701513106780086)
,p_page_id=>2
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1613353149995792.1003)
,p_translate_from_id=>wwv_flow_api.id(1613353149995792)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'First Name'
,p_translate_from_text=>'First Name'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1701734117780086)
,p_page_id=>2
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1613949719995792.1003)
,p_translate_from_id=>wwv_flow_api.id(1613949719995792)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Last Name'
,p_translate_from_text=>'Last Name'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1701955163780086)
,p_page_id=>2
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1614572293995793.1003)
,p_translate_from_id=>wwv_flow_api.id(1614572293995793)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'E-mail'
,p_translate_from_text=>'E-mail'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1702194237780086)
,p_page_id=>2
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1615162268995794.1003)
,p_translate_from_id=>wwv_flow_api.id(1615162268995794)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Phone Number'
,p_translate_from_text=>'Phone Number'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1702302596780086)
,p_page_id=>2
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1615744592995795.1003)
,p_translate_from_id=>wwv_flow_api.id(1615744592995795)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Hire Date'
,p_translate_from_text=>'Hire Date'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1702546934780087)
,p_page_id=>2
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1616358871995796.1003)
,p_translate_from_id=>wwv_flow_api.id(1616358871995796)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Job'
,p_translate_from_text=>'Job'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1702747763780087)
,p_page_id=>2
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1616960401995796.1003)
,p_translate_from_id=>wwv_flow_api.id(1616960401995796)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Salary'
,p_translate_from_text=>'Salary'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1702927165780087)
,p_page_id=>2
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1617565030995797.1003)
,p_translate_from_id=>wwv_flow_api.id(1617565030995797)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Commission Pct.'
,p_translate_from_text=>'Commission Pct.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1703155526780087)
,p_page_id=>2
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1618147416995797.1003)
,p_translate_from_id=>wwv_flow_api.id(1618147416995797)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Manager'
,p_translate_from_text=>'Manager'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1703309252780087)
,p_page_id=>2
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1618761327995798.1003)
,p_translate_from_id=>wwv_flow_api.id(1618761327995798)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Department'
,p_translate_from_text=>'Department'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1703509611780088)
,p_page_id=>3
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1621718313999813.1003)
,p_translate_from_id=>wwv_flow_api.id(1621718313999813)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Department ID'
,p_translate_from_text=>'Department ID'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1703798364780088)
,p_page_id=>3
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1622366115999813.1003)
,p_translate_from_id=>wwv_flow_api.id(1622366115999813)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Department Name'
,p_translate_from_text=>'Department Name'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1703931882780088)
,p_page_id=>3
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1622919268999814.1003)
,p_translate_from_id=>wwv_flow_api.id(1622919268999814)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Manager'
,p_translate_from_text=>'Manager'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1704184799780088)
,p_page_id=>3
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1623519793999814.1003)
,p_translate_from_id=>wwv_flow_api.id(1623519793999814)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Location'
,p_translate_from_text=>'Location'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1704316125780091)
,p_page_id=>2
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1612154531995785.1003)
,p_translate_from_id=>wwv_flow_api.id(1612154531995785)
,p_translate_column_id=>422
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1704564610780091)
,p_page_id=>2
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1613353149995792.1003)
,p_translate_from_id=>wwv_flow_api.id(1613353149995792)
,p_translate_column_id=>422
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1704770582780092)
,p_page_id=>2
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1613949719995792.1003)
,p_translate_from_id=>wwv_flow_api.id(1613949719995792)
,p_translate_column_id=>422
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1704928961780092)
,p_page_id=>2
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1615162268995794.1003)
,p_translate_from_id=>wwv_flow_api.id(1615162268995794)
,p_translate_column_id=>422
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1705161143780092)
,p_page_id=>3
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1621144687999812.1003)
,p_translate_from_id=>wwv_flow_api.id(1621144687999812)
,p_translate_column_id=>422
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1705372117780092)
,p_page_id=>3
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1622366115999813.1003)
,p_translate_from_id=>wwv_flow_api.id(1622366115999813)
,p_translate_column_id=>422
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1705530755780095)
,p_page_id=>2
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1613353149995792.1003)
,p_translate_from_id=>wwv_flow_api.id(1613353149995792)
,p_translate_column_id=>423
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1705746817780095)
,p_page_id=>2
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1613949719995792.1003)
,p_translate_from_id=>wwv_flow_api.id(1613949719995792)
,p_translate_column_id=>423
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1705960009780095)
,p_page_id=>2
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1615162268995794.1003)
,p_translate_from_id=>wwv_flow_api.id(1615162268995794)
,p_translate_column_id=>423
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1706155577780095)
,p_page_id=>3
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1622366115999813.1003)
,p_translate_from_id=>wwv_flow_api.id(1622366115999813)
,p_translate_column_id=>423
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1706398646780098)
,p_page_id=>2
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1612714061995790.1003)
,p_translate_from_id=>wwv_flow_api.id(1612714061995790)
,p_translate_column_id=>424
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'right'
,p_translate_from_text=>'right'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1706570105780098)
,p_page_id=>2
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1613353149995792.1003)
,p_translate_from_id=>wwv_flow_api.id(1613353149995792)
,p_translate_column_id=>424
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1706766435780098)
,p_page_id=>2
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1613949719995792.1003)
,p_translate_from_id=>wwv_flow_api.id(1613949719995792)
,p_translate_column_id=>424
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1706941579780098)
,p_page_id=>2
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1615162268995794.1003)
,p_translate_from_id=>wwv_flow_api.id(1615162268995794)
,p_translate_column_id=>424
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1707113929780098)
,p_page_id=>2
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1616960401995796.1003)
,p_translate_from_id=>wwv_flow_api.id(1616960401995796)
,p_translate_column_id=>424
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'right'
,p_translate_from_text=>'right'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1707331394780098)
,p_page_id=>2
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1617565030995797.1003)
,p_translate_from_id=>wwv_flow_api.id(1617565030995797)
,p_translate_column_id=>424
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'right'
,p_translate_from_text=>'right'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1707514851780098)
,p_page_id=>3
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1621718313999813.1003)
,p_translate_from_id=>wwv_flow_api.id(1621718313999813)
,p_translate_column_id=>424
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'right'
,p_translate_from_text=>'right'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1707772357780099)
,p_page_id=>3
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1622366115999813.1003)
,p_translate_from_id=>wwv_flow_api.id(1622366115999813)
,p_translate_column_id=>424
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1707950363780101)
,p_page_id=>2
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1613353149995792.1003)
,p_translate_from_id=>wwv_flow_api.id(1613353149995792)
,p_translate_column_id=>425
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'TEXT'
,p_translate_from_text=>'TEXT'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1708103108780101)
,p_page_id=>2
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1613949719995792.1003)
,p_translate_from_id=>wwv_flow_api.id(1613949719995792)
,p_translate_column_id=>425
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'TEXT'
,p_translate_from_text=>'TEXT'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1708344425780102)
,p_page_id=>2
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1615162268995794.1003)
,p_translate_from_id=>wwv_flow_api.id(1615162268995794)
,p_translate_column_id=>425
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'TEXT'
,p_translate_from_text=>'TEXT'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1708514770780102)
,p_page_id=>2
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1615744592995795.1003)
,p_translate_from_id=>wwv_flow_api.id(1615744592995795)
,p_translate_column_id=>425
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'button'
,p_translate_from_text=>'button'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1708779253780102)
,p_page_id=>3
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1622366115999813.1003)
,p_translate_from_id=>wwv_flow_api.id(1622366115999813)
,p_translate_column_id=>425
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'TEXT'
,p_translate_from_text=>'TEXT'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1708966615780105)
,p_page_id=>2
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1613353149995792.1003)
,p_translate_from_id=>wwv_flow_api.id(1613353149995792)
,p_translate_column_id=>426
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'BOTH'
,p_translate_from_text=>'BOTH'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1709130186780105)
,p_page_id=>2
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1613949719995792.1003)
,p_translate_from_id=>wwv_flow_api.id(1613949719995792)
,p_translate_column_id=>426
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'BOTH'
,p_translate_from_text=>'BOTH'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1709341024780105)
,p_page_id=>2
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1614572293995793.1003)
,p_translate_from_id=>wwv_flow_api.id(1614572293995793)
,p_translate_column_id=>426
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'BOTH'
,p_translate_from_text=>'BOTH'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1709514232780105)
,p_page_id=>2
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1615162268995794.1003)
,p_translate_from_id=>wwv_flow_api.id(1615162268995794)
,p_translate_column_id=>426
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'BOTH'
,p_translate_from_text=>'BOTH'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1709708651780106)
,p_page_id=>2
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1615744592995795.1003)
,p_translate_from_id=>wwv_flow_api.id(1615744592995795)
,p_translate_column_id=>426
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1709971920780106)
,p_page_id=>3
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1622366115999813.1003)
,p_translate_from_id=>wwv_flow_api.id(1622366115999813)
,p_translate_column_id=>426
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'BOTH'
,p_translate_from_text=>'BOTH'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1710132973780111)
,p_page_id=>2
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1615744592995795.1003)
,p_translate_from_id=>wwv_flow_api.id(1615744592995795)
,p_translate_column_id=>428
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'NONE'
,p_translate_from_text=>'NONE'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1710355207780230)
,p_page_id=>1
,p_translated_flow_id=>1002
,p_translate_to_id=>1.1002
,p_translate_from_id=>1
,p_translate_column_id=>5
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Home'
,p_translate_from_text=>'Home'
);
end;
/
begin
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1710444278780230)
,p_page_id=>9999
,p_translated_flow_id=>1002
,p_translate_to_id=>9999.1002
,p_translate_from_id=>9999
,p_translate_column_id=>5
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Login Page'
,p_translate_from_text=>'Login Page'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1710657953780230)
,p_page_id=>0
,p_translated_flow_id=>1002
,p_translate_to_id=>.1002
,p_translate_from_id=>0
,p_translate_column_id=>5
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Global Page - Desktop'
,p_translate_from_text=>'Global Page - Desktop'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1710875486780230)
,p_page_id=>3
,p_translated_flow_id=>1002
,p_translate_to_id=>3.1002
,p_translate_from_id=>3
,p_translate_column_id=>5
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Departments'
,p_translate_from_text=>'Departments'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1711099331780230)
,p_page_id=>2
,p_translated_flow_id=>1002
,p_translate_to_id=>2.1002
,p_translate_from_id=>2
,p_translate_column_id=>5
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Employees'
,p_translate_from_text=>'Employees'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1711277541780233)
,p_page_id=>1
,p_translated_flow_id=>1002
,p_translate_to_id=>1.1002
,p_translate_from_id=>1
,p_translate_column_id=>6
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'My Demo App'
,p_translate_from_text=>'My Demo App'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1711407562780233)
,p_page_id=>9999
,p_translated_flow_id=>1002
,p_translate_to_id=>9999.1002
,p_translate_from_id=>9999
,p_translate_column_id=>6
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'My Demo App - Sign In'
,p_translate_from_text=>'My Demo App - Sign In'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1711685415780234)
,p_page_id=>0
,p_translated_flow_id=>1002
,p_translate_to_id=>.1002
,p_translate_from_id=>0
,p_translate_column_id=>6
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Global Page - Desktop'
,p_translate_from_text=>'Global Page - Desktop'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1711834828780234)
,p_page_id=>3
,p_translated_flow_id=>1002
,p_translate_to_id=>3.1002
,p_translate_from_id=>3
,p_translate_column_id=>6
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Departments'
,p_translate_from_text=>'Departments'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1712020683780234)
,p_page_id=>2
,p_translated_flow_id=>1002
,p_translate_to_id=>2.1002
,p_translate_from_id=>2
,p_translate_column_id=>6
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Employees'
,p_translate_from_text=>'Employees'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1712234916780249)
,p_page_id=>2
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1641412958083305.1002)
,p_translate_from_id=>wwv_flow_api.id(1641412958083305)
,p_translate_column_id=>13
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Add Employee'
,p_translate_from_text=>'Add Employee'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1712439964780249)
,p_page_id=>3
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1641301676083304.1002)
,p_translate_from_id=>wwv_flow_api.id(1641301676083304)
,p_translate_column_id=>13
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Add Department'
,p_translate_from_text=>'Add Department'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1712675055780249)
,p_page_id=>9999
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1603366456981130.1002)
,p_translate_from_id=>wwv_flow_api.id(1603366456981130)
,p_translate_column_id=>13
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Sign In'
,p_translate_from_text=>'Sign In'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1712884250780252)
,p_page_id=>1
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1641504035083306.1002)
,p_translate_from_id=>wwv_flow_api.id(1641504035083306)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'App Language'
,p_translate_from_text=>'App Language'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1713085666780252)
,p_page_id=>3
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1641043859083301.1002)
,p_translate_from_id=>wwv_flow_api.id(1641043859083301)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Department Name'
,p_translate_from_text=>'Department Name'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1713214361780252)
,p_page_id=>3
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1641136182083302.1002)
,p_translate_from_id=>wwv_flow_api.id(1641136182083302)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Manager'
,p_translate_from_text=>'Manager'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1713429030780252)
,p_page_id=>3
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1641257616083303.1002)
,p_translate_from_id=>wwv_flow_api.id(1641257616083303)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Location'
,p_translate_from_text=>'Location'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1713608797780252)
,p_page_id=>9999
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1600900224981124.1002)
,p_translate_from_id=>wwv_flow_api.id(1600900224981124)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'username'
,p_translate_from_text=>'username'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1713831226780253)
,p_page_id=>9999
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1601327831981124.1002)
,p_translate_from_id=>wwv_flow_api.id(1601327831981124)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'password'
,p_translate_from_text=>'password'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1714000016780253)
,p_page_id=>9999
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1602416749981127.1002)
,p_translate_from_id=>wwv_flow_api.id(1602416749981127)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Remember username'
,p_translate_from_text=>'Remember username'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1714250676780265)
,p_page_id=>1
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1625329803016601.1002)
,p_translate_from_id=>wwv_flow_api.id(1625329803016601)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'About'
,p_translate_from_text=>'About'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1714417562780265)
,p_page_id=>1
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1641790804083308.1002)
,p_translate_from_id=>wwv_flow_api.id(1641790804083308)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'Lang display'
,p_translate_from_text=>'Lang display'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1714671116780265)
,p_page_id=>2
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1610924665995774.1002)
,p_translate_from_id=>wwv_flow_api.id(1610924665995774)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'Employees'
,p_translate_from_text=>'Employees'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1714896121780265)
,p_page_id=>3
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1619932187999811.1002)
,p_translate_from_id=>wwv_flow_api.id(1619932187999811)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'Departments'
,p_translate_from_text=>'Departments'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1715085838780266)
,p_page_id=>9999
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1600554547981121.1002)
,p_translate_from_id=>wwv_flow_api.id(1600554547981121)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'My Demo App'
,p_translate_from_text=>'My Demo App'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1715262242780266)
,p_page_id=>9999
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1605216128981133.1002)
,p_translate_from_id=>wwv_flow_api.id(1605216128981133)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'Language Selector'
,p_translate_from_text=>'Language Selector'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1715474732780269)
,p_page_id=>1
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1625329803016601.1002)
,p_translate_from_id=>wwv_flow_api.id(1625329803016601)
,p_translate_column_id=>21
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This is a Demo App for HrOUG 2018.',
'<br />',
'<br />'))
,p_translate_from_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This is a Demo App for HrOUG 2018.',
'<br />',
'<br />'))
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1715658799780269)
,p_page_id=>1
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1641790804083308.1002)
,p_translate_from_id=>wwv_flow_api.id(1641790804083308)
,p_translate_column_id=>21
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'htp.p(''App language is set to: <b>''||nvl(APEX_UTIL.GET_SESSION_LANG, ''en'')||''</b>'');'
,p_translate_from_text=>'htp.p(''App language is set to: <b>''||nvl(APEX_UTIL.GET_SESSION_LANG, ''en'')||''</b>'');'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1715823541780269)
,p_page_id=>2
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1610924665995774.1002)
,p_translate_from_id=>wwv_flow_api.id(1610924665995774)
,p_translate_column_id=>21
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select EMPLOYEE_ID,',
'       FIRST_NAME,',
'       LAST_NAME,',
'       EMAIL,',
'       PHONE_NUMBER,',
'       HIRE_DATE,',
'       JOB_ID,',
'       SALARY,',
'       COMMISSION_PCT,',
'       MANAGER_ID,',
'       DEPARTMENT_ID',
'  from EMPLOYEES'))
,p_translate_from_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select EMPLOYEE_ID,',
'       FIRST_NAME,',
'       LAST_NAME,',
'       EMAIL,',
'       PHONE_NUMBER,',
'       HIRE_DATE,',
'       JOB_ID,',
'       SALARY,',
'       COMMISSION_PCT,',
'       MANAGER_ID,',
'       DEPARTMENT_ID',
'  from EMPLOYEES'))
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1716036088780269)
,p_page_id=>3
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1619932187999811.1002)
,p_translate_from_id=>wwv_flow_api.id(1619932187999811)
,p_translate_column_id=>21
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DEPARTMENT_ID,',
'       DEPARTMENT_NAME,',
'       MANAGER_ID,',
'       LOCATION_ID',
'  from DEPARTMENTS'))
,p_translate_from_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DEPARTMENT_ID,',
'       DEPARTMENT_NAME,',
'       MANAGER_ID,',
'       LOCATION_ID',
'  from DEPARTMENTS'))
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1716284881780269)
,p_page_id=>9999
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1605216128981133.1002)
,p_translate_from_id=>wwv_flow_api.id(1605216128981133)
,p_translate_column_id=>21
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'apex_lang.emit_language_selector_list;'
,p_translate_from_text=>'apex_lang.emit_language_selector_list;'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1716480751780284)
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1606485989981138.1002)
,p_translate_from_id=>wwv_flow_api.id(1606485989981138)
,p_translate_column_id=>28
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Home'
,p_translate_from_text=>'Home'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1716667609780285)
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1610593773995748.1002)
,p_translate_from_id=>wwv_flow_api.id(1610593773995748)
,p_translate_column_id=>28
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Employees'
,p_translate_from_text=>'Employees'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1716821408780285)
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1619542523999810.1002)
,p_translate_from_id=>wwv_flow_api.id(1619542523999810)
,p_translate_column_id=>28
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Departments'
,p_translate_from_text=>'Departments'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1717046906780285)
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1608062339981151.1002)
,p_translate_from_id=>wwv_flow_api.id(1608062339981151)
,p_translate_column_id=>28
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'&APP_USER.'
,p_translate_from_text=>'&APP_USER.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1717206802780285)
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1608573375981151.1002)
,p_translate_from_id=>wwv_flow_api.id(1608573375981151)
,p_translate_column_id=>28
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'---'
,p_translate_from_text=>'---'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1717424808780285)
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1608946801981152.1002)
,p_translate_from_id=>wwv_flow_api.id(1608946801981152)
,p_translate_column_id=>28
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Sign Out'
,p_translate_from_text=>'Sign Out'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1717625149780367)
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1575412815981036.1002)
,p_translate_from_id=>wwv_flow_api.id(1575412815981036)
,p_translate_column_id=>63
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Search Dialog'
,p_translate_from_text=>'Search Dialog'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1717752243780374)
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1575412815981036.1002)
,p_translate_from_id=>wwv_flow_api.id(1575412815981036)
,p_translate_column_id=>66
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'<div class="t-PopupLOV-actions t-Form--large">'
,p_translate_from_text=>'<div class="t-PopupLOV-actions t-Form--large">'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1717920212780376)
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1575412815981036.1002)
,p_translate_from_id=>wwv_flow_api.id(1575412815981036)
,p_translate_column_id=>67
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'</div>'
,p_translate_from_text=>'</div>'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1718111884780384)
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1575412815981036.1002)
,p_translate_from_id=>wwv_flow_api.id(1575412815981036)
,p_translate_column_id=>70
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'<div class="t-PopupLOV-links">'
,p_translate_from_text=>'<div class="t-PopupLOV-links">'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1718353617780386)
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1575412815981036.1002)
,p_translate_from_id=>wwv_flow_api.id(1575412815981036)
,p_translate_column_id=>71
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'</div>'
,p_translate_from_text=>'</div>'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1718598287780389)
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1575412815981036.1002)
,p_translate_from_id=>wwv_flow_api.id(1575412815981036)
,p_translate_column_id=>72
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Search'
,p_translate_from_text=>'Search'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1718784289780391)
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1575412815981036.1002)
,p_translate_from_id=>wwv_flow_api.id(1575412815981036)
,p_translate_column_id=>73
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Close'
,p_translate_from_text=>'Close'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1718961229780394)
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1575412815981036.1002)
,p_translate_from_id=>wwv_flow_api.id(1575412815981036)
,p_translate_column_id=>74
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Next &gt;'
,p_translate_from_text=>'Next &gt;'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1719128855780397)
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1575412815981036.1002)
,p_translate_from_id=>wwv_flow_api.id(1575412815981036)
,p_translate_column_id=>75
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'&lt; Previous'
,p_translate_from_text=>'&lt; Previous'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1719387209780407)
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1599424533981103.1002)
,p_translate_from_id=>wwv_flow_api.id(1599424533981103)
,p_translate_column_id=>79
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Would you like to perform this delete action?'
,p_translate_from_text=>'Would you like to perform this delete action?'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1719590744780410)
,p_translated_flow_id=>1002
,p_translate_to_id=>100.1002
,p_translate_from_id=>100
,p_translate_column_id=>80
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'My Demo App'
,p_translate_from_text=>'My Demo App'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1719712933780456)
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1475936720980934.1002)
,p_translate_from_id=>wwv_flow_api.id(1475936720980934)
,p_translate_column_id=>100
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Home'
,p_translate_from_text=>'Home'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1719800879780463)
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1602006364981127.1002)
,p_translate_from_id=>wwv_flow_api.id(1602006364981127)
,p_translate_column_id=>103
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Remember username'
,p_translate_from_text=>'Remember username'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1720032347780463)
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1648872478114197.1002)
,p_translate_from_id=>wwv_flow_api.id(1648872478114197)
,p_translate_column_id=>103
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Hrvatski'
,p_translate_from_text=>'Hrvatski'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1720273129780464)
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1649210489114198.1002)
,p_translate_from_id=>wwv_flow_api.id(1649210489114198)
,p_translate_column_id=>103
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Deutsch'
,p_translate_from_text=>'Deutsch'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1720448131780464)
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1649631325114198.1002)
,p_translate_from_id=>wwv_flow_api.id(1649631325114198)
,p_translate_column_id=>103
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'English'
,p_translate_from_text=>'English'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1720622338780464)
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1650083753114198.1002)
,p_translate_from_id=>wwv_flow_api.id(1650083753114198)
,p_translate_column_id=>103
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>unistr('Fran\00E7ais')
,p_translate_from_text=>unistr('Fran\00E7ais')
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1720861466780484)
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1602416749981127.1002)
,p_translate_from_id=>wwv_flow_api.id(1602416749981127)
,p_translate_column_id=>111
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'If you select this checkbox, the application will save your username in a persistent browser cookie named "LOGIN_USERNAME_COOKIE".',
'When you go to the login page the next time,',
'the username field will be automatically populated with this value.',
'</p>',
'<p>',
'If you deselect this checkbox and your username is already saved in the cookie,',
'the application will overwrite it with an empty value.',
'You can also use your browser''s developer tools to completely remove the cookie.',
'</p>'))
,p_translate_from_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'If you select this checkbox, the application will save your username in a persistent browser cookie named "LOGIN_USERNAME_COOKIE".',
'When you go to the login page the next time,',
'the username field will be automatically populated with this value.',
'</p>',
'<p>',
'If you deselect this checkbox and your username is already saved in the cookie,',
'the application will overwrite it with an empty value.',
'You can also use your browser''s developer tools to completely remove the cookie.',
'</p>'))
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1721002984780486)
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1575412815981036.1002)
,p_translate_from_id=>wwv_flow_api.id(1575412815981036)
,p_translate_column_id=>112
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'<div class="t-PopupLOV-pagination">Row(s) #FIRST_ROW# - #LAST_ROW#</div>'
,p_translate_from_text=>'<div class="t-PopupLOV-pagination">Row(s) #FIRST_ROW# - #LAST_ROW#</div>'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1721244480780777)
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1599029038981101.1002)
,p_translate_from_id=>wwv_flow_api.id(1599029038981101)
,p_translate_column_id=>257
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Insufficient privileges, user is not an Administrator'
,p_translate_from_text=>'Insufficient privileges, user is not an Administrator'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1721377030780802)
,p_page_id=>1
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1641504035083306.1002)
,p_translate_from_id=>wwv_flow_api.id(1641504035083306)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'SUBMIT'
,p_translate_from_text=>'SUBMIT'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1721562485780802)
,p_page_id=>3
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1641043859083301.1002)
,p_translate_from_id=>wwv_flow_api.id(1641043859083301)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1721768899780802)
,p_page_id=>3
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1641136182083302.1002)
,p_translate_from_id=>wwv_flow_api.id(1641136182083302)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1721955762780803)
,p_page_id=>3
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1641257616083303.1002)
,p_translate_from_id=>wwv_flow_api.id(1641257616083303)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1722191857780803)
,p_page_id=>9999
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1600900224981124.1002)
,p_translate_from_id=>wwv_flow_api.id(1600900224981124)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1722395736780803)
,p_page_id=>9999
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1601327831981124.1002)
,p_translate_from_id=>wwv_flow_api.id(1601327831981124)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1722504871780803)
,p_page_id=>9999
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1602416749981127.1002)
,p_translate_from_id=>wwv_flow_api.id(1602416749981127)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'1'
,p_translate_from_text=>'1'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1722712059780806)
,p_page_id=>3
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1641043859083301.1002)
,p_translate_from_id=>wwv_flow_api.id(1641043859083301)
,p_translate_column_id=>269
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1722904618780806)
,p_page_id=>3
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1641136182083302.1002)
,p_translate_from_id=>wwv_flow_api.id(1641136182083302)
,p_translate_column_id=>269
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1723163309780806)
,p_page_id=>3
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1641257616083303.1002)
,p_translate_from_id=>wwv_flow_api.id(1641257616083303)
,p_translate_column_id=>269
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1723361440780807)
,p_page_id=>9999
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1600900224981124.1002)
,p_translate_from_id=>wwv_flow_api.id(1600900224981124)
,p_translate_column_id=>269
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1723579559780807)
,p_page_id=>9999
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1601327831981124.1002)
,p_translate_from_id=>wwv_flow_api.id(1601327831981124)
,p_translate_column_id=>269
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
end;
/
begin
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1723724991780809)
,p_page_id=>1
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1641504035083306.1002)
,p_translate_from_id=>wwv_flow_api.id(1641504035083306)
,p_translate_column_id=>270
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1723953536780810)
,p_page_id=>9999
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1600900224981124.1002)
,p_translate_from_id=>wwv_flow_api.id(1600900224981124)
,p_translate_column_id=>270
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1724108907780812)
,p_page_id=>3
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1641043859083301.1002)
,p_translate_from_id=>wwv_flow_api.id(1641043859083301)
,p_translate_column_id=>271
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'TEXT'
,p_translate_from_text=>'TEXT'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1724207210780812)
,p_page_id=>3
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1641136182083302.1002)
,p_translate_from_id=>wwv_flow_api.id(1641136182083302)
,p_translate_column_id=>271
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'TEXT'
,p_translate_from_text=>'TEXT'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1724400177780812)
,p_page_id=>3
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1641257616083303.1002)
,p_translate_from_id=>wwv_flow_api.id(1641257616083303)
,p_translate_column_id=>271
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'TEXT'
,p_translate_from_text=>'TEXT'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1724699353780812)
,p_page_id=>9999
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1600900224981124.1002)
,p_translate_from_id=>wwv_flow_api.id(1600900224981124)
,p_translate_column_id=>271
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'TEXT'
,p_translate_from_text=>'TEXT'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1724877316780815)
,p_page_id=>3
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1641043859083301.1002)
,p_translate_from_id=>wwv_flow_api.id(1641043859083301)
,p_translate_column_id=>272
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'BOTH'
,p_translate_from_text=>'BOTH'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1725099209780815)
,p_page_id=>3
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1641136182083302.1002)
,p_translate_from_id=>wwv_flow_api.id(1641136182083302)
,p_translate_column_id=>272
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'BOTH'
,p_translate_from_text=>'BOTH'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1725265010780815)
,p_page_id=>3
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1641257616083303.1002)
,p_translate_from_id=>wwv_flow_api.id(1641257616083303)
,p_translate_column_id=>272
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'BOTH'
,p_translate_from_text=>'BOTH'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1725400962780815)
,p_page_id=>9999
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1600900224981124.1002)
,p_translate_from_id=>wwv_flow_api.id(1600900224981124)
,p_translate_column_id=>272
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'NONE'
,p_translate_from_text=>'NONE'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1725689559780830)
,p_page_id=>9999
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1604959651981132.1002)
,p_translate_from_id=>wwv_flow_api.id(1604959651981132)
,p_translate_column_id=>278
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'CLEAR_CACHE_CURRENT_PAGE'
,p_translate_from_text=>'CLEAR_CACHE_CURRENT_PAGE'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1725880427780874)
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1473369218980928.1002)
,p_translate_from_id=>wwv_flow_api.id(1473369218980928)
,p_translate_column_id=>298
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'modern'
,p_translate_from_text=>'modern'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1726047102780874)
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1473692150980929.1002)
,p_translate_from_id=>wwv_flow_api.id(1473692150980929)
,p_translate_column_id=>298
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1726229196780874)
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1473967094980930.1002)
,p_translate_from_id=>wwv_flow_api.id(1473967094980930)
,p_translate_column_id=>298
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1726413975780874)
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1474544511980930.1002)
,p_translate_from_id=>wwv_flow_api.id(1474544511980930)
,p_translate_column_id=>298
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1726620791780874)
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1475196115980930.1002)
,p_translate_from_id=>wwv_flow_api.id(1475196115980930)
,p_translate_column_id=>298
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'IG'
,p_translate_from_text=>'IG'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1726889057780879)
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1473967094980930.1002)
,p_translate_from_id=>wwv_flow_api.id(1473967094980930)
,p_translate_column_id=>300
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1727036436780883)
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1473967094980930.1002)
,p_translate_from_id=>wwv_flow_api.id(1473967094980930)
,p_translate_column_id=>302
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'SWITCH'
,p_translate_from_text=>'SWITCH'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1727214071780895)
,p_page_id=>1
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1625329803016601.1002)
,p_translate_from_id=>wwv_flow_api.id(1625329803016601)
,p_translate_column_id=>308
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1727465524780895)
,p_page_id=>9999
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1600554547981121.1002)
,p_translate_from_id=>wwv_flow_api.id(1600554547981121)
,p_translate_column_id=>308
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1727697866780898)
,p_page_id=>1
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1625329803016601.1002)
,p_translate_from_id=>wwv_flow_api.id(1625329803016601)
,p_translate_column_id=>309
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'HTML'
,p_translate_from_text=>'HTML'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1727846042780898)
,p_page_id=>9999
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1600554547981121.1002)
,p_translate_from_id=>wwv_flow_api.id(1600554547981121)
,p_translate_column_id=>309
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'TEXT'
,p_translate_from_text=>'TEXT'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1728092055780901)
,p_page_id=>9999
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1600554547981121.1002)
,p_translate_from_id=>wwv_flow_api.id(1600554547981121)
,p_translate_column_id=>310
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1728249227780976)
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1599029038981101.1002)
,p_translate_from_id=>wwv_flow_api.id(1599029038981101)
,p_translate_column_id=>343
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'return true;'
,p_translate_from_text=>'return true;'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1728331062781069)
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1608062339981151.1002)
,p_translate_from_id=>wwv_flow_api.id(1608062339981151)
,p_translate_column_id=>377
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'has-username'
,p_translate_from_text=>'has-username'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1728473031781115)
,p_page_id=>9999
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1600900224981124.1002)
,p_translate_from_id=>wwv_flow_api.id(1600900224981124)
,p_translate_column_id=>396
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'username'
,p_translate_from_text=>'username'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1728522634781115)
,p_page_id=>9999
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1601327831981124.1002)
,p_translate_from_id=>wwv_flow_api.id(1601327831981124)
,p_translate_column_id=>396
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'password'
,p_translate_from_text=>'password'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1728761450781119)
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1596365551981065.1002)
,p_translate_from_id=>wwv_flow_api.id(1596365551981065)
,p_translate_column_id=>397
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Desktop'
,p_translate_from_text=>'Desktop'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1728912083781171)
,p_page_id=>2
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1612714061995790.1002)
,p_translate_from_id=>wwv_flow_api.id(1612714061995790)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Employee ID'
,p_translate_from_text=>'Employee ID'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1729171089781172)
,p_page_id=>2
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1613353149995792.1002)
,p_translate_from_id=>wwv_flow_api.id(1613353149995792)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'First Name'
,p_translate_from_text=>'First Name'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1729336414781172)
,p_page_id=>2
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1613949719995792.1002)
,p_translate_from_id=>wwv_flow_api.id(1613949719995792)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Last Name'
,p_translate_from_text=>'Last Name'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1729523530781172)
,p_page_id=>2
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1614572293995793.1002)
,p_translate_from_id=>wwv_flow_api.id(1614572293995793)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'E-mail'
,p_translate_from_text=>'E-mail'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1729739031781173)
,p_page_id=>2
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1615162268995794.1002)
,p_translate_from_id=>wwv_flow_api.id(1615162268995794)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Phone Number'
,p_translate_from_text=>'Phone Number'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1729954772781173)
,p_page_id=>2
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1615744592995795.1002)
,p_translate_from_id=>wwv_flow_api.id(1615744592995795)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Hire Date'
,p_translate_from_text=>'Hire Date'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1730159753781174)
,p_page_id=>2
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1616358871995796.1002)
,p_translate_from_id=>wwv_flow_api.id(1616358871995796)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Job'
,p_translate_from_text=>'Job'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1730301586781174)
,p_page_id=>2
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1616960401995796.1002)
,p_translate_from_id=>wwv_flow_api.id(1616960401995796)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Salary'
,p_translate_from_text=>'Salary'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1730533809781174)
,p_page_id=>2
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1617565030995797.1002)
,p_translate_from_id=>wwv_flow_api.id(1617565030995797)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Commission Pct.'
,p_translate_from_text=>'Commission Pct.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1730759103781175)
,p_page_id=>2
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1618147416995797.1002)
,p_translate_from_id=>wwv_flow_api.id(1618147416995797)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Manager'
,p_translate_from_text=>'Manager'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1730998250781175)
,p_page_id=>2
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1618761327995798.1002)
,p_translate_from_id=>wwv_flow_api.id(1618761327995798)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Department'
,p_translate_from_text=>'Department'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1731199185781175)
,p_page_id=>3
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1621718313999813.1002)
,p_translate_from_id=>wwv_flow_api.id(1621718313999813)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Department ID'
,p_translate_from_text=>'Department ID'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1731331599781175)
,p_page_id=>3
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1622366115999813.1002)
,p_translate_from_id=>wwv_flow_api.id(1622366115999813)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Department Name'
,p_translate_from_text=>'Department Name'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1731589121781176)
,p_page_id=>3
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1622919268999814.1002)
,p_translate_from_id=>wwv_flow_api.id(1622919268999814)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Manager'
,p_translate_from_text=>'Manager'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1731760689781176)
,p_page_id=>3
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1623519793999814.1002)
,p_translate_from_id=>wwv_flow_api.id(1623519793999814)
,p_translate_column_id=>421
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Location'
,p_translate_from_text=>'Location'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1731977430781179)
,p_page_id=>2
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1612154531995785.1002)
,p_translate_from_id=>wwv_flow_api.id(1612154531995785)
,p_translate_column_id=>422
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1732102720781180)
,p_page_id=>2
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1613353149995792.1002)
,p_translate_from_id=>wwv_flow_api.id(1613353149995792)
,p_translate_column_id=>422
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1732391692781180)
,p_page_id=>2
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1613949719995792.1002)
,p_translate_from_id=>wwv_flow_api.id(1613949719995792)
,p_translate_column_id=>422
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1732530995781180)
,p_page_id=>2
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1615162268995794.1002)
,p_translate_from_id=>wwv_flow_api.id(1615162268995794)
,p_translate_column_id=>422
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1732754113781180)
,p_page_id=>3
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1621144687999812.1002)
,p_translate_from_id=>wwv_flow_api.id(1621144687999812)
,p_translate_column_id=>422
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1732984874781180)
,p_page_id=>3
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1622366115999813.1002)
,p_translate_from_id=>wwv_flow_api.id(1622366115999813)
,p_translate_column_id=>422
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1733122946781183)
,p_page_id=>2
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1613353149995792.1002)
,p_translate_from_id=>wwv_flow_api.id(1613353149995792)
,p_translate_column_id=>423
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1733344566781183)
,p_page_id=>2
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1613949719995792.1002)
,p_translate_from_id=>wwv_flow_api.id(1613949719995792)
,p_translate_column_id=>423
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1733534906781183)
,p_page_id=>2
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1615162268995794.1002)
,p_translate_from_id=>wwv_flow_api.id(1615162268995794)
,p_translate_column_id=>423
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1733788180781184)
,p_page_id=>3
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1622366115999813.1002)
,p_translate_from_id=>wwv_flow_api.id(1622366115999813)
,p_translate_column_id=>423
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1733951405781186)
,p_page_id=>2
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1612714061995790.1002)
,p_translate_from_id=>wwv_flow_api.id(1612714061995790)
,p_translate_column_id=>424
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'right'
,p_translate_from_text=>'right'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1734176132781186)
,p_page_id=>2
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1613353149995792.1002)
,p_translate_from_id=>wwv_flow_api.id(1613353149995792)
,p_translate_column_id=>424
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1734316285781186)
,p_page_id=>2
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1613949719995792.1002)
,p_translate_from_id=>wwv_flow_api.id(1613949719995792)
,p_translate_column_id=>424
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1734556686781187)
,p_page_id=>2
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1615162268995794.1002)
,p_translate_from_id=>wwv_flow_api.id(1615162268995794)
,p_translate_column_id=>424
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1734704979781187)
,p_page_id=>2
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1616960401995796.1002)
,p_translate_from_id=>wwv_flow_api.id(1616960401995796)
,p_translate_column_id=>424
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'right'
,p_translate_from_text=>'right'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1734941092781187)
,p_page_id=>2
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1617565030995797.1002)
,p_translate_from_id=>wwv_flow_api.id(1617565030995797)
,p_translate_column_id=>424
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'right'
,p_translate_from_text=>'right'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1735112807781187)
,p_page_id=>3
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1621718313999813.1002)
,p_translate_from_id=>wwv_flow_api.id(1621718313999813)
,p_translate_column_id=>424
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'right'
,p_translate_from_text=>'right'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1735371258781187)
,p_page_id=>3
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1622366115999813.1002)
,p_translate_from_id=>wwv_flow_api.id(1622366115999813)
,p_translate_column_id=>424
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1735549093781190)
,p_page_id=>2
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1613353149995792.1002)
,p_translate_from_id=>wwv_flow_api.id(1613353149995792)
,p_translate_column_id=>425
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'TEXT'
,p_translate_from_text=>'TEXT'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1735782170781190)
,p_page_id=>2
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1613949719995792.1002)
,p_translate_from_id=>wwv_flow_api.id(1613949719995792)
,p_translate_column_id=>425
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'TEXT'
,p_translate_from_text=>'TEXT'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1735927404781190)
,p_page_id=>2
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1615162268995794.1002)
,p_translate_from_id=>wwv_flow_api.id(1615162268995794)
,p_translate_column_id=>425
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'TEXT'
,p_translate_from_text=>'TEXT'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1736141198781190)
,p_page_id=>2
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1615744592995795.1002)
,p_translate_from_id=>wwv_flow_api.id(1615744592995795)
,p_translate_column_id=>425
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'button'
,p_translate_from_text=>'button'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1736399456781190)
,p_page_id=>3
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1622366115999813.1002)
,p_translate_from_id=>wwv_flow_api.id(1622366115999813)
,p_translate_column_id=>425
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'TEXT'
,p_translate_from_text=>'TEXT'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1736591166781193)
,p_page_id=>2
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1613353149995792.1002)
,p_translate_from_id=>wwv_flow_api.id(1613353149995792)
,p_translate_column_id=>426
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'BOTH'
,p_translate_from_text=>'BOTH'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1736702510781193)
,p_page_id=>2
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1613949719995792.1002)
,p_translate_from_id=>wwv_flow_api.id(1613949719995792)
,p_translate_column_id=>426
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'BOTH'
,p_translate_from_text=>'BOTH'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1736968314781193)
,p_page_id=>2
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1614572293995793.1002)
,p_translate_from_id=>wwv_flow_api.id(1614572293995793)
,p_translate_column_id=>426
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'BOTH'
,p_translate_from_text=>'BOTH'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1737100795781193)
,p_page_id=>2
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1615162268995794.1002)
,p_translate_from_id=>wwv_flow_api.id(1615162268995794)
,p_translate_column_id=>426
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'BOTH'
,p_translate_from_text=>'BOTH'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1737315803781194)
,p_page_id=>2
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1615744592995795.1002)
,p_translate_from_id=>wwv_flow_api.id(1615744592995795)
,p_translate_column_id=>426
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1737557674781194)
,p_page_id=>3
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1622366115999813.1002)
,p_translate_from_id=>wwv_flow_api.id(1622366115999813)
,p_translate_column_id=>426
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'BOTH'
,p_translate_from_text=>'BOTH'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1737710115781199)
,p_page_id=>2
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1615744592995795.1002)
,p_translate_from_id=>wwv_flow_api.id(1615744592995795)
,p_translate_column_id=>428
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'NONE'
,p_translate_from_text=>'NONE'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1754197700803735)
,p_page_id=>4
,p_translated_flow_id=>1001
,p_translate_to_id=>4.1001
,p_translate_from_id=>4
,p_translate_column_id=>5
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Translation Util'
,p_translate_from_text=>'Translation Util'
);
end;
/
begin
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1754268601803738)
,p_page_id=>4
,p_translated_flow_id=>1001
,p_translate_to_id=>4.1001
,p_translate_from_id=>4
,p_translate_column_id=>6
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Translation Util'
,p_translate_from_text=>'Translation Util'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1754401486803755)
,p_page_id=>4
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1642144467083312.1001)
,p_translate_from_id=>wwv_flow_api.id(1642144467083312)
,p_translate_column_id=>13
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Generate'
,p_translate_from_text=>'Generate'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1754692223803758)
,p_page_id=>4
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1641925472083310.1001)
,p_translate_from_id=>wwv_flow_api.id(1641925472083310)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Translation Language'
,p_translate_from_text=>'Translation Language'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1754880523803758)
,p_page_id=>4
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1642034661083311.1001)
,p_translate_from_id=>wwv_flow_api.id(1642034661083311)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Page ID'
,p_translate_from_text=>'Page ID'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1755004398803771)
,p_page_id=>4
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1641848410083309.1001)
,p_translate_from_id=>wwv_flow_api.id(1641848410083309)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'Generate Translation SQL'
,p_translate_from_text=>'Generate Translation SQL'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1755158713803791)
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1751070861724137.1001)
,p_translate_from_id=>wwv_flow_api.id(1751070861724137)
,p_translate_column_id=>28
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Translation Util'
,p_translate_from_text=>'Translation Util'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1755318188804303)
,p_page_id=>4
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1641925472083310.1001)
,p_translate_from_id=>wwv_flow_api.id(1641925472083310)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'NONE'
,p_translate_from_text=>'NONE'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1755447425804303)
,p_page_id=>4
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1642034661083311.1001)
,p_translate_from_id=>wwv_flow_api.id(1642034661083311)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'NONE'
,p_translate_from_text=>'NONE'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1755637948804306)
,p_page_id=>4
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1641925472083310.1001)
,p_translate_from_id=>wwv_flow_api.id(1641925472083310)
,p_translate_column_id=>269
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1755848189804306)
,p_page_id=>4
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1642034661083311.1001)
,p_translate_from_id=>wwv_flow_api.id(1642034661083311)
,p_translate_column_id=>269
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1756093457804403)
,p_page_id=>4
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1641848410083309.1001)
,p_translate_from_id=>wwv_flow_api.id(1641848410083309)
,p_translate_column_id=>308
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1756114541804405)
,p_page_id=>4
,p_translated_flow_id=>1001
,p_translate_to_id=>wwv_flow_api.id(1641848410083309.1001)
,p_translate_from_id=>wwv_flow_api.id(1641848410083309)
,p_translate_column_id=>309
,p_translate_to_lang_code=>'hr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'HTML'
,p_translate_from_text=>'HTML'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1756322371804789)
,p_page_id=>4
,p_translated_flow_id=>1003
,p_translate_to_id=>4.1003
,p_translate_from_id=>4
,p_translate_column_id=>5
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Translation Util'
,p_translate_from_text=>'Translation Util'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1756445560804790)
,p_page_id=>4
,p_translated_flow_id=>1003
,p_translate_to_id=>4.1003
,p_translate_from_id=>4
,p_translate_column_id=>6
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Translation Util'
,p_translate_from_text=>'Translation Util'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1756628009804791)
,p_page_id=>4
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1642144467083312.1003)
,p_translate_from_id=>wwv_flow_api.id(1642144467083312)
,p_translate_column_id=>13
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Generate'
,p_translate_from_text=>'Generate'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1756821754804792)
,p_page_id=>4
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1641925472083310.1003)
,p_translate_from_id=>wwv_flow_api.id(1641925472083310)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Translation Language'
,p_translate_from_text=>'Translation Language'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1757031549804792)
,p_page_id=>4
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1642034661083311.1003)
,p_translate_from_id=>wwv_flow_api.id(1642034661083311)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Page ID'
,p_translate_from_text=>'Page ID'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1757209498804793)
,p_page_id=>4
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1641848410083309.1003)
,p_translate_from_id=>wwv_flow_api.id(1641848410083309)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'Generate Translation SQL'
,p_translate_from_text=>'Generate Translation SQL'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1757484216804795)
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1751070861724137.1003)
,p_translate_from_id=>wwv_flow_api.id(1751070861724137)
,p_translate_column_id=>28
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Translation Util'
,p_translate_from_text=>'Translation Util'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1757643023805053)
,p_page_id=>4
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1641925472083310.1003)
,p_translate_from_id=>wwv_flow_api.id(1641925472083310)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'NONE'
,p_translate_from_text=>'NONE'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1757780101805054)
,p_page_id=>4
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1642034661083311.1003)
,p_translate_from_id=>wwv_flow_api.id(1642034661083311)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'NONE'
,p_translate_from_text=>'NONE'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1757961951805056)
,p_page_id=>4
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1641925472083310.1003)
,p_translate_from_id=>wwv_flow_api.id(1641925472083310)
,p_translate_column_id=>269
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1758195789805057)
,p_page_id=>4
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1642034661083311.1003)
,p_translate_from_id=>wwv_flow_api.id(1642034661083311)
,p_translate_column_id=>269
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1758359892805147)
,p_page_id=>4
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1641848410083309.1003)
,p_translate_from_id=>wwv_flow_api.id(1641848410083309)
,p_translate_column_id=>308
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1758459277805150)
,p_page_id=>4
,p_translated_flow_id=>1003
,p_translate_to_id=>wwv_flow_api.id(1641848410083309.1003)
,p_translate_from_id=>wwv_flow_api.id(1641848410083309)
,p_translate_column_id=>309
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'HTML'
,p_translate_from_text=>'HTML'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1758690198805526)
,p_page_id=>4
,p_translated_flow_id=>1002
,p_translate_to_id=>4.1002
,p_translate_from_id=>4
,p_translate_column_id=>5
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Translation Util'
,p_translate_from_text=>'Translation Util'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1758751041805527)
,p_page_id=>4
,p_translated_flow_id=>1002
,p_translate_to_id=>4.1002
,p_translate_from_id=>4
,p_translate_column_id=>6
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Translation Util'
,p_translate_from_text=>'Translation Util'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1758925345805528)
,p_page_id=>4
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1642144467083312.1002)
,p_translate_from_id=>wwv_flow_api.id(1642144467083312)
,p_translate_column_id=>13
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Generate'
,p_translate_from_text=>'Generate'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1759192693805528)
,p_page_id=>4
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1641925472083310.1002)
,p_translate_from_id=>wwv_flow_api.id(1641925472083310)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Translation Language'
,p_translate_from_text=>'Translation Language'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1759352623805529)
,p_page_id=>4
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1642034661083311.1002)
,p_translate_from_id=>wwv_flow_api.id(1642034661083311)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Page ID'
,p_translate_from_text=>'Page ID'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1759576698805530)
,p_page_id=>4
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1641848410083309.1002)
,p_translate_from_id=>wwv_flow_api.id(1641848410083309)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'Generate Translation SQL'
,p_translate_from_text=>'Generate Translation SQL'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1759761180805533)
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1751070861724137.1002)
,p_translate_from_id=>wwv_flow_api.id(1751070861724137)
,p_translate_column_id=>28
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Translation Util'
,p_translate_from_text=>'Translation Util'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1759990815805678)
,p_page_id=>4
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1641925472083310.1002)
,p_translate_from_id=>wwv_flow_api.id(1641925472083310)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'NONE'
,p_translate_from_text=>'NONE'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1760016651805679)
,p_page_id=>4
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1642034661083311.1002)
,p_translate_from_id=>wwv_flow_api.id(1642034661083311)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'NONE'
,p_translate_from_text=>'NONE'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1760206399805683)
,p_page_id=>4
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1641925472083310.1002)
,p_translate_from_id=>wwv_flow_api.id(1641925472083310)
,p_translate_column_id=>269
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1760426929805684)
,p_page_id=>4
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1642034661083311.1002)
,p_translate_from_id=>wwv_flow_api.id(1642034661083311)
,p_translate_column_id=>269
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1760681147805770)
,p_page_id=>4
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1641848410083309.1002)
,p_translate_from_id=>wwv_flow_api.id(1641848410083309)
,p_translate_column_id=>308
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(1760786337805773)
,p_page_id=>4
,p_translated_flow_id=>1002
,p_translate_to_id=>wwv_flow_api.id(1641848410083309.1002)
,p_translate_from_id=>wwv_flow_api.id(1641848410083309)
,p_translate_column_id=>309
,p_translate_to_lang_code=>'de'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'HTML'
,p_translate_from_text=>'HTML'
);
end;
/
prompt --application/shared_components/globalization/messages
begin
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1740698946754043)
,p_name=>'TRANS_MSG1'
,p_message_text=>'This is the default English text.'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1740856740756644)
,p_name=>'TRANS_MSG1'
,p_message_language=>'hr'
,p_message_text=>'Ovo je osnovna hrvatska poruka.'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1764112420836476)
,p_name=>'TRANS_MSG1'
,p_message_language=>'fr'
,p_message_text=>'This is the default English text.'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1764426781836753)
,p_name=>'TRANS_MSG1'
,p_message_language=>'de'
,p_message_text=>'This is the default English text.'
,p_is_js_message=>true
);
end;
/
prompt --application/shared_components/globalization/dyntranslations
begin
null;
end;
/
prompt --application/shared_components/user_interface/shortcuts/delete_confirm_msg
begin
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(1599424533981103)
,p_shortcut_name=>'DELETE_CONFIRM_MSG'
,p_shortcut_type=>'TEXT_ESCAPE_JS'
,p_shortcut=>'Would you like to perform this delete action?'
);
end;
/
prompt --application/shared_components/security/authentications/application_express_authentication
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(1475449379980933)
,p_name=>'Application Express Authentication'
,p_scheme_type=>'NATIVE_APEX_ACCOUNTS'
,p_invalid_session_type=>'LOGIN'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
end;
/
prompt --application/user_interfaces
begin
wwv_flow_api.create_user_interface(
 p_id=>wwv_flow_api.id(1596365551981065)
,p_ui_type_name=>'DESKTOP'
,p_display_name=>'Desktop'
,p_display_seq=>10
,p_use_auto_detect=>false
,p_is_default=>true
,p_theme_id=>42
,p_home_url=>'f?p=&APP_ID.:1:&SESSION.'
,p_login_url=>'f?p=&APP_ID.:LOGIN_DESKTOP:&SESSION.'
,p_theme_style_by_user_pref=>false
,p_global_page_id=>0
,p_navigation_list_id=>wwv_flow_api.id(1476249675980936)
,p_navigation_list_position=>'SIDE'
,p_navigation_list_template_id=>wwv_flow_api.id(1567840590981022)
,p_nav_list_template_options=>'#DEFAULT#'
,p_css_file_urls=>'#APP_IMAGES#app-icon.css?version=#APP_VERSION#'
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_api.id(1596033144981064)
,p_nav_bar_list_template_id=>wwv_flow_api.id(1567626872981022)
,p_nav_bar_template_options=>'#DEFAULT#'
);
end;
/
prompt --application/user_interfaces/combined_files
begin
null;
end;
/
prompt --application/pages/page_00000
begin
wwv_flow_api.create_page(
 p_id=>0
,p_user_interface_id=>wwv_flow_api.id(1596365551981065)
,p_name=>'Global Page - Desktop'
,p_step_title=>'Global Page - Desktop'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'D'
,p_last_updated_by=>'DHUHA'
,p_last_upd_yyyymmddhh24miss=>'20181011190742'
);
end;
/
prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(1596365551981065)
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>'My Demo App'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'DHUHA'
,p_last_upd_yyyymmddhh24miss=>'20181013133216'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1625329803016601)
,p_plug_name=>'About'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(1522385093980988)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This is a Demo App for HrOUG 2018.',
'<br />',
'<br />'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1641790804083308)
,p_plug_name=>'Lang display'
,p_parent_plug_id=>wwv_flow_api.id(1625329803016601)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1500825512980975)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'htp.p(''App language is set to: <b>''||nvl(APEX_UTIL.GET_SESSION_LANG, ''en'')||''</b>'');'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1641504035083306)
,p_name=>'P1_APP_LANG'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1641790804083308)
,p_item_default=>'nvl(APEX_UTIL.GET_SESSION_LANG, ''en'')'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'App Language'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'APP_LANG_LOV'
,p_lov=>'.'||wwv_flow_api.id(1648569707114195)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(1573985718981030)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SUBMIT'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1641639434083307)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Lang'
,p_process_sql_clob=>'APEX_UTIL.SET_SESSION_LANG(:P1_APP_LANG);'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
prompt --application/pages/page_00002
begin
wwv_flow_api.create_page(
 p_id=>2
,p_user_interface_id=>wwv_flow_api.id(1596365551981065)
,p_name=>'Employees'
,p_step_title=>'Employees'
,p_step_sub_title=>'Employees'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'DHUHA'
,p_last_upd_yyyymmddhh24miss=>'20181013130927'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1610924665995774)
,p_plug_name=>'Employees'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1522385093980988)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select EMPLOYEE_ID,',
'       FIRST_NAME,',
'       LAST_NAME,',
'       EMAIL,',
'       PHONE_NUMBER,',
'       HIRE_DATE,',
'       JOB_ID,',
'       SALARY,',
'       COMMISSION_PCT,',
'       MANAGER_ID,',
'       DEPARTMENT_ID',
'  from EMPLOYEES'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1612154531995785)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_pivot=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1612714061995790)
,p_name=>'EMPLOYEE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EMPLOYEE_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Employee ID'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>20
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1613353149995792)
,p_name=>'FIRST_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FIRST_NAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'First Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>20
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1613949719995792)
,p_name=>'LAST_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LAST_NAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Last Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>25
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1614572293995793)
,p_name=>'EMAIL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EMAIL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'E-mail'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>25
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1615162268995794)
,p_name=>'PHONE_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PHONE_NUMBER'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Phone Number'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>20
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1615744592995795)
,p_name=>'HIRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'HIRE_DATE'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Hire Date'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1616358871995796)
,p_name=>'JOB_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'JOB_ID'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Job'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select job_title, job_id',
'  from jobs'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1616960401995796)
,p_name=>'SALARY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SALARY'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Salary'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1617565030995797)
,p_name=>'COMMISSION_PCT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COMMISSION_PCT'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Commission Pct.'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1618147416995797)
,p_name=>'MANAGER_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MANAGER_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Manager'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select last_name, employee_id',
'  from employees',
' '))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1618761327995798)
,p_name=>'DEPARTMENT_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DEPARTMENT_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Department'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select department_name, department_id',
'  from departments'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(1611491396995776)
,p_internal_uid=>1611491396995776
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(1611827917995781)
,p_interactive_grid_id=>wwv_flow_api.id(1611491396995776)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(1611919138995783)
,p_report_id=>wwv_flow_api.id(1611827917995781)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1612591763995787)
,p_view_id=>wwv_flow_api.id(1611919138995783)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(1612154531995785)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1613182972995791)
,p_view_id=>wwv_flow_api.id(1611919138995783)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(1612714061995790)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1613736626995792)
,p_view_id=>wwv_flow_api.id(1611919138995783)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(1613353149995792)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1614313850995793)
,p_view_id=>wwv_flow_api.id(1611919138995783)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(1613949719995792)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1614976820995794)
,p_view_id=>wwv_flow_api.id(1611919138995783)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(1614572293995793)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1615510759995795)
,p_view_id=>wwv_flow_api.id(1611919138995783)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(1615162268995794)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1616133180995795)
,p_view_id=>wwv_flow_api.id(1611919138995783)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(1615744592995795)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1616712101995796)
,p_view_id=>wwv_flow_api.id(1611919138995783)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(1616358871995796)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1617357719995797)
,p_view_id=>wwv_flow_api.id(1611919138995783)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(1616960401995796)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1617943735995797)
,p_view_id=>wwv_flow_api.id(1611919138995783)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(1617565030995797)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1618535534995798)
,p_view_id=>wwv_flow_api.id(1611919138995783)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(1618147416995797)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1619163205995799)
,p_view_id=>wwv_flow_api.id(1611919138995783)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(1618761327995798)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1641412958083305)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(1610924665995774)
,p_button_name=>'ADD_EMP'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1574484596981032)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Employee'
,p_button_position=>'REGION_TEMPLATE_EDIT'
);
end;
/
prompt --application/pages/page_00003
begin
wwv_flow_api.create_page(
 p_id=>3
,p_user_interface_id=>wwv_flow_api.id(1596365551981065)
,p_name=>'Departments'
,p_step_title=>'Departments'
,p_step_sub_title=>'Departments'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'DHUHA'
,p_last_upd_yyyymmddhh24miss=>'20181013130859'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1619932187999811)
,p_plug_name=>'Departments'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1522385093980988)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DEPARTMENT_ID,',
'       DEPARTMENT_NAME,',
'       MANAGER_ID,',
'       LOCATION_ID',
'  from DEPARTMENTS'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1621144687999812)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_pivot=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1621718313999813)
,p_name=>'DEPARTMENT_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DEPARTMENT_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Department ID'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>20
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1622366115999813)
,p_name=>'DEPARTMENT_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DEPARTMENT_NAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Department Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1622919268999814)
,p_name=>'MANAGER_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MANAGER_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Manager'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select last_name, employee_id',
'  from employees'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1623519793999814)
,p_name=>'LOCATION_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LOCATION_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Location'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select city, location_id',
'  from locations'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(1620467177999811)
,p_internal_uid=>1620467177999811
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>false
,p_toolbar_buttons=>null
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_download=>false
,p_download_formats=>null
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(1620867934999812)
,p_interactive_grid_id=>wwv_flow_api.id(1620467177999811)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(1620900981999812)
,p_report_id=>wwv_flow_api.id(1620867934999812)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1621589624999812)
,p_view_id=>wwv_flow_api.id(1620900981999812)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(1621144687999812)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1622109092999813)
,p_view_id=>wwv_flow_api.id(1620900981999812)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(1621718313999813)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1622752205999814)
,p_view_id=>wwv_flow_api.id(1620900981999812)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(1622366115999813)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1623398180999814)
,p_view_id=>wwv_flow_api.id(1620900981999812)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(1622919268999814)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1623970907999815)
,p_view_id=>wwv_flow_api.id(1620900981999812)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(1623519793999814)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1641301676083304)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(1619932187999811)
,p_button_name=>'ADD_DEP'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1574484596981032)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Department'
,p_button_position=>'REGION_TEMPLATE_EDIT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1641043859083301)
,p_name=>'P3_DEPARTMENT_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1619932187999811)
,p_prompt=>'Department Name'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(1573985718981030)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1641136182083302)
,p_name=>'P3_MANAGER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1619932187999811)
,p_prompt=>'Manager'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(1573985718981030)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1641257616083303)
,p_name=>'P3_LOCATION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(1619932187999811)
,p_prompt=>'Location'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(1573985718981030)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
end;
/
prompt --application/pages/page_00004
begin
wwv_flow_api.create_page(
 p_id=>4
,p_user_interface_id=>wwv_flow_api.id(1596365551981065)
,p_name=>'Translation Util'
,p_step_title=>'Translation Util'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'DHUHA'
,p_last_upd_yyyymmddhh24miss=>'20181024192651'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1641848410083309)
,p_plug_name=>'Generate Translation SQL'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(1522385093980988)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1642144467083312)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(1641848410083309)
,p_button_name=>'GENERATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1574484596981032)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generate'
,p_button_position=>'REGION_TEMPLATE_EDIT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1641925472083310)
,p_name=>'P4_TRANSLATION_APP_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1641848410083309)
,p_prompt=>'Translation Language'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select translated_app_language',
'      ,translated_application_id',
'  from apex_application_trans_map',
' where primary_application_id = :APP_ID'))
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(1573985718981030)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1642034661083311)
,p_name=>'P4_PAGE_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1641848410083309)
,p_prompt=>'Page ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select page_id || '' - '' || page_name',
'      ,page_id',
'  from apex_application_pages',
' where application_id = 100',
' order by page_id'))
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(1573985718981030)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1642265631083313)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generate SQL'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_custom_trans_util.gen_deployment_script(',
'  :P4_TRANSLATION_APP_ID',
' ,:P4_PAGE_ID',
');'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(1642144467083312)
);
end;
/
prompt --application/pages/page_00007
begin
wwv_flow_api.create_page(
 p_id=>7
,p_user_interface_id=>wwv_flow_api.id(1596365551981065)
,p_name=>'App Gen'
,p_step_title=>'App Gen'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'DHUHA'
,p_last_upd_yyyymmddhh24miss=>'20181104163820'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1642682941083317)
,p_plug_name=>'App Gen'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(1522385093980988)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(1643789668083328)
,p_name=>'Generated Apps'
,p_template=>wwv_flow_api.id(1522385093980988)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select APP_GEN_APP_ID,',
'       APP_ID GEN_APP_ID,',
'       USER_DDL,',
'       USER_DDL_TABLES,',
'       API_SOURCE,',
'       VIEWS_SOURCE,',
'       ADDITIONAL_SOURCE,',
'       CREATED_ON,',
'       CREATED_BY',
'  from APP_GEN_APPS'))
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(1546658332981006)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1643812393083329)
,p_query_column_id=>1
,p_column_alias=>'APP_GEN_APP_ID'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1644758679083338)
,p_query_column_id=>2
,p_column_alias=>'GEN_APP_ID'
,p_column_display_sequence=>2
,p_column_heading=>'App ID'
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=#GEN_APP_ID#:1:&SESSION.::&DEBUG.:RP::'
,p_column_linktext=>'#GEN_APP_ID#'
,p_column_link_attr=>'target="_blank"'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_default_sort_dir=>'desc'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1644094564083331)
,p_query_column_id=>3
,p_column_alias=>'USER_DDL'
,p_column_display_sequence=>3
,p_column_heading=>'User DDL'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1644176035083332)
,p_query_column_id=>4
,p_column_alias=>'USER_DDL_TABLES'
,p_column_display_sequence=>4
,p_column_heading=>'User DDL Tables'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1644235831083333)
,p_query_column_id=>5
,p_column_alias=>'API_SOURCE'
,p_column_display_sequence=>5
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1644382669083334)
,p_query_column_id=>6
,p_column_alias=>'VIEWS_SOURCE'
,p_column_display_sequence=>6
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1644447956083335)
,p_query_column_id=>7
,p_column_alias=>'ADDITIONAL_SOURCE'
,p_column_display_sequence=>7
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1644505855083336)
,p_query_column_id=>8
,p_column_alias=>'CREATED_ON'
,p_column_display_sequence=>8
,p_column_heading=>'Created On'
,p_use_as_row_header=>'N'
,p_column_format=>'DD.MM.YYYY HH24:MI:SS'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1644693552083337)
,p_query_column_id=>9
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>9
,p_column_heading=>'Created By'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1642957727083320)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(1642682941083317)
,p_button_name=>'APP_GEN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1574484596981032)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generate App'
,p_button_position=>'REGION_TEMPLATE_EDIT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1642770713083318)
,p_name=>'P7_APP_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1642682941083317)
,p_prompt=>'App Id'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(1573985718981030)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'left'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1642858832083319)
,p_name=>'P7_APP_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(1642682941083317)
,p_prompt=>'App Name'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(1573985718981030)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1643402449083325)
,p_name=>'P7_SQL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1642682941083317)
,p_prompt=>'Put your DDL here:'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(1573800596981030)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1643164736083322)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generate App'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'pck_app_gen.create_app(',
'  i_sql            => :P7_SQL',
' ,i_app_id         => :P7_APP_ID',
' ,i_app_name       => :P7_APP_NAME',
' ,i_parsing_schema => ''HR''',
' ,i_app_lang       => ''hr''',
');'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(1642957727083320)
);
end;
/
prompt --application/pages/page_09999
begin
wwv_flow_api.create_page(
 p_id=>9999
,p_user_interface_id=>wwv_flow_api.id(1596365551981065)
,p_name=>'Login Page'
,p_alias=>'LOGIN_DESKTOP'
,p_step_title=>'My Demo App - Sign In'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(1482456696980955)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'DHUHA'
,p_last_upd_yyyymmddhh24miss=>'20181015194249'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1600554547981121)
,p_plug_name=>'My Demo App'
,p_icon_css_classes=>'app-icon'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1521882212980987)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1605216128981133)
,p_plug_name=>'Language Selector'
,p_parent_plug_id=>wwv_flow_api.id(1600554547981121)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1500825512980975)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>'apex_lang.emit_language_selector_list;'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1603366456981130)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(1600554547981121)
,p_button_name=>'LOGIN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1574484596981032)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Sign In'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_alignment=>'LEFT'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1600900224981124)
,p_name=>'P9999_USERNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1600554547981121)
,p_prompt=>'username'
,p_placeholder=>'username'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1573613739981028)
,p_item_icon_css_classes=>'fa-user'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1601327831981124)
,p_name=>'P9999_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1600554547981121)
,p_prompt=>'password'
,p_placeholder=>'password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1573613739981028)
,p_item_icon_css_classes=>'fa-key'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1602416749981127)
,p_name=>'P9999_REMEMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(1600554547981121)
,p_prompt=>'Remember username'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'LOGIN_REMEMBER_USERNAME'
,p_lov=>'.'||wwv_flow_api.id(1601624009981125)||'.'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1573613739981028)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'If you select this checkbox, the application will save your username in a persistent browser cookie named "LOGIN_USERNAME_COOKIE".',
'When you go to the login page the next time,',
'the username field will be automatically populated with this value.',
'</p>',
'<p>',
'If you deselect this checkbox and your username is already saved in the cookie,',
'the application will overwrite it with an empty value.',
'You can also use your browser''s developer tools to completely remove the cookie.',
'</p>'))
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1604159893981131)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Username Cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_authentication.send_login_username_cookie (',
'    p_username => lower(:P9999_USERNAME),',
'    p_consent  => :P9999_REMEMBER = ''Y'' );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1603764269981131)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Login'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_authentication.login(',
'    p_username => :P9999_USERNAME,',
'    p_password => :P9999_PASSWORD );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1604959651981132)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1604568724981132)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P9999_USERNAME := apex_authentication.get_login_username_cookie;',
':P9999_REMEMBER := case when :P9999_USERNAME is not null then ''Y'' end;'))
);
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false), p_is_component_import => true);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
