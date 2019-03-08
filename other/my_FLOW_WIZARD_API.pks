create or replace package my_flow_wizard_api as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2001 - 2017. All Rights Reserved.
--
--    NAME
--      wizapi.plb
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED (MM/DD/YYYY)
--     mhichwa  03/18/2001 - Created
--     cbcho    05/16/2001 - Added create_form_on_sp
--     cbcho    05/17/2001 - Added create_page_on_table
--     cbcho    05/22/2001 - Added create_query_and_update_page
--     cbcho    05/23/2001 - modified creae_query_and_update_page to accept p_edit_link parameters
--     cbcho    05/24/2001 - Added create_chart_page
--     cbcho    05/31/2001 - Added create_report_page
--     cbcho    06/04/2001 - Added sort option feature on create_report_page wizard
--     cbcho    06/18/2001 - Added create_calendar_page
--     cbcho    06/20/2001 - Added navigation to calendar wizard
--     cbcho    06/22/2001 - Modified procedures to accept region name parameter
--     cbcho    07/11/2001 - Added create_form_on_equijoin
--     cbcho    10/08/2001 - Modified create_form_on_sp procedure spec
--     cbcho    10/24/2001 - Modified create_updateable_report to accept primary and secondary keys
--     cbcho    10/24/2001 - Added 3 primary key support on create_updateable_report
--     cbcho    10/29/2001 - Exposed page_exists function to spec
--     cbcho    10/30/2001 - Added tab_set parameter to create_form_on_table and create_query_and_update_page
--     cbcho    10/30/2001 - Added tab_set parameter to create_form_on_sp
--     cbcho    10/31/2001 - Added p_tab_text on all exposed wizard procedure
--     cbcho    12/14/2001 - Added create_wizard
--     cbcho    12/14/2001 - Modified create_wizard to accept additional parameter
--     cbcho    01/04/2002 - Added create_tree
--     cbcho    01/04/2002 - Added generate_tree_query
--     cbcho    01/15/2002 - Added create_excel_chart
--     cbcho    01/17/2002 - Added tree template
--     cbcho    01/24/2002 - Added p_page_template on create_excel_chart
--     cbcho    03/05/2002 - Added get_owner
--     msewtz   05/01/2002 - Added create_summary_page
--     cbcho    05/07/2002 - Added create insert form wizard
--     mhichwa  05/29/2002 - Extended form on sp
--     cbcho    06/03/2002 - Added get_flow_owner function
--     mhichwa  06/06/2002 - Added report templates to drilldown wizards
--     cbcho    11/06/2002 - Added create_svg_chart wizard
--     cbcho    11/06/2002 - Added p_report_template to create_report_page
--     cbcho    11/26/2002 - Added create_query_region
--     cbcho    12/17/2002 - Added expand all, collapse all and reset tree button options
--     cbcho    02/19/2003 - bug 2785188: Added option to use a tab that reuses an existing tab on all wizards
--     mhichwa  03/14/2003 - bug 2851749: removed obsolete calls to plug_query_options
--     cbcho    04/09/2003 - bug 2882452: changed create_report_page to support friendly name attributes
--     cbcho    04/28/2003 - Changed create_svg_chart to default values for chart title, size, 3D, show legend
--     cbcho    04/30/2003 - Exposed updateable_query_exists to pkg spec. (Bug 2900758)
--     cbcho    05/06/2003 - Added table_view_exists function
--     cbcho    05/07/2003 - Added table_view_exists functions
--     cbcho    05/09/2003 - Exposed get_column_data_type to pkg spec.
--     cbcho    05/14/2003 - Added p_rpt_template in create_query_and_update_page
--     cbcho    05/14/2003 - Added get_pk function
--     cbcho    06/02/2003 - Added p_report_template in create_updateable_report
--     jstraub  06/05/2003 - Added create_report_page_structured
--     cbcho    06/06/2003 - Cleaned create_report_page procedure
--     cbcho    06/18/2003 - Added second primary key support in create_query_and_update_page (bug 3013751)
--     msewtz   07/25/2003 - Added p_plug_chart_show_summary to create_chart_page (bug 3065834)
--     cbcho    04/09/2004 - Added create_next_prev_pk_process
--     cbcho    04/13/2004 - Added where clause parameter
--     cbcho    04/15/2004 - Added create_3page_master_detail
--     cbcho    04/21/2004 - Removed create_3page_master_detail from spec and added create_master_detail
--     jstraub  04/23/2004 - Added create_form_on_ws procedure
--     jstraub  05/20/2004 - Added create_from_on_ws_rpt
--     msewtz   05/26/2004 - modified create_update_report to support row selection and multi row delete
--     cbcho    06/02/2004 - Changed generate_updatable_rpt_query to include p_where
--     cbcho    06/11/2004 - Changed create_next_prev_pk_process to fix bug 3687797
--     cbcho    06/11/2004 - Changed create_form_on_table to pass p_use_ui_default and use UI default based on this flag
--     msewtz   06/15/2004 - Changed create_update_report to support primary key and foreign key source types and values
--     cbcho    06/18/2004 - Changed create_master_detail,create_query_and_update_page to pass p_use_ui_default and use UI default based on this flag
--     cbcho    06/22/2004 - Changed create_master_detail to default 3_PAGE  on p_layout
--     cbcho    06/24/2004 - Changed create_master_detail,create_form_on_table,create_query_and_update_page to get pk source and source type
--     jstraub  06/28/2004 - Added p_use_ui_default to create_report_page_structured
--     cbcho    06/28/2004 - deprecated create_excel_chart, create_drilldown_report
--     cbcho    07/06/2004 - Removed commented procedure create_drilldown_report,create_excel_chart
--     cbcho    07/06/2004 - Removed create_insert_form
--     cbcho    07/06/2004 - Changed create_calendar_page to call new create calendar API
--     cbcho    07/15/2004 - Changed create_master_detail to default p_layout to 2_PAGE
--     cbcho    09/23/2004 - Exposed shortcut_exist function and update_html_header_w_shortcut procedure
--     msewtz   02/25/2005 - Added function get_query_columns, returns varchar2 array of columns for a given SQL query
--     msewtz   03/01/2005 - updated get_query_columns to include data types
--     cbcho    01/27/2006 - Added create_access_control
--     msewtz   02/21/2006 - added function get_valid_item_name and replaced item name generation with call to new function (bug 5036085 )
--     msewtz   04/10/2006 - added support for breadcrumns to create_master_detail
--     cbcho    11/03/2006 - added create_flash_chart
--     cbcho    11/13/2006 - added create_flash_chart_region
--     cbcho    12/05/2006 - Changed create_flash_chart to add p_show_hints,p_show_names,p_show_values,p_show_legend,p_show_grid
--     cbcho    12/07/2006 - Exposed array_element function
--     jstraub  12/12/2006 - Added p_auth_collection to create_form_on_ws and create_form_on_ws_rpt to support basic auth
--     cbcho    12/20/2006 - Changed create_flash_chart,create_flash_chart_region to accept more parameters
--     cbcho    01/05/2007 - Added flash_chart_region_source function
--     cbcho    01/22/2007 - Removed p_chart_name from flash_chart_region_source
--     cbcho    01/23/2007 - Changed flash_chart_region_source to get XMLFile reference depending on chart type
--     msewtz   02/16/2007 - updated get_query_columns to also return column length (bug 5870403)
--     madelfio 02/21/2007 - Added p_gradient_rotation to create_flash_chart and create_flash_chart_region (bug 5895018)
--     mhichwa  10/04/2007 - Added create_dyanmic_query_region
--     cbcho    10/30/2007 - Added create_dynamic_query
--     sathikum 10/31/2007 - Added parameter p_display_type to create_calendar_page for selecting AJAX or classic
--     rvallam  11/20/2007 - Added new parameters to create_report_page
--     rvallam  11/21/2007 - Added new procedure 'get_varchar_query_columns' to return only varchar columns from a query string
--     msewtz   11/28/2007 - Added create_report_query
--     jstraub  11/28/2007 - Added create_repot_on_ws
--     cbcho    11/28/2007 - Changed create_dynamic_query,create_dynamic_query_region to accept pk1,pk2,pk3
--     msewtz   11/30/2007 - Added update_report_query_sql_stmts
--     rvallam  12/11/2007 - Added print and column heading sort options to create_query_region
--     cbcho    12/12/2007 - Added p_show_detail_link to create_dynamic_query, create_dynamic_query_region
--     cbcho    12/13/2007 - Added ir_report_exists
--     jstraub  12/21/2007 - Added p_migrate_from_region to create_dynamic_query_region
--     rvallam  12/24/2007 - Added search parameters to create_report_page
--     cbcho    01/03/2008 - Added create_ir_region_on_col_info
--     rvallam  01/09/2008 - Added search parameters to create_query_region
--     cbcho    01/15/2008 - Added p_include_blob to get_query_columns
--     cbcho    01/18/2008 - Added p_form_page_id, p_pk1, p_pk2 to create_ir_region_on_col_info
--     cbcho    01/24/2008 - Added p_table_name, p_pk1 and removed p_form_page_id, p_pk2 to/from create_ir_region_on_col_info
--     msewtz   01/25/2008 - Updated create_query_region, create_report_page abd create_report_page_structured to properly default the ajax_enabled attribute
--     jstraub  12/19/2008 - Added p_pk2 to create_ir_region_on_col_info to support DOWNLOAD format mask with tables that have composite primary key
--     hfarrell 08/05/2009 - Added function flash_chart5_region_source and procedure create_flash_chart5 for AnyChart 5 integration
--     hfarrell 07/14/2009 - Added procedure create_flash_chart5_region for AnyChart 5 integration
--     pawolf   08/20/2009 - Added new functions for region wizards
--     hfarrell 08/31/2009 - Added p_map_source to create_flash_chart5 and create_flash_chart5_region
--     arayner  09/02/2009 - Added has_region_dynamic_actions procedure to check for dynamic actions associated with regions
--     arayner  09/07/2009 - Added deletion of related dynamic actions to delete_region
--     hfarrell 09/17/2009 - Updated create_flash_chart5 with map attributes
--     hfarrell 09/18/2009 - Updated create_flash_chart5_region to add p_map_projection
--     arayner  09/18/2009 - Added create_page_dynamic_action
--     jkallman 11/05/2009 - Added p_include_tz parameter to get_query_columns (to control if the timestamp with local time zone types return TIMESTAMP_LTZ)
--     jstraub  11/09/2009 - Added p_result_node, p_soap_style, p_message_format, p_namespace to create_form_on_ws_rpt to support manual web references
--     hfarrell 12/07/2009 - Updated create_flash_chart5 and create_flash_chart5_region to include map undefined region and grid region color information
--     pawolf   12/15/2009 - Moved htmldb_delete_message to new Javascript attribute
--     hfarrell 01/13/2010 - Added function generate_tree_region_query
--     hfarrell 01/14/2010 - Added create_jstree and create_jstree_region
--     hfarrell 01/22/2010 - Updated create_jstree and create_jstree_region to add hints
--     hfarrell 02/26/2010 - Updated create_jstree and create_jstree_region structure to remove unrequired columns
--     hfarrell 02/26/2010 - Updated create_jstree: added tree_has_focus,action_click,show_hints,tree_hint_text
--     cbcho    03/05/2010 - Added create_acl_tab_priv function (bug 7672449)
--     hfarrell 03/18/2010 - Updated generate_tree_region_query to include p_start_item and p_start_value
--     arayner  03/18/2010 - Added null default to p_event_triggering_elem_type parameter of create_page_dynamic_action
--     arayner  03/22/2010 - Added null default to p_event_triggering_cond_type parameter of create_page_dynamic_action
--     hfarrell 03/29/2010 - Updated create_form_on_table to handle use of UI Default groups in region generation.  Added functions get_group_region_id and ui_def_groups_exist.
--     hfarrell 04/01/2010 - Updated create_ir_region_on_col_info to include p_group for column groups based on UI Default groups
--     sathikum 04/02/2010 - Added p_include_custom_cal for generation of Custom related buttons and date pickers
--     hfarrell 04/09/2010 - Updated the following to include p_use_ui_defaults to allow for attribute dictionary UI defaults to be applied to Interactive Reports:
--                           create_dynamic_query,create_dynamic_query_region,create_report_page,create_query_region,create_form_on_equijoin
--     pawolf   04/14/2010 - Added stop_execution_on_error to create_page_dynamic_action
--     msewtz   04/17/2010 - Updated master detail and tabular form procedures to support validations and updated conditions on validations and processes
--     hfarrell 04/20/2010 - Fix for bug 7382907 - added get_shortcut_name and shortcut_name_exist to handle generation of DELETE_CONFIRM_MSG shortcut
--     hfarrell 05/10/2010 - Updated create_jstree and create_jstree_region to include p_selected_node for Selected Node Page Item attribute
--     pawolf   12/14/2010 - Added attribute_11 - attribute_15 to all tables supporting plug-ins (feature# 572)
--     sathikum 01/03/2011 - Added p_enable_drag_drop and p_enable_ajax_data_add to create_calendar_page (feature #520)
--     sathikum 01/14/2011 - added data_background_color and data_text_color(feature #520)
--     pawolf   01/17/2011 - Added has_region_validations and has_region_processes (feature# 542)
--     sathikum 01/21/2011 - Added column enable_ajax_data_edit (feature #520)
--     pawolf   02/08/2011 - Added multibyte support for page items (feature 224)
--     sathikum 02/15/2011 - Added p_enable_ajax_data_delete in create_calendar_page
--     arayner  02/24/2011 - Added p_triggering_button_id to create_page_dynamic_action (feature #385)
--     pawolf   03/28/2011 - Removed PLUG_DISPLAY_ERROR_MESSAGE (feature# 544)
--     pawolf   04/06/2011 - Added p_ajax_items_to_submit to create_dynamic_query_region and create_query_region (feature #505)
--     sathikum 04/11/2011 - Added primary_key_column, drag_drop_required_role, drag_drop_process_id and removed some parameteres from create_calendar_page (feature #520)
--     sathikum 04/14/2011 - Added item_link_primary_key_item, item_link_date_item (feature #520)
--     arayner  04/15/2011 - Added create_button procedure (feature 667)
--     sathikum 04/18/2011 - Added item_link_open_in to create_calendar_page (feature #520)
--     jstraub  04/21/2011 - Added p_table_rv_column_name to create_form_on_table and create_query_and_update_page to support row version column
--     sathikum 04/22/2011 - Added p_enable_drag_and_drop to create_calendar_page (feature #520)
--     arayner  05/10/2011 - Renamed p_button_cattributes parameter to p_button_attributes in create_button procedure
--     pawolf   05/10/2011 - Added "is hot button" (feature 702)
--     pmanirah 05/17/2011 - Added create_data_load_wizard procedure (feature #545)
--     sathikum 06/02/2011 - Added p_include_time_with_date to create_calendar_page (feature #520)
--     pmanirah 06/02/2011 - Updated create_data_load_wizard procedure by adding p_name parameter (feature #545)
--     pmanirah 06/06/2011 - Updated create_data_load_wizard by removing the parameter p_table_exits
--     hfarrell 06/07/2011 - Updated created_data_load_wizard to include parameters for region names p_region_name_step_1 - 4
--     cneumuel 06/08/2011 - Added create_login_page, to unify code (feature #581)
--     pawolf   06/09/2011 - Updated create_data_load_wizard
--     pawolf   06/15/2011 - Added create_region_plugin_page (feature# 724)
--     pmanirah 06/17/2011 - Updated create_data_load_wizard by adding a new parameter p_exists to differenticate the first time and recreation of pages (feature #545)
--     sathikum 06/27/2011 - Fixed bug #12691760, added code to support creation of calendar data using keyboard
--     pawolf   02/01/2012 - Added create_named_lov (bug 13640940)
--     arayner  03/05/2012 - Added p_event_bind_event_type_custom parameter to create_page_dynamic_action procedure (feature #767)
--     sathikum 03/06/2012 - Added p_enable_agenda to create_calendar_page to enable Agenda View (#812)
--     hfarrell 03/12/2012 - Updated create_flash_chart5 and create_flash_chart5_region to remove chart_rendering
--     pawolf   03/13/2012 - Added p_user_interface_id to several apis (feature #827)
--     arayner  03/14/2012 - Added p_event_bind_delegate_to to create_page_dynamic_action (feature# 836)
--     pawolf   03/15/2012 - Changed p_user_interface_id parameter to a required parameter (feature #827)
--     pawolf   03/19/2012 - Changed code to only use new columns in wwv_flow_user_interfaces instead of the old columns in wwv_flow (feature# 827)
--     hfarrell 03/23/2012 - Updated flash_chart5_region_source to remove p_page_id and p_chart_type. Added chart_rendering to create_flash_chart5 and create_flash_chart5_region
--     hfarrell 04/05/2012 - Removed flash_chart5_region_source - chart region source will now be null (feature #856)
--     arayner  04/20/2012 - Added wait_for_result to wwv_flow_page_da_actions (feature #599)
--     pmanirah 04/20/2012 - Added copy_named_lov procedure to replace the standalone wwv_flow_copy_lov (bug #13877046)
--     arayner  04/23/2012 - Updated wait_for_result parameters to create_page_dynamic_action to default to null (feature #599)
--     pmanirah 04/23/2012 - Added copy_button procedure to replace the standalone wwv_flow_copy_button (bug #13877046)
--                         - Added copy_page_item procedure to replace the standalone wwv_flow_copy_page_item (bug #13877046)
--                         - removed the parameter p_subscribe_yn from copy_named_lov procedure
--     pawolf   05/02/2012 - Removed flash_chart_region_source
--     pawolf   05/02/2012 - Added "Refresh" dynamic action support for charts (feature #741)
--     pawolf   05/14/2012 - Added grid templates (feature #936)
--     sathikum 05/28/2012 - Added p_change_disp_on_orientation to create_calendar_page to support orientation in Mobile Devices
--     arayner  05/28/2012 - Added wwv_flow_page_da_actions.affected_button_id (feature #678)
--     pawolf   06/06/2012 - Added create_jqm_list_view_region
--     hfarrell 06/06/2012 - Added create_form_and_list_view_page
--     sathikum 06/08/2012 - Added functions get_header_toolbar_region_id and get_footer_toolbar_region_id
--     sathikum 06/19/2012 - Added p_end_date_column to create_calendar_page (feature #814)
--     pawolf   06/25/2012 - Added create_global_page
--     pawolf   07/10/2012 - Added missing p_attribute_16 - 25 to create_region_plugin_page (feedback EA1-192)
--     hfarrell 07/26/2012 - Added functions map_exists, flash_chart_exists and jstree_exists (feature #797)
--     jstraub  07/27/2012 - Added p_report_collection_name to create_form_on_ws
--     hfarrell 08/02/2012 - Updated ir_report_exists, map_exists, flash_chart_exists and jstree_exists to add p_region_id and added tabular_form_exists (bug #14399409)
--     msewtz   08/09/2012 - Added create_user_interface
--     pmanirah 11/09/2012 - Added get_header_default_template_id and get_footer_default_template_id functions
--     pawolf   01/21/2013 - Added support for nullable "Maximum Row Count" (p_plug_query_row_count_max) of classic reports (bug #14615770)
--     hfarrell 05/24/2013 - Added p_page_mode to the following procedures: create_flash_chart5, create_jstree, create_calendar_page, create_form_on_table,create_query_and_update_page,
--                           create_form_and_list_view_page,create_query_and_update_page,create_updateable_report,create_form_on_equijoin, create_master_detail (feature #587)
--     hfarrell 05/27/2013 - Added p_page_mode to create_form_on_ws, create_summary_page, create_dynamic_query, create_report_page, create_report_on_ws, create_report_page_structured, create_wizard, create_data_load_wizard, create_access_control, create_region_plugin_page
--     hfarrel  06/06/2013 - Updated all p_page_mode parameters to remove default setting
--     pawolf   10/30/2013 - Changed default of region display position to BODY (feature #1300)
--     cneumuel 11/29/2013 - In create_button: added p_button_template_id (feature #1314)
--     msewtz   12/11/2013 - Removed create_report_page_structured (feature #351)
--     cneumuel 12/20/2013 - Region type migration to native plugins: charts, calendars, trees (feature #1312)
--     cneumuel 01/10/2014 - In create_jstree, create_jstree_region: removed obsolete parameters, create dynamic actions for expand/collapse instead of javascript buttons (feature #1312)
--     hfarrell 01/23/2014 - In create_data_load_wizard, create_wizard, create_access_control: added p_group_name (feature #1347)
--     hfarrell 01/27/2014 - In create_flash_chart5, create_jstree, create_calendar_page, create_form_on_table, create_region_plugin_page, create_dynamic_query,
--                              create_report_page, create_report_on_ws, create_updateable_report, create_form_on_equijoin, create_summary_page, create_form_on_sp: added p_group_name (feature #1347)
--     hfarrell 01/28/2014 - In create_master_detail, create_query_and_update_page, create_form_on_ws_rpt, create_form_on_ws, create_form_and_list_view_page: added p_group_name
--     msewtz   01/29/2014 - Added support for navigation lists to create_page (1236)
--     msewtz   02/10/2014 - Updated create navigation list item to support adding new target entries
--     msewtz   02/14/2014 - Added navigation list support to create report, IRR and form on table wizards
--     hfarrell 02/26/2014 - Added navigation list support to create_flash_chart5
--     hfarrell 03/04/2014 - Added navigation list support to create_jstree
--     hfarrell 03/07/2014 - Added navigation list support to create_wizard, create_data_load_wizard, create_report_on_ws, create_form_on_sp, create_form_on_equijoin,
--                           create_updateable_report, create_region_plugin_page, create_access_control, create_master_detail, create_form_on_ws_rpt
--     pawolf   02/19/2013 - Added support for region columns (feature #1393)
--     hfarrell 04/10/2014 - In create_next_prev_pk_process: added p_page_mode, to ensure appropriate error_message_location set for page processes
--     pawolf   04/15/2014 - Added create_region_plugin
--     hfarrell 04/17/2014 - Removed Legacy Flash chart procedures create_flash_chart, create_flash_chart_region and create_flash_chart_series (feature #1345)
--     cbcho    05/09/2014 - Improved get_flow_owner function
--     hfarrell 07/30/2014 - In create_jstree and create_jstree_region: removed p_tree_template - not required for John's new tree widget
--     pawolf   09/23/2014 - Added create_navigation_list_item and create_tab to be public
--     jstraub  10/21/2014 - Added is_identity_always
--     hfarrell 11/24/2014 - In create_wizard: updated default values for p_previous_button_name and p_next_button_name (feature #1601)
--     hfarrell 12/12/2014 - In create_form_on_table: added p_dialog_chained, for use in 3page masterdetail creation
--                         - In create_calendar_page: addded navigation menu parameters (feature #1236)
--     hfarrell 01/20/2015 - In create_form_and_list_view_page: updated to support navigation menu (bug #20386980)
--     pawolf   03/11/2015 - Changed edit icons to new default apex-edit-pencil.png icon (bug #20444680)
--     hfarrell 03/13/2015 - Added escape_report_label (bug #16841341)
--     cneumuel 04/13/2015 - Added create_list (bug #20717716)
--     hfarrell 06/19/2015 - In create_list - changed p_page_0x parameters from number to varchar2, to handle passing in custom URLs in Create List wizard
--     cneumuel 09/11/2015 - Made get_fk public (bug #21817814)
--     cneumuel 09/30/2015 - Added order_tables_by_parents (bug #20220385)
--     cbcho    11/13/2015 - Added create_ig_page (feature #1215)
--     hfarrell 11/16/2015 - Added create_jet_chart (feature #1838)
--     hfarrell 11/25/2015 - Added p_range_chart to create_jet_chart
--     hfarrell 01/12/2016 - Removed p_range_chart from create_jet_chart
--     hfarrell 01/13/2016 - Updated create_jet_chart: removed coordinate_system, range_chart
--     cbcho    02/18/2016 - Changed create_ig_page to accept pk2
--     cbcho    02/19/2016 - Exposed create_ig_region
--     cbcho    04/06/2016 - Added create_md_single_page (feature #1961)
--     cbcho    05/05/2016 - Added create_md_two_page, added p_link in create_ig_region, create_ig_page (feature #1984)
--     cczarski 05/30/2016 - In create_report_query: Added parameter p_content_disposition (bug #22907829)
--     cbcho    06/09/2016 - In create_ig_region: added p_ajax_items_to_submit
--     cbcho    09/09/2016 - In create_ig_region: added p_toolbar_buttons
--     arayner  12/01/2016 - In create_page_dynamic_action: added p_event_condition_element (bug #25175121)
--     hfarrell 06/14/2017 - In create_jet_chart: added Box Plot support (5.2 feature #2145)
--     hfarrell 07/19/2017 - In create_jet_chart: removed Box Plot columns - using simple column mapping to label/value instead
--     hfarrell 08/10/2017 - In create_jet_chart: added p_group_short_desc_column_name for automatic setting of label short name
--     cczarski 08/11/2017 - Created create_ir_page to create location-aware Interactive Report and add location to create_report_page (feature #2092,#2109)
--     pawolf   08/25/2017 - Added wwv_flow_page_plugs.include_rowid_column (feature #2109)
--     cczarski 10/09/2017 - In create_report_page, create_ir_page: Added web source parameters (feature #2092)
--     cczarski 11/15/2017 - In create_region_plugin_page and dependent procedures: add support for REST and Remote SQL (feature #2092, #2109)
--     hfarrell 11/16/2017 - In create_jet_chart: added Chart Remote SQL support (feature #2109)
--     cbcho    11/20/2017 - Added t_lookup type, In create_ir_page: added p_lookups (feature #2228)
--     hfarrell 11/22/2017 - Added gantt chart support to create_jet_chart (5.2 feature #2126)
--     cbcho    11/29/2017 - In create_report_page: added p_lookups (feature #2228)
--     cbcho    12/11/2017 - In create_ig_region: added p_save_when_button_id (bug #25674857)
--     cczarski 12/20/2017 - In create_jet_chart: added p_query_type parameter for REST / Remote SQL support in Create Page wizard
--     cbcho    01/30/2018 - In create_region_plugin: added p_region_template_options, p_component_template_options (feature #2274)
--     hfarrell 02/01/2018 - In create_jet_chart: added p_aggregate_function (18.1 feature #2283)
--     cbcho    02/12/2018 - Added reserve_page
--     dpeake   02/12/2018 - Added get_maximum_free_page and get_maximum_free_admin_page
--     cbcho    02/14/2018 - In reserve_page: added p_reuse to reuse page reserved by the current user
--     cbcho    02/20/2018 - In create_navigation_list_item: added p_nav_list_item_icon
--
------------------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public type definitions
--------------------------------------------------------------------------------

type t_md is record (
    page_id              number,
    page_name            varchar2(255),
    page_mode            varchar2(255),
    breadcrumb_name      varchar2(255),
    region_title         varchar2(255),
    owner                varchar2(255),
    table_name           varchar2(255),
    cols                 varchar2(32767),
    pk_col               varchar2(255),
    pk_col2              varchar2(255),
    fk_con               varchar2(255),
    master_col           varchar2(255),
    detail_col           varchar2(255),
    navigation_order_col varchar2(255)
    );

type t_lookup is record (
    column_name              varchar2(255),
    column_label             varchar2(4000),
    lookup_column_alias      varchar2(255),
    lookup_table_name        varchar2(255),
    lookup_table_pk          varchar2(255),
    lookup_table_display_col varchar2(255) );

type t_lookups is table of t_lookup index by pls_integer;

--------------------------------------------------------------------------------
-- Public constant definitions
--------------------------------------------------------------------------------
c_edit_image constant varchar2(255) := '<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="' || wwv_flow_lang.system_message( 'EDIT' ) || '">';

empty_vc_arr     wwv_flow_global.vc_arr2;
c_empty_lookup   t_lookups;


function array_element(
       p_vcarr in wwv_flow_global.vc_arr2,
       p_index in number )
       return varchar2;

--==============================================================================
-- return p_tables ordered such that tables with FKs to other tables come last
--==============================================================================
function order_tables_by_parents (
    p_owner  in varchar2,
    p_tables in wwv_flow_t_varchar2 )
    return wwv_flow_t_varchar2;

function get_pk (
       p_table_owner  in varchar2,
       p_table_name   in varchar2
       ) return varchar2;

function get_fk (
    p_table_owner in varchar2,
    p_table_name  in varchar2,
    p_parent_table_name in varchar2
    ) return varchar2;

function get_column_data_type (
      p_table_owner in varchar2,
      p_table_name  in varchar2,
      p_column_name in varchar2
      ) return varchar2;

function table_view_exists (
      p_name in varchar2,
      p_owner in varchar2
      ) return boolean;

function updateable_query_exists (
      p_flow_id in number,
      p_page_id in number)
   return boolean;

function ir_report_exists (
      p_flow_id   in number,
      p_page_id   in number,
      p_region_id in number default null)
   return boolean;

function map_exists (
      p_flow_id   in number,
      p_page_id   in number,
      p_region_id in number default null)
   return boolean;

function flash_chart_exists (
      p_flow_id   in number,
      p_page_id   in number,
      p_region_id in number default null)
   return boolean;

function jstree_exists (
      p_flow_id   in number,
      p_page_id   in number,
      p_region_id in number default null)
   return boolean;

function tabular_form_exists (
      p_flow_id   in number,
      p_page_id   in number,
      p_region_id in number default null)
   return boolean;

function page_exists (p_flow_id in number, p_page_id in number) return boolean;

function reserve_page(
    --
    -- function returns error text if the page cannot be reserved
    --
    p_flow_id    in number,
    p_page_id    in number,
    p_reuse      in boolean default false ) return varchar2;

function get_maximum_free_page (
    --
    -- function returns maximum free page number (and reserves the page)
    -- page number returns the next available page in 10s
    --
    p_flow_id    in number) return number;

function get_maximum_free_admin_page (
    --
    -- function returns maximum free administration page number (and reserves the page)
    -- page number returns the next available page in 100s
    --
    p_flow_id    in number) return number;

function get_owner (
   -- If the owner user chose is equal to flows' owner,
   -- return #OWNER#.
   --
      p_flow_id    in number,
      p_owner      in varchar2 )
   return varchar2;

function get_flow_owner (
   -- Get the owner of current flow.
   --
   p_flow_id   in number default null)
   return varchar2;

function shortcut_exist(
   --
   -- check whether TEXT_ESCAPE_JS shortcut type exists or not
   --
   p_flow_id in number,
   p_shortcut_name in varchar2)
   return boolean;

function shortcut_name_exist(
   --
   -- check whether shortcut name exists or not
   --
   p_flow_id in number,
   p_shortcut_name in varchar2)
   return boolean;


function get_shortcut_name(
   --
   -- check whether shortcut name exists or not
   --
   p_flow_id in number,
   p_shortcut_name in varchar2)
   return varchar2;

-- -----------------------------------------------------------------------------------
-- get valid item name
-- p_column_name
-- returns valid item name for given column name

function get_valid_item_name (
    p_column_name varchar2,
    p_page_id     number default null
) return varchar2;

--==============================================================================
-- Returns the page item in substitution syntax &ITEM.
-- In case if the page item is a multibyte page item it will return &"ITEM".
--==============================================================================
function get_item_substitution_value (
    p_item_name in varchar2 )
    return varchar2;

--==============================================================================
-- Returns the page item as a bind variable :ITEM
-- In case if the page item is a multibyte page item it will return :"ITEM"
--==============================================================================
function get_item_bind_variable (
    p_item_name in varchar2 )
    return varchar2;

--
-- get group region id
-- returns valid region id for given region name, page id, app id and sequence
-- as part of UI Defaults groupings
function get_group_region_id (
    p_flow_id     number,
    p_page_id     number,
    p_group_seq   number,
    p_group_name  varchar2
) return number;

--
-- Check for UI Default Groups
--
 function ui_def_groups_exist(
      p_table_owner   in varchar2,
      p_table_name    in varchar2
  )return boolean;

--
-- Check for Column Group on Interactive Report
--
 function ir_col_group_exists(
      p_flow_id      in number,
      p_worksheet_id in number,
      p_group_name   in varchar2
 )return boolean;

--------------------------------------------------------------------
-- Get preset template options
--
function get_preset_template_options (
    p_template_id    number,
    p_template_type varchar
) return varchar2;

--------------------------------------------------------------------
-- Escape html in report column headings, but limit to only the
-- following characters: < > & "
--
-- Raw Escaped
-- --- -------
--   &   &amp;
--   "   &quot;
--   <   &lt;
--   >   &gt;
--
function escape_report_label (
    p_string in varchar2
) return varchar2;

-- -----------------------------------------------------------------------------------
-- get query columns
-- p_owner: parse-as schema name
-- p_query: sql query

procedure get_query_columns (
      p_owner        in varchar2,
      p_query        in varchar2,
      p_include_blob in varchar2 default 'N',
      p_include_tz   in varchar2 default 'N',
      p_columns      out wwv_flow_global.vc_arr2,
      p_types        out wwv_flow_global.vc_arr2,
      p_col_max_len  out wwv_flow_global.vc_arr2
);

 procedure get_varchar_query_columns (
      p_owner         in varchar2,
     p_query          in varchar2,
      p_columns     out wwv_flow_global.vc_arr2
  );

 function is_old_ppr_template (
    p_flow_id            in number,
    p_report_template_id in number
 ) return boolean;

function is_identity_always (
    p_owner             in varchar2,
    p_table_name        in varchar2,
    p_column_name       in varchar2
) return boolean;

procedure create_page (
    p_flow_id                  in number,
    p_page_id                  in number,
    p_name                     in varchar2,
    p_page_mode                in varchar2,
    p_user_interface_id        in number,
    p_alias                    in varchar2 default null,
    p_title                    in varchar2 default null,
    p_group_id                 in number   default null,
    --
    p_tab_set                  in varchar2 default null,
    p_tab_name                 in varchar2 default null,
    p_tab_label                in varchar2 default null,
    --
    p_nav_list_id              in number default null,
    p_nav_list_item_id         in number default null,
    p_nav_list_item_name       in varchar2 default null,
    p_nav_list_parent_item_id  in number default null,
    p_nav_list_child_item_name in varchar2 default null,
    --
    p_html_page_header         in varchar2 default null,
    p_javascript_code          in varchar2 default null,
    --
    p_breadcrumb_id            in number   default null,
    p_breadcrumb_name          in varchar2 default null,
    p_parent_breadcrumb_id     in number   default null,
    p_inline_css               in varchar2 default null,
    p_javascript_code_onload   in varchar2 default null);

procedure create_global_page (
    p_application_id    in number,
    p_page_id           in number,
    p_user_interface_id in number );

procedure create_updateable_report (
   p_flow_id                  in number,
   p_page_id                  in number,
   p_page_name                in varchar2,
   p_group_name               in varchar2 default null,
   p_page_mode                in varchar2,
   p_user_interface_id        in number,
   p_use_ui_default           in varchar2 default 'Y',
   --
   p_tabset                   in varchar2 default null,
   p_tab_name                 in varchar2 default null, -- current tab name
   p_tab_text                 in varchar2 default null,
   --
   p_nav_list_id              in number   default null,
   p_nav_list_item_id         in number   default null,
   p_nav_list_item_name       in varchar2 default null,
   p_nav_list_parent_item_id  in number   default null,
   p_nav_list_child_item_name in varchar2 default null,
   --
   p_select_columns           in varchar2 default null,
   p_updatable_columns        in varchar2 default null,
   p_table_pk1                in varchar2 default null,
   p_table_pk1_src_type       in varchar2 default null,
   p_table_pk1_src            in varchar2 default null,
   p_table_pk2                in varchar2 default null,
   p_table_pk2_src_type       in varchar2 default null,
   p_table_pk2_src            in varchar2 default null,
   p_table_pk3                in varchar2 default null,
   p_table_pk3_src_type       in varchar2 default null,
   p_table_pk3_src            in varchar2 default null,
   p_table_fk                 in varchar2 default null,
   p_table_fk_src_type        in varchar2 default null,
   p_table_fk_src             in varchar2 default null,
   p_implement_type           in number   default null,
   p_security_group_id        in number   default null,
   --
   p_query                    in varchar2,
   p_region_title             in varchar2,
   p_region_template          in number,
   p_report_template          in number,
   p_cancel_branch            in number,
   p_submit_branch            in number,
   p_process                  in varchar2,
   p_cancel_button_name       in varchar2 default null,
   p_delete_button_name       in varchar2 default null,
   p_add_button_name          in varchar2 default null,
   p_submit_button_name       in varchar2 default null,
   p_is_master_detail         in boolean default false)
   ;

procedure create_form_on_sp (
   p_flow_id                  in number,
   p_page_id                  in number,
   p_page_name                in varchar2,
   p_group_name               in varchar2 default null,
   p_page_mode                in varchar2,
   p_user_interface_id        in number,
   --
   p_tab_set                  in varchar2 default null,
   p_tab_name                 in varchar2 default null, -- current tab name
   p_tab_text                 in varchar2 default null,
   --
   p_nav_list_id              in number   default null,
   p_nav_list_item_id         in number   default null,
   p_nav_list_item_name       in varchar2 default null,
   p_nav_list_parent_item_id  in number   default null,
   p_nav_list_child_item_name in varchar2 default null,
   --
   p_region_title             in varchar2 default null,
   p_region_template          in number,
   p_schema                   in varchar2,
   p_procedure                in varchar2,
   p_collection_name          in varchar2 default 'SP_WIZARD',
   p_cancel_branch            in number,
   p_submit_branch            in number,
   p_cancel_button_name       in varchar2 default 'Cancel',
   p_submit_button_name       in varchar2 default 'Submit',
   --
   p_button_label             in varchar2 default 'RUN',
   p_invoking_page_id         in varchar2 default null,
   p_invoking_region_id       in varchar2 default null,
   p_invoking_button_p        in varchar2 default null)
   ;

procedure create_form_on_table (
    p_flow_id                   in number   default null,
    p_page_id                   in number   default null,
    p_page_name                 in varchar2 default 'form',
    p_group_name                in varchar2 default null,
    p_page_mode                 in varchar2,
    p_user_interface_id         in number,
    p_use_ui_default            in varchar2 default 'Y',
    --
    p_tab_set                   in varchar2 default null,
    p_tab_name                  in varchar2 default null, -- current tab name
    p_tab_text                  in varchar2 default null,
    --
    p_nav_list_id               in number   default null,
    p_nav_list_item_id          in number   default null,
    p_nav_list_item_name        in varchar2 default null,
    p_nav_list_parent_item_id   in number   default null,
    p_nav_list_child_item_name  in varchar2 default null,
    --
    p_region_title              in varchar2 default null,
    p_region_template           in number default null,
    p_table_owner               in varchar2 default null,
    p_table_name                in varchar2 default null,
    p_table_pk_column_name      in varchar2 default null,
    p_table_pk_src_type         in varchar2 default null,
    p_table_pk_src              in varchar2 default null,
    p_table_pk2_column_name     in varchar2 default null,
    p_table_pk2_src_type        in varchar2 default null,
    p_table_pk2_src             in varchar2 default null,
    p_table_rv_column_name      in varchar2 default null,
    p_display_column_list       in varchar2 default null,
    --
    p_create_button_name        in varchar2 default 'Create',
    p_save_button_name          in varchar2 default 'Apply Changes',
    p_delete_button_name        in varchar2 default 'Delete',
    p_cancel_button_name        in varchar2 default 'Cancel',
    p_branch                    in number default null,
    p_cancel_branch             in number default null,
    --
    p_insert                    in varchar2 default 'Y',
    p_update                    in varchar2 default 'Y',
    p_delete                    in varchar2 default 'Y',
    --
    p_dialog_chained            in varchar2 default 'Y'
    );

procedure create_form_on_ws (
    p_flow_id                 in number   default null,
    p_page_id                 in number   default null,
    p_ws_id                   in number,
    p_operation_id            in number,
    p_page_name               in varchar2 default 'form',
    p_group_name              in varchar2 default null,
    p_page_mode               in varchar2,
    p_user_interface_id       in number,
    --
    p_tab_set                 in varchar2 default null,
    p_tab_name                in varchar2 default null, -- current tab name
    p_tab_text                in varchar2 default null,
    --
    p_region_title            in varchar2 default null,
    p_region_template         in number default null,
    p_inputs_collection       in varchar2,
    p_outputs_collection      in varchar2,
    p_auth_collection         in varchar2,
    p_report_collection_name  in varchar2 default null
    );

procedure create_form_on_ws_rpt (
    p_flow_id                  in number   default null,
    p_page_id                  in number   default null,
    p_ws_id                    in number,
    p_operation_id             in number,
    p_page_name                in varchar2 default 'form',
    p_group_name               in varchar2 default null,
    p_page_mode                in varchar2,
    p_user_interface_id        in number,
    --
    p_tab_set                  in varchar2 default null,
    p_tab_name                 in varchar2 default null, -- current tab name
    p_tab_text                 in varchar2 default null,
    --
    p_nav_list_id              in number   default null,
    p_nav_list_item_id         in number   default null,
    p_nav_list_item_name       in varchar2 default null,
    p_nav_list_parent_item_id  in number   default null,
    p_nav_list_child_item_name in varchar2 default null,
    --
    p_result_node              in varchar2 default null,
    p_soap_style               in varchar2 default null,
    p_message_format           in varchar2 default null,
    p_namespace                in varchar2 default null,
    --
    p_region_title             in varchar2 default null,
    p_region_template          in number default null,
    p_region_title2            in varchar2 default null,
    p_region_template2         in number default null,
    p_report_template          in varchar2,
    p_inputs_collection        in varchar2,
    p_auth_collection          in varchar2,
    p_array_parm               in number,
    p_report_collection_name   in varchar2,
    p_array_parms_collection   in varchar2
    );


procedure create_form_and_list_view_page (
   p_flow_id                  in number   default null,
   p_form_page_id             in number   default null,
   p_report_page_id           in varchar2 default null,
   p_form_page_name           in varchar2 default 'form',
   p_report_page_name         in varchar2 default 'report',
   p_group_name               in varchar2 default null,
   p_form_page_mode           in varchar2 default null,
   p_report_page_mode         in varchar2 default null,
   p_user_interface_id        in number,
   p_use_ui_default           in varchar2 default 'Y',
   --
   p_table_owner              in varchar2 default null,
   p_table_name               in varchar2 default null,
   p_table_pk_column_name     in varchar2 default null,
   p_table_pk_src_type        in varchar2 default null,
   p_table_pk_src             in varchar2 default null,
   p_table_pk2_column_name    in varchar2 default null,
   p_table_pk2_src_type       in varchar2 default null,
   p_table_pk2_src            in varchar2 default null,
   p_table_rv_column_name     in varchar2 default null,
   p_display_column_list      in varchar2 default null,
   p_report_select_list       in varchar2 default null,
   p_where_clause             in varchar2 default null,
   p_pagination_size          in varchar2 default '10',
   --
   p_form_region_template     in number   default null,
   p_form_region_name         in varchar2 default null,
   p_form_insert              in varchar2 default 'Y',
   p_form_update              in varchar2 default 'Y',
   p_form_delete              in varchar2 default 'Y',
   --
   p_rpt_region_template      in number   default null,
   p_rpt_region_name          in varchar2 default null,
   p_rpt_text_column          in varchar2,
   p_rpt_enable_search        in boolean  default false,
   p_rpt_is_inset             in boolean  default false,
   p_rpt_page_items_to_submit in varchar2 default null,
   p_rpt_info_column          in varchar2 default null,
   p_rpt_counter_column       in varchar2 default null,
   p_rpt_list_divider         in varchar2 default null,
   --
   p_nav_list_id              in number   default null,
   p_nav_list_item_id         in number   default null,
   p_nav_list_item_name       in varchar2 default null,
   p_nav_list_parent_item_id  in number   default null,
   p_nav_list_child_item_name in varchar2 default null
);


procedure create_query_and_update_page (
    p_flow_id                  in number   default null,
    p_form_page_id             in number   default null,
    p_report_page_id           in varchar2 default null,
    p_form_page_name           in varchar2 default 'form',
    p_report_page_name         in varchar2 default 'report',
    p_group_name               in varchar2 default null,
    p_form_page_mode           in varchar2 default null,
    p_report_page_mode         in varchar2 default null,
    p_user_interface_id        in number,
    p_use_ui_default           in varchar2 default 'Y',
    --
    p_tab_set                  in varchar2 default null,
    p_tab_name                 in varchar2 default null, -- current tab name
    p_tab_text                 in varchar2 default null,
    --
    p_nav_list_id              in number   default null,
    p_nav_list_item_id         in number   default null,
    p_nav_list_item_name       in varchar2 default null,
    p_nav_list_parent_item_id  in number   default null,
    p_nav_list_child_item_name in varchar2 default null,
    --
    p_report_type              in varchar2 default null,
    --
    p_table_owner              in varchar2 default null,
    p_table_name               in varchar2 default null,
    p_table_pk_column_name     in varchar2 default null,
    p_table_pk_src_type        in varchar2 default null,
    p_table_pk_src             in varchar2 default null,
    p_table_pk2_column_name    in varchar2 default null,
    p_table_pk2_src_type       in varchar2 default null,
    p_table_pk2_src            in varchar2 default null,
    p_table_rv_column_name     in varchar2 default null,
    --
    p_display_column_list      in varchar2 default null,
    p_report_select_list       in varchar2 default null,
    --
    p_rpt_region_template      in number default null,
    p_rpt_template             in number default null,
    p_rpt_region_name          in varchar2 default null,
    p_form_region_template     in number default null,
    p_form_region_name         in varchar2 default null,
    --
    p_where_clause             in varchar2 default null,
    p_pagination_size          in varchar2 default '10',
    p_edit_link                in varchar2 default 'Edit',
    --
    p_form_insert              in varchar2 default 'Y',
    p_form_update              in varchar2 default 'Y',
    p_form_delete              in varchar2 default 'Y'
    );

procedure create_chart_page (
    p_flow_id                  in number   default null,
    p_flow_step_id             in number   default null,
    p_page_name                in varchar2 default null,
    p_user_interface_id        in number,
    p_chart_sql                in varchar2 default null,
    p_tab_set                  in varchar2 default null,
    p_tab_name                 in varchar2 default null, -- current tab name
    p_tab_text                 in varchar2 default null,
    p_scale                    in varchar2 default '400',
    p_axis                     in varchar2 default 'ZERO',
    p_num_mask                 in varchar2 default '999,999,999,990',
    p_plug_chart_show_summary  in varchar2 default null,
    p_region_template          in number   default null,
    p_region_name              in varchar2 default null,
    p_region_display_column    in varchar2 default null );

procedure create_report_page (
   p_flow_id                   in number   default null,
   p_page_id                   in number   default null,
   p_page_name                 in varchar2 default null,
   p_group_name                in varchar2 default null,
   p_page_mode                 in varchar2,
   p_user_interface_id         in number,
   p_report_sql                in varchar2 default null,
   --
   p_columns_colon_sep         in varchar2 default null,
   --
   p_location                  in varchar2 default null,
   p_web_src_module_id         in number   default null,
   p_remote_server_id          in number   default null,
   p_table_owner               in varchar2 default null,
   p_table_name                in varchar2 default null,
   p_include_rowid_column      in boolean  default false,
   --
   p_lookups                   in t_lookups default c_empty_lookup,
   --
   p_report_template           in varchar2 default null,
   p_tab_set                   in varchar2 default null,
   p_tab_name                  in varchar2 default null, -- current tab name
   p_tab_text                  in varchar2 default null,
   p_nav_list_id               in number   default null,
   p_nav_list_item_id          in number   default null,
   p_nav_list_item_name        in varchar2 default null,
   p_nav_list_parent_item_id   in number   default null,
   p_nav_list_child_item_name  in varchar2 default null,
   p_plug_template             in varchar2 default null,
   p_plug_name                 in varchar2 default null,
   p_plug_display_column       in varchar2 default null,
   p_max_rows                  in varchar2 default '15',
   p_report_type               in varchar2 default null,
   p_plug_query_options        in varchar2 default null,
   p_plug_query_max_columns    in varchar2 default null,
   p_plug_query_break_cols     in varchar2 default null,
   p_csv_output                in varchar2 default null,
   p_csv_link_text             in varchar2 default null,
   p_prn_output                in varchar2 default null,
   p_prn_format                in varchar2 default null,
   p_prn_label                 in varchar2 default null,
   p_column_heading_sort       in varchar2 default null,
   p_enable_search             in varchar2 default null,
   p_search_list               in varchar2 default null,
   p_use_ui_defaults           in varchar2 default null,
   p_web_src_param_collection  in varchar2 default null  );

procedure create_calendar_page (
   p_flow_id                    in number,
   p_page_id                    in number,
   p_page_name                  in varchar2,
   p_group_name                 in varchar2 default null,
   p_page_mode                  in varchar2,
   p_user_interface_id          in number,
   p_region_template            in number,
   p_region_name                in varchar2 default null,
   p_tab_set                    in varchar2 default null,
   p_tab_name                   in varchar2 default null, -- current tab name
   p_tab_text                   in varchar2 default null,
   --
   p_nav_list_id               in number   default null,
   p_nav_list_item_id          in number   default null,
   p_nav_list_item_name        in varchar2 default null,
   p_nav_list_parent_item_id   in number   default null,
   p_nav_list_child_item_name  in varchar2 default null,
   --
   p_owner                      in varchar2 default null,
   p_table                      in varchar2 default 'EMP',
   --
   p_sql                        in varchar2 default null,
   p_calendar_type              in varchar2 default apex_180100.wwv_flow_region_native.c_calendar,
   --
   p_date_column                in varchar2 default 'HIREDATE',
   p_end_date_column            in varchar2 default null,
   p_display_column             in varchar2 default null,
   p_display_type               in varchar2 default null,
   p_include_custom_cal         in varchar2 default null,
   p_primary_key_column         in varchar2 default null,
   p_drag_drop_required_role    in varchar2 default null,
   p_drag_drop_process_id       in number   default null,
   p_item_link_primary_key_item in varchar2 default null,
   p_item_link_date_item        in varchar2 default null,
   p_item_link_open_in          in varchar2 default null,
   p_include_time_with_date     in varchar2 default 'N',
   p_data_background_color      in varchar2 default null,
   p_data_text_color            in varchar2 default null,
   p_item_link                  in varchar2 default null,
   p_enable_drag_and_drop       in varchar2 default 'N',
   p_enable_monthly             in varchar2 default 'Y',
   p_enable_weekly              in varchar2 default 'Y',
   p_enable_daily               in varchar2 default 'Y',
   p_enable_agenda              in varchar2 default 'Y',
   p_add_create_button          in varchar2 default 'N',
   p_create_url                 in varchar2 default null,
   p_is_jqm_user_interface      in boolean  default false,
   p_button_region_id           in number   default null)
   ;

procedure create_report_query (
    p_flow_id             in number,
    p_report_query_name   in varchar2,
    p_report_layout_id    in number,
    p_source_queries      in wwv_flow_global.vc_arr2,
    p_output_format       in varchar2,
    p_format_item         in varchar2,
    p_file_name           in varchar2,
    p_xml_structure       in varchar2,
    p_items               in varchar2,
    p_content_disposition in varchar2 default null
);

procedure update_report_query_sql_stmts (
    p_flow_id             in number,
    p_report_query_id     in number,
    p_source_queries      in wwv_flow_global.vc_arr2
);

function generate_updatable_rpt_query (
   --
   -- arguments:
   --   p_select_columns       c1:c2:c3  (all columns in query)
   --   p_updatable_columns    c2:c3     (columns that are updateable)
   --   p_table_owner          SCOTT
   --   ...
   --
   p_select_columns     in varchar2 default null,
   p_updatable_columns  in varchar2 default null,
   p_where              in varchar2 default null,
   p_table_owner        in varchar2 default null,
   p_table_name         in varchar2 default null,
   p_table_pk1          in varchar2 default null,
   p_table_pk2          in varchar2 default null,
   p_table_pk3          in varchar2 default null,
   p_table_fk           in varchar2 default null,
   p_table_fk_src_type  in varchar2 default null,
   p_table_fk_src       in varchar2 default null,
   p_implement_type     in number   default null )
   return varchar2
   ;

procedure create_form_on_equijoin (
   p_flow_id                  in number,
   p_page_id                  in number,
   p_page_name                in varchar2,
   p_group_name               in varchar2 default null,
   p_page_mode                in varchar2,
   p_user_interface_id        in number,
   --
   p_tab_set                  in varchar2 default null,
   p_tab_name                 in varchar2 default null, -- current tab name
   p_tab_text                 in varchar2 default null,
   --
   p_nav_list_id              in number   default null,
   p_nav_list_item_id         in number   default null,
   p_nav_list_item_name       in varchar2 default null,
   p_nav_list_parent_item_id  in number   default null,
   p_nav_list_child_item_name in varchar2 default null,
   --
   p_region_title             in varchar2 default null,
   p_region_template          in number,
   p_statement                in varchar2,
   p_cancel_branch            in number,
   p_branch                   in number,
   p_cancel_button_name       in varchar2 default 'Cancel',
   p_create_button_name       in varchar2 default 'Create',
   p_save_button_name         in varchar2 default 'Save',
   p_delete_button_name       in varchar2 default 'Delete',
   p_use_ui_defaults          in varchar2 default null)
   ;

procedure create_wizard (
   p_flow_id                  in number,
   p_steps                    in number,
   p_user_interface_id        in number,
   p_page_mode                in varchar2,
   p_group_name               in varchar2 default null,
   --
   p_tab_type                 in varchar2 default null,
   p_tab_set                  in varchar2 default null,
   p_tab_name                 in varchar2 default null,
   p_tab_text                 in varchar2 default null,
   --
   p_nav_list_id              in number   default null,
   p_nav_list_item_id         in number   default null,
   p_nav_list_item_name       in varchar2 default null,
   p_nav_list_parent_item_id  in number   default null,
   p_nav_list_child_item_name in varchar2 default null,
   --
   p_region_template          in number,
   p_info_region              in varchar2 default null,
   p_info_region_template     in number   default null,
   p_info_default_text        in varchar2 default null,
   --
   p_cancel_branch            in number   default null,
   p_finish_branch            in number   default null,
   p_cancel_button_name       in varchar2 default 'Cancel',
   p_finish_button_name       in varchar2 default 'Finish',
   p_previous_button_name     in varchar2 default 'Previous',
   p_next_button_name         in varchar2 default 'Next')
   ;

procedure create_tree (
   p_flow_id                 in number,
   p_page_id                 in number,
   p_page_name               in varchar2,
   p_user_interface_id       in number,
   --
   p_tabset                  in varchar2 default null,
   p_tab_name                in varchar2 default null, -- current tab name
   p_tab_text                in varchar2 default null,
   --
   p_start_option            in varchar2,
   p_tree_name               in varchar2,
   p_tree_type               in varchar2,
   p_tree_template           in varchar2,
   p_tree_query              in varchar2,
   p_max_levels              in number,
   p_named_lov               in number default null,
   p_lov                     in varchar2 default null,
   p_sql                     in varchar2 default null,
   p_static                  in varchar2 default null,
   --
   p_region_title            in varchar2,
   p_region_template         in number,
   p_go_branch               in number,
   p_go_button_name          in varchar2 default 'GO',
   --
   p_tree_button_option      in varchar2 default null
   );

function generate_tree_query (
         p_flow_id     in number,
         p_owner       in varchar2,
         p_table_name  in varchar2,
         p_id          in varchar2,
         p_pid         in varchar2,
         p_name        in varchar2,
         p_link_option in varchar2,
         p_link_page_id in varchar2 default null,
         p_link_item    in varchar2 default null,
         p_where       in varchar2 default null,
         p_order_by    in varchar2 default null)
return varchar2;

procedure create_jstree (
   p_flow_id                 in number   default null,
   p_page_id                 in number   default null,
   p_page_name               in varchar2 default null,
   p_group_name              in varchar2 default null,
   p_page_mode               in varchar2,
   p_user_interface_id       in number,
   --
   p_tab_set                 in varchar2 default null,
   p_tab_name                in varchar2 default null,
   p_tab_text                in varchar2 default null,
   --
   p_nav_list_id              in number   default null,
   p_nav_list_item_id         in number   default null,
   p_nav_list_item_name       in varchar2 default null,
   p_nav_list_parent_item_id  in number   default null,
   p_nav_list_child_item_name in varchar2 default null,
   --
   p_region_template         in number   default null,
   p_region_name             in varchar2 default null,
   p_breadcrumb_id           in number   default null,
   p_breadcrumb_name         in varchar2 default null,
   p_parent_bc_id            in number   default null,
   --
   p_tree_query              in varchar2,                -- SQL query
   p_tree_button_option      in varchar2 default null,
   p_show_hints              in varchar2 default null,
   p_tree_hint_text          in varchar2 default null,
   p_tree_click_action       in varchar2 default null,
   p_selected_node           in varchar2 default null );

procedure create_jstree_region (
   p_flow_id                 in number   default null,
   p_page_id                 in number   default null,
   p_region_template         in number   default null,
   p_region_name             in varchar2 default null,
   p_parent_plug_id          in number   default null,
   p_display_seq             in number   default null,
   p_display_col             in number   default null,
   p_display_point           in varchar2 default null,
   p_display_cond            in varchar2 default null,
   p_display_cond2           in varchar2 default null,
   p_display_cond_type       in varchar2 default null,
   p_auth_scheme             in varchar2 default null,
   --
   p_tree_query              in varchar2,
   p_tree_button_option      in varchar2 default null,
   p_show_hints              in varchar2 default null,
   p_tree_hint_text          in varchar2 default null,
   p_tree_click_action       in varchar2 default null,
   p_selected_node           in varchar2 default null );

function generate_tree_region_query(
         p_flow_id      in number,
         p_owner        in varchar2,
         p_table_name   in varchar2,
         p_id           in varchar2,
         p_pid          in varchar2,
         p_name         in varchar2,
         p_start_item   in varchar2,
         p_start_value  in varchar2,
         p_link_option  in varchar2,
         p_link_page_id in varchar2 default null,
         p_link_item    in varchar2 default null,
         p_where        in varchar2 default null,
         p_order_by     in varchar2 default null,
         p_tooltip      in varchar2 default null,
         p_icon         in varchar2 default null
)
return varchar2;

procedure create_summary_page (
    p_flow_id                  in number   default null,
    p_page_id                  in number   default null,
    p_page_name                in varchar2 default 'Summary',
    p_group_name               in varchar2 default null,
    p_page_mode                in varchar2,
    p_user_interface_id        in number,
    --
    p_tab_set                  in varchar2 default null,
    p_tab_name                 in varchar2 default null, -- current tab name
    p_tab_text                 in varchar2 default null,
    --
    p_nav_list_id              in number   default null,
    p_nav_list_item_id         in number   default null,
    p_nav_list_item_name       in varchar2 default null,
    p_nav_list_parent_item_id  in number   default null,
    p_nav_list_child_item_name in varchar2 default null,
    --
    p_region_id                in number   default null,
    p_region_title             in varchar2 default null,
    p_region_template          in number   default null,
    --
    p_field_template           in number   default null,
    p_label_align              in varchar2 default null,
    p_tag_attr                 in varchar2 default null,
    p_field_align              in varchar2 default null
);

procedure create_home_page (
    p_flow_id                 in varchar2,
    p_page_id                 in varchar2 default 1,
    p_name                    in varchar2 default null,
    p_user_interface_id       in number,
    p_template                in number   default null);

procedure create_login_page (
    p_flow_id                 in varchar2,
    p_page_id                 in varchar2 default 101,
    p_name                    in varchar2 default null,
    p_user_interface_id       in number,
    p_template                in number   default null,
    p_username                in varchar2 default null,
    p_password                in varchar2 default null,
    p_save_username_cookie    in boolean  default true );

procedure create_svg_chart (
    p_flow_id           in number   default null,
    p_flow_step_id      in number   default null,
    p_page_name         in varchar2 default null,
    p_user_interface_id in number,
    p_tab_set           in varchar2 default null,
    p_tab_name          in varchar2 default null, -- current tab name
    p_tab_text          in varchar2 default null,
    p_region_template   in number   default null,
    p_region_name       in varchar2 default null,
    --
    p_chart_type        in varchar2 default null,
    p_chart_sql         in varchar2 default null,
    p_max_rows          in number   default null,
    p_no_data_found     in varchar2 default null,
    p_chart_color_theme in varchar2 default null
    );

procedure create_flash_chart5 (
   p_flow_id                  in number   default null,
   p_page_id                  in number   default null,
   p_page_name                in varchar2 default null,
   p_group_name               in varchar2 default null,
   p_page_mode                in varchar2,
   p_user_interface_id        in number,
   --
   p_tab_set                  in varchar2 default null,
   p_tab_name                 in varchar2 default null,
   p_tab_text                 in varchar2 default null,
   --
   p_nav_list_id              in number default null,
   p_nav_list_item_id         in number default null,
   p_nav_list_item_name       in varchar2 default null,
   p_nav_list_parent_item_id  in number default null,
   p_nav_list_child_item_name in varchar2 default null,
   --
   p_region_template          in number   default null,
   p_region_name              in varchar2 default null,
   --
   p_breadcrumb_id            in number   default null,
   p_breadcrumb_name          in varchar2 default null,
   p_parent_bc_id             in number   default null,
   --
   p_chart_query              in varchar2 default null,
   p_ajax_items_to_submit     in varchar2 default null,
   p_max_rows                 in number   default null,
   p_no_data_found            in varchar2 default null,
   --
   p_chart_rendering          in varchar2 default null,
   p_default_chart_type       in varchar2 default null,
   p_chart_title              in varchar2 default null,
   p_chart_animation          in varchar2 default null,
   p_enable_3d_mode           in varchar2 default null,
   --
   p_bgtype                   in varchar2 default null,
   p_bgcolor1                 in varchar2 default null,
   p_bgcolor2                 in varchar2 default null,
   p_gradient_rotation        in varchar2 default null,
   p_grid_bgtype              in varchar2 default null,
   p_grid_bgcolor1            in varchar2 default null,
   p_grid_bgcolor2            in varchar2 default null,
   p_grid_gradient_rotation   in varchar2 default null,
   p_color_scheme             in varchar2 default null,
   p_custom_colors            in varchar2 default null,
   p_map_undef_color_scheme   in varchar2 default null,
   p_map_undef_custom_colors  in varchar2 default null,
   --
   p_x_axis_title             in varchar2 default null,
   p_y_axis_title             in varchar2 default null,
   --
   p_map_source               in varchar2 default null,
   p_map_projection           in varchar2 default null,
   p_show_hints               in varchar2 default null,
   p_show_names               in varchar2 default null,
   p_show_values              in varchar2 default null,
   p_show_scrollbar           in varchar2 default null,
   p_show_legend              in varchar2 default null,
   p_show_grid                in varchar2 default null
   );

procedure create_flash_chart5_region (
    p_flow_id            in number   default null,
    p_page_id            in number   default null,
    p_region_template    in number   default null,
    p_region_name        in varchar2 default null,
    p_parent_plug_id     in number   default null,
    p_display_seq        in number   default null,
    p_display_col        in number   default null,
    p_display_point      in varchar2 default null,
    p_region_source_type in varchar2 default null,
    p_display_cond       in varchar2 default null,
    p_display_cond2      in varchar2 default null,
    p_display_cond_type  in varchar2 default null,
    p_auth_scheme        in varchar2 default null,
    --
    p_chart_rendering      in varchar2 default null,
    p_default_chart_type   in varchar2 default null,
    p_chart_title          in varchar2 default null,
    p_chart_query          in varchar2 default null,
    p_ajax_items_to_submit in varchar2 default null,
    p_chart_animation      in varchar2 default null,
    --
    p_bgtype             in varchar2 default null,
    p_bgcolor1           in varchar2 default null,
    p_bgcolor2           in varchar2 default null,
    p_gradient_rotation  in varchar2 default null,
    p_grid_bgtype        in varchar2 default null,
    p_grid_bgcolor1      in varchar2 default null,
    p_grid_bgcolor2      in varchar2 default null,
    p_grid_gradient_rotation  in varchar2 default null,
    p_color_scheme       in varchar2 default null,
    p_custom_colors      in varchar2 default null,
    p_map_undef_color_scheme in varchar2 default null,
    p_map_undef_custom_colors in varchar2 default null,
    --
    p_x_axis_title       in varchar2 default null,
    p_y_axis_title       in varchar2 default null,
    p_max_rows           in number   default null,
    p_no_data_found      in varchar2 default null,
    --
    p_map_source         in varchar2 default null,
    p_map_projection     in varchar2 default null,
    p_show_hints         in varchar2 default null,
    p_show_names         in varchar2 default null,
    p_show_values        in varchar2 default null,
    p_show_legend        in varchar2 default null,
    p_show_grid          in varchar2 default null,
    p_show_scrollbar     in varchar2 default null
    );

procedure create_jet_chart (
   p_flow_id                  in number   default null,
   p_page_id                  in number   default null,
   p_page_name                in varchar2 default null,
   p_page_mode                in varchar2,
   p_user_interface_id        in number,
   p_region_template          in number   default null,
   p_region_name              in varchar2 default null,
   --
   p_tab_set                  in varchar2 default null,
   p_tab_name                 in varchar2 default null,
   p_tab_text                 in varchar2 default null,
   --
   p_nav_list_id              in number default null,
   p_nav_list_item_id         in number default null,
   p_nav_list_item_name       in varchar2 default null,
   p_nav_list_parent_item_id  in number default null,
   p_nav_list_child_item_name in varchar2 default null,
   --
   p_breadcrumb_id            in number   default null,
   p_breadcrumb_name          in varchar2 default null,
   p_parent_bc_id             in number   default null,
   --
   p_sql                      in varchar2 default null,
   p_chart_type               in varchar2 default null,
   p_series_type              in varchar2 default null,
   p_max_row_count            in number   default null,
   p_no_data_found            in varchar2 default null,
   --
   p_location                 in varchar2 default null,
   p_query_type               in varchar2 default 'SQL_QUERY',
   p_web_src_module_id        in number   default null,
   p_remote_server_id         in number   default null,
   p_table_owner              in varchar2 default null,
   p_table_name               in varchar2 default null,
   p_where_clause             in varchar2 default null,
   p_order_by_clause          in varchar2 default null,
   p_optimizer_hint           in varchar2 default null,
   --
   p_columns                  in varchar2 default null,
   --
   p_series_name_column_name  in varchar2 default null,
   p_items_value_column_name  in varchar2 default null,
   p_items_low_column_name    in varchar2 default null,
   p_items_high_column_name   in varchar2 default null,
   p_items_open_column_name   in varchar2 default null,
   p_items_close_column_name  in varchar2 default null,
   p_items_volume_column_name in varchar2 default null,
   p_items_x_column_name      in varchar2 default null,
   p_items_y_column_name      in varchar2 default null,
   p_items_z_column_name      in varchar2 default null,
   p_items_target_value       in varchar2 default null,
   p_items_max_value          in varchar2 default null,
   p_group_name_column_name   in varchar2 default null,
   p_group_short_desc_column_name in varchar2 default null,
   p_items_label_column_name  in varchar2 default null,
   p_aggregate_function       in varchar2 default null,
   p_ajax_items_to_submit     in varchar2 default null,
   p_link_target              in varchar2 default null,
   p_link_target_type         in varchar2 default null,
   --
   p_gantt_start_date_column  in varchar2 default null,
   p_gantt_end_date_column    in varchar2 default null,
   p_gantt_row_id             in varchar2 default null,
   p_gantt_row_name           in varchar2 default null,
   p_gantt_task_id            in varchar2 default null,
   p_gantt_task_name          in varchar2 default null,
   p_gantt_task_start_date    in varchar2 default null,
   p_gantt_task_end_date      in varchar2 default null,
   --
   p_title                    in varchar2 default null,
   p_orientation              in varchar2 default null,
   p_stack                    in varchar2 default null,
   p_spark_chart              in varchar2 default null,
   p_color_scheme             in varchar2 default null,
   p_x_axis_title             in varchar2 default null,
   p_y_axis_title             in varchar2 default null,
   p_show_tooltip             in varchar2 default null,
   p_show_legend              in varchar2 default null
   );

procedure create_dynamic_query_region (
    p_id                            in number   default null,
    p_flow_id                       in number   default null,
    p_page_id                       in number   default null,
    p_migrate_from_region           in number   default null,
    p_plug_name                     in varchar2 default null,
    p_plug_template                 in varchar2 default null,
    p_parent_plug_id                in number   default null,
    p_plug_display_sequence         in varchar2 default null,
    p_plug_display_column           in varchar2 default null,
    p_plug_display_point            in varchar2 default null,
    p_plug_source                   in varchar2 default null,
    p_plug_source_type              in varchar2 default null,
    p_ajax_items_to_submit          in varchar2 default null,
    --
    p_plug_required_role            in varchar2 default null,
    p_plug_display_when_condition   in varchar2 default null,
    p_plug_display_when_cond2       in varchar2 default null,
    p_plug_display_condition_type   in varchar2 default null,
    p_plug_header                   in varchar2 default null,
    p_plug_footer                   in varchar2 default null,
    --
    p_plug_customized               in varchar2 default null,
    p_plug_customized_name          in varchar2 default null,
    --
    p_plug_query_num_rows           in number   default null,
    p_plug_query_show_nulls_as      in varchar2 default null,
    p_plug_query_no_data_found      in varchar2 default null,
    p_plug_query_row_count_max      in number   default null,
    --
    p_pagination_display_position   in varchar2 default null,
    --
    p_required_patch                in varchar2 default null,
    p_plug_comment                  in varchar2 default null,
    --
    p_show_detail_link              in varchar2 default null,
    p_use_ui_defaults               in varchar2 default null,
    p_base_pk1                      in varchar2 default null,
    p_base_pk2                      in varchar2 default null,
    p_base_pk3                      in varchar2 default null);

procedure create_ir_region_on_col_info (
    p_flow_id                 in number,
    p_page_id                 in number,
    p_region_id               in number,
    p_region_title            in varchar2 default null,
    p_sql                     in varchar2 default null,
    --
    p_show_detail_link        in varchar2 default null,
    p_detail_link             in varchar2 default null,
    p_detail_link_text        in varchar2 default null,
    --
    p_table_name              in varchar2 default null,
    p_pk1                     in varchar2 default null,
    p_pk2                     in varchar2 default null,
    --
    p_db_column_name          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_display_order           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_column_label            in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_report_label            in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_column_type             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_display_text_as         in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_format_mask             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_column_alignment        in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_help_text               in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_group                   in wwv_flow_global.vc_arr2 default empty_vc_arr);

procedure create_query_region (
    p_id                            in number   default null,
    p_flow_id                       in number   default null,
    p_page_id                       in number   default null,
    p_plug_name                     in varchar2 default null,
    p_plug_template                 in varchar2 default null,
    p_parent_plug_id                in number   default null,
    p_plug_display_sequence         in varchar2 default null,
    p_plug_display_column           in varchar2 default null,
    p_plug_display_point            in varchar2 default null,
    p_plug_source                   in varchar2 default null,
    p_plug_source_type              in varchar2 default null,
    p_ajax_items_to_submit          in varchar2 default null,
    p_plug_create_link_text         in varchar2 default null,
    p_plug_create_link_target       in varchar2 default null,
    p_plug_create_image             in varchar2 default null,
    p_plug_create_image_attributes  in varchar2 default null,
    p_plug_edit_link_text           in varchar2 default null,
    p_plug_edit_link_target         in varchar2 default null,
    p_plug_edit_image               in varchar2 default null,
    p_plug_edit_image_attributes    in varchar2 default null,
    p_plug_expand_link_text         in varchar2 default null,
    p_plug_expand_link_target       in varchar2 default null,
    p_plug_expand_image             in varchar2 default null,
    p_plug_expand_image_attributes  in varchar2 default null,
    p_plug_close_link_text          in varchar2 default null,
    p_plug_close_link_target        in varchar2 default null,
    p_plug_close_image              in varchar2 default null,
    p_plug_close_image_attributes   in varchar2 default null,
    p_plug_required_role            in varchar2 default null,
    p_plug_display_when_condition   in varchar2 default null,
    p_plug_display_when_cond2       in varchar2 default null,
    p_plug_display_condition_type   in varchar2 default null,
    p_plug_header                   in varchar2 default null,
    p_plug_footer                   in varchar2 default null,
    p_plug_override_reg_pos         in varchar2 default null,
    p_plug_customized               in varchar2 default null,
    p_plug_customized_name          in varchar2 default null,
    --
    p_plug_query_row_template       in number   default null,
    p_plug_query_headings           in varchar2 default null,
    p_plug_query_headings_type      in varchar2 default 'COLON_DELMITED_LIST',
    p_plug_query_num_rows           in number   default null,
    p_plug_query_options            in varchar2 default null,
    p_plug_query_format_out         in varchar2 default null, -- obsolte, msewtz 10/28/02
    p_plug_query_show_nulls_as      in varchar2 default null,
    p_plug_query_col_allignments    in varchar2 default null,
    p_plug_query_break_cols         in varchar2 default null,
    p_plug_query_sum_cols           in varchar2 default null,
    p_plug_query_number_formats     in varchar2 default null,
    p_plug_query_table_border       in varchar2 default null, -- obsolte, msewtz 10/28/02
    p_plug_column_width             in varchar2 default null,
    p_plug_query_no_data_found      in varchar2 default null,
    p_plug_query_more_data          in varchar2 default null,
    p_plug_ignore_pagination        in number   default null, -- obsolte, msewtz 10/28/02
    p_plug_query_num_rows_item      in varchar2 default null,
    p_plug_query_num_rows_type      in varchar2 default null,
    p_plug_query_row_count_max      in number   default wwv_flow_api.c_default_query_row_count_max,
    --
    p_pagination_display_position   in varchar2 default null,
    p_report_total_text_format      in varchar2 default null,
    p_break_column_text_format      in varchar2 default null,
    p_break_before_row              in varchar2 default null,
    p_break_generic_column          in varchar2 default null,
    p_break_after_row               in varchar2 default null,
    p_break_type_flag               in varchar2 default null,
    p_break_repeat_heading_format   in varchar2 default null,
    p_csv_output                    in varchar2 default null,
    p_csv_output_link_text          in varchar2 default null,
    --
    p_plug_url_text_begin           in varchar2 default null,
    p_plug_url_text_end             in varchar2 default null,
    p_java_entry_point              in varchar2 default null,
    --
    p_plug_caching                  in varchar2 default null,
    p_plug_caching_session_state    in varchar2 default null,
    p_plug_caching_max_age_in_sec   in varchar2 default null,
    --
    p_plug_chart_font_size          in varchar2 default null,
    p_plug_chart_max_rows           in varchar2 default null,
    p_plug_chart_num_mask           in varchar2 default null,
    p_plug_chart_scale              in varchar2 default null,
    p_plug_chart_axis               in varchar2 default null,
    p_plug_chart_show_summary       in varchar2 default null,
    --
    p_menu_template_id              in number   default null,
    --
    p_required_patch                in varchar2 default null,
    p_plug_comment                  in varchar2 default null,
    --
    p_id_offset                     in number   default 0,
    p_target                        in varchar2 default 'PRIME',
    p_prn_output                    in varchar2 default null,
    p_prn_format                    in varchar2 default null,
    p_prn_label                     in varchar2 default null,
    p_column_heading_sort           in varchar2 default null,
    p_enable_search                 in varchar2 default null,
    p_search_list                   in varchar2 default null,
    p_use_ui_defaults               in varchar2 default null
    );

procedure create_next_prev_pk_process (
    p_flow_id          in number,
    p_page_id          in number,
    p_page_mode        in varchar2 default apex_180100.wwv_flow_page.c_page_mode_normal,
    p_owner            in varchar2 default null,
    p_table            in varchar2 default null,
    p_nav_region       in varchar2 default null,
    p_pk_column        in varchar2 default null,
    p_pk_column2       in varchar2 default null,
    p_sort_column      in varchar2 default null,
    p_sort_column2     in varchar2 default null,
    p_item_pk          in varchar2 default null,
    p_item_pk2         in varchar2 default null,
    p_where            in varchar2 default null);


procedure create_master_detail (
    p_flow_id                   in number   default null,
    p_master_page_id            in number   default null,
    p_detail_page_id            in number   default null,
    p_detail2_page_id           in number   default null,
    p_group_name                in varchar2 default null,
    p_layout                    in varchar2 default '2_PAGE',
    p_user_interface_id         in number,
    p_use_ui_default            in varchar2 default 'Y',
    --
    p_master_page_title         in varchar2 default null,
    p_detail_page_title         in varchar2 default null,
    p_detail2_page_title        in varchar2 default null,
    p_master_region_title       in varchar2 default null,
    p_detail_region_title       in varchar2 default null,
    p_detail_region_title2      in varchar2 default null,
    p_detail2_region_title      in varchar2 default null,
    --
    p_master_page_mode          in varchar2 default null,
    p_detail_page_mode          in varchar2 default null,
    p_detail2_page_mode         in varchar2 default null,
    --
    p_tab_set                   in varchar2 default null,
    p_tab_name                  in varchar2 default null,
    p_tab_text                  in varchar2 default null,
    --
    p_nav_list_id               in number   default null,
    p_nav_list_item_id          in number   default null,
    p_nav_list_item_name        in varchar2 default null,
    p_nav_list_parent_item_id   in number   default null,
    p_nav_list_child_item_name  in varchar2 default null,
    --
    p_master_table_owner        in varchar2 default null,
    p_master_table_name         in varchar2 default null,
    p_master_sort_column        in varchar2 default null,
    p_master_sort_column2       in varchar2 default null,
    p_include_master_report     in varchar2 default 'Y',
    p_include_master_row_nav    in varchar2 default 'Y',
    --
    p_master_table_pk1          in varchar2 default null,
    p_master_table_pk1_src_type in varchar2 default null,
    p_master_table_pk1_src      in varchar2 default null,
    p_master_table_pk2          in varchar2 default null,
    p_master_table_pk2_src_type in varchar2 default null,
    p_master_table_pk2_src      in varchar2 default null,
    --
    p_detail_table_owner        in varchar2 default null,
    p_detail_table_name         in varchar2 default null,
    p_detail_table_pk1          in varchar2 default null,
    p_detail_table_pk1_src_type in varchar2 default null,
    p_detail_table_pk1_src      in varchar2 default null,
    p_detail_table_pk2          in varchar2 default null,
    p_detail_table_pk2_src_type in varchar2 default null,
    p_detail_table_pk2_src      in varchar2 default null,
    --
    p_breadcrumb_id              in number   default null,
    p_parent_breadcrumb_entry_id in number   default null,
    p_breadcrumb_name1           in varchar2 default null,
    p_breadcrumb_name2           in varchar2 default null,
    p_breadcrumb_name3           in varchar2 default null

    );

procedure update_js_code_w_shortcut (
    p_flow_id             in number,
    p_page_id             in number,
    p_shortcut_name       in varchar2,
    p_add_javascript_code in varchar2
    );

function create_acl_tab_priv (
    p_flow_id in number) return boolean;

procedure create_access_control (
    p_flow_id                  in number   default null,
    p_page_id                  in number   default null,
    p_page_name                in varchar2 default null,
    p_page_mode                in varchar2,
    p_user_interface_id        in number,
    --
    p_tab_set                  in varchar2 default null,
    p_tab_name                 in varchar2 default null, -- current tab name
    p_tab_text                 in varchar2 default null,
    --
    p_nav_list_id              in number   default null,
    p_nav_list_item_id         in number   default null,
    p_nav_list_item_name       in varchar2 default null,
    p_nav_list_parent_item_id  in number   default null,
    p_nav_list_child_item_name in varchar2 default null,
    --
    p_group_name               in varchar2 default null
    );

procedure create_dynamic_query (
    p_flow_id                   in number   default null,
    p_page_id                   in number   default null,
    p_page_name                 in varchar2 default null,
    p_group_name                in varchar2 default null,
    p_page_mode                 in varchar2,
    p_user_interface_id         in number,
    p_region_name               in varchar2 default null,
    p_region_template           in varchar2 default null,
    p_tab_set                   in varchar2 default null,
    p_tab_name                  in varchar2 default null,
    p_tab_text                  in varchar2 default null,
    --
    p_nav_list_id               in number   default null,
    p_nav_list_item_id          in number   default null,
    p_nav_list_item_name        in varchar2 default null,
    p_nav_list_parent_item_id   in number   default null,
    p_nav_list_child_item_name  in varchar2 default null,
    --
    p_breadcrumb_id             in number   default null,
    p_breadcrumb_name           in varchar2 default null,
    p_parent_bc_id              in  number  default null,
    --
    p_query                     in varchar2 default null,
    p_show_detail_link          in varchar2 default null,
    p_use_ui_defaults           in varchar2 default null,
    p_base_pk1                  in varchar2 default null,
    p_base_pk2                  in varchar2 default null,
    p_base_pk3                  in varchar2 default null
    );

procedure create_ir_page(
    p_flow_id                   in number   default null,
    p_page_id                   in number   default null,
    p_page_name                 in varchar2 default null,
    p_group_name                in varchar2 default null,
    p_page_mode                 in varchar2,
    p_user_interface_id         in number,
    p_region_name               in varchar2 default null,
    p_region_template           in varchar2 default null,
    p_tab_set                   in varchar2 default null,
    p_tab_name                  in varchar2 default null,
    p_tab_text                  in varchar2 default null,
    --
    p_nav_list_id               in number   default null,
    p_nav_list_item_id          in number   default null,
    p_nav_list_item_name        in varchar2 default null,
    p_nav_list_parent_item_id   in number   default null,
    p_nav_list_child_item_name  in varchar2 default null,
    --
    p_breadcrumb_id             in number   default null,
    p_breadcrumb_name           in varchar2 default null,
    p_parent_bc_id              in number   default null,
    --
    p_query_type                in varchar2,
    p_location                  in varchar2 default 'LOCAL',
    p_remote_server_id          in number   default null,
    p_web_src_module_id         in number   default null,
    p_table_owner               in varchar2 default null,
    p_table_name                in varchar2 default null,
    p_sql_source                in varchar2 default null,
    p_where_clause              in varchar2 default null,
    p_order_by_clause           in varchar2 default null,
    p_include_rowid_column      in boolean  default false,
    p_optimizer_hint            in varchar2 default null,
    --
    p_columns                   in varchar2 default null,
    p_lookups                   in t_lookups default c_empty_lookup,
    --
    p_show_detail_link          in varchar2 default null,
    p_use_ui_defaults           in varchar2 default null,
    p_base_pk1                  in varchar2 default null,
    p_base_pk2                  in varchar2 default null,
    p_base_pk3                  in varchar2 default null,
    p_web_src_param_collection  in varchar2 default null );


procedure create_report_on_ws (
    p_flow_id                  in number   default null,
    p_page_id                  in number   default null,
    p_page_name                in varchar2 default null,
    p_group_name               in varchar2 default null,
    p_page_mode                in varchar2,
    p_user_interface_id        in number,
    p_region_name              in varchar2 default null,
    p_region_template          in varchar2 default null,
    --
    p_tab_set                  in varchar2 default null,
    p_tab_name                 in varchar2 default null,
    p_tab_text                 in varchar2 default null,
    --
    p_nav_list_id              in number   default null,
    p_nav_list_item_id         in number   default null,
    p_nav_list_item_name       in varchar2 default null,
    p_nav_list_parent_item_id  in number   default null,
    p_nav_list_child_item_name in varchar2 default null,
    --
    p_report_template          in varchar2 default null,
    p_rows_per_page            in varchar2 default null,
    --
    p_breadcrumb_id            in number   default null,
    p_breadcrumb_name          in varchar2 default null,
    p_parent_bc_id             in  number  default null,
    --
    p_query                    in varchar2 default null
    );

procedure create_page_dynamic_action (
    p_flow_id                       in number,
    p_page_id                       in number,
    p_event_name                    in varchar2,
    p_event_sequence                in number,
    p_event_triggering_elem_type    in varchar2 default null,
    p_event_triggering_region_id    in number   default null,
    p_event_triggering_button_id    in number   default null,
    p_event_triggering_element      in varchar2 default null,
    p_event_condition_element       in varchar2 default null,
    p_event_triggering_cond_type    in varchar2 default null,
    p_event_triggering_expression   in varchar2 default null,
    p_event_bind_type               in varchar2,
    p_event_bind_delegate_to        in varchar2 default null,
    p_event_bind_event_type         in varchar2,
    p_event_bind_event_type_custom  in varchar2 default null,
    p_event_display_when_type       in varchar2 default null,
    p_event_display_when_cond       in varchar2 default null,
    p_event_display_when_cond2      in varchar2 default null,
    p_event_required_patch          in varchar2 default null,
    p_event_security_scheme         in varchar2 default null,
    p_event_comment                 in varchar2 default null,
    -- true action
    p_action_true_id                in number   default null,
    p_action_true_action_sequence   in number,
    p_action_true_exec_on_init      in varchar2,
    p_action_true_stop_exec_error   in varchar2 default 'Y',
    p_action_true_wait_for_result   in varchar2 default null,
    p_action_true_action            in varchar2,
    p_action_true_aff_elems_type    in varchar2,
    p_action_true_aff_region_id     in number   default null,
    p_action_true_aff_button_id     in number   default null,
    p_action_true_aff_elements      in varchar2 default null,
    p_action_true_attribute_01      in varchar2 default null,
    p_action_true_attribute_02      in varchar2 default null,
    p_action_true_attribute_03      in varchar2 default null,
    p_action_true_attribute_04      in varchar2 default null,
    p_action_true_attribute_05      in varchar2 default null,
    p_action_true_attribute_06      in varchar2 default null,
    p_action_true_attribute_07      in varchar2 default null,
    p_action_true_attribute_08      in varchar2 default null,
    p_action_true_attribute_09      in varchar2 default null,
    p_action_true_attribute_10      in varchar2 default null,
    p_action_true_attribute_11      in varchar2 default null,
    p_action_true_attribute_12      in varchar2 default null,
    p_action_true_attribute_13      in varchar2 default null,
    p_action_true_attribute_14      in varchar2 default null,
    p_action_true_attribute_15      in varchar2 default null,
    p_action_true_comment           in varchar2 default null,
    -- false action (not always required)
    p_action_false_id               in number   default null,
    p_action_false_action_sequence  in number   default null,
    p_action_false_exec_on_init     in varchar2 default null,
    p_action_false_stop_exec_error  in varchar2 default 'Y',
    p_action_false_wait_for_result  in varchar2 default null,
    p_action_false_action           in varchar2 default null,
    p_action_false_aff_elems_type   in varchar2 default null,
    p_action_false_aff_region_id    in number   default null,
    p_action_false_aff_button_id    in number   default null,
    p_action_false_aff_elements     in varchar2 default null,
    p_action_false_attribute_01     in varchar2 default null,
    p_action_false_attribute_02     in varchar2 default null,
    p_action_false_attribute_03     in varchar2 default null,
    p_action_false_attribute_04     in varchar2 default null,
    p_action_false_attribute_05     in varchar2 default null,
    p_action_false_attribute_06     in varchar2 default null,
    p_action_false_attribute_07     in varchar2 default null,
    p_action_false_attribute_08     in varchar2 default null,
    p_action_false_attribute_09     in varchar2 default null,
    p_action_false_attribute_10     in varchar2 default null,
    p_action_false_attribute_11     in varchar2 default null,
    p_action_false_attribute_12     in varchar2 default null,
    p_action_false_attribute_13     in varchar2 default null,
    p_action_false_attribute_14     in varchar2 default null,
    p_action_false_attribute_15     in varchar2 default null,
    p_action_false_comment          in varchar2 default null )
    ;


--==============================================================================
-- Creates page buttons, both item and region based
--==============================================================================
procedure create_button (
    p_where                         varchar2,
    p_flow_id                       number,
    p_flow_step_id                  number,
    p_button_sequence               number      default null,
    p_button_plug_id                number,
    p_button_name                   varchar2,
    p_button_template_id            number      default null,
    p_button_image                  varchar2    default null,
    p_button_is_hot                 varchar2    default 'N',
    p_button_image_alt              varchar2,
    p_button_redirect_url           varchar2    default null,
    p_button_action                 varchar2    default apex_180100.wwv_flow_button.c_action_submit,
    p_button_execute_validations    varchar2    default 'Y',
    p_button_image_attributes       varchar2    default null,
    p_button_attributes             varchar2,
    p_button_style                  varchar2    default 'BUTTON_TEMPLATE',
    -- REPORT action only parameter
    p_report_query                  varchar2    default null,
    -- region button only parameters
    p_button_position               varchar2    default null,
    p_button_alignment              varchar2    default null,
    -- item button only parameters
    p_begins_on_new_line            varchar2    default null,
    p_begins_on_new_field           varchar2    default null,
    -- condition only parameters
    p_button_condition_type         varchar2    default null,
    p_button_condition              varchar2    default null,
    p_button_condition2             varchar2    default null )
    ;


--==============================================================================
-- Returns true if the specified region or one of its sub region has a button
--==============================================================================
function has_region_buttons (
    p_region_id         in number,
    p_flow_id           in number,
    p_page_id           in number,
    p_security_group_id in number )
    return boolean;

--==============================================================================
-- Returns true if the specified region or one of its sub region has an item
--==============================================================================
function has_region_items (
    p_region_id         in number,
    p_flow_id           in number,
    p_page_id           in number,
    p_security_group_id in number )
    return boolean;

--==============================================================================
-- Returns true if the specified region or one of its sub region has a validation.
--==============================================================================
function has_region_validations (
    p_region_id         in number,
    p_flow_id           in number,
    p_page_id           in number,
    p_security_group_id in number )
    return boolean;

--==============================================================================
-- Returns true if the specified region or one of its sub region has a process.
--==============================================================================
function has_region_processes (
    p_region_id         in number,
    p_flow_id           in number,
    p_page_id           in number,
    p_security_group_id in number )
    return boolean;

--==============================================================================
-- Returns true if the specified region has sub regions
--==============================================================================
function has_region_sub_regions (
    p_region_id         in number,
    p_flow_id           in number,
    p_page_id           in number,
    p_security_group_id in number )
    return boolean;

--==============================================================================
-- Returns true if the specified region or one of its sub region has a list
-- which is just used once in the application.
--==============================================================================
function has_region_deletable_lists (
    p_region_id         in number,
    p_flow_id           in number,
    p_page_id           in number,
    p_security_group_id in number )
    return boolean;

--==============================================================================
-- Returns true if the specified region or one of its sub regions has dynamic
-- actions
--==============================================================================
function has_region_dynamic_actions (
    p_region_id         in number,
    p_flow_id           in number,
    p_page_id           in number,
    p_security_group_id in number )
    return boolean;

--==============================================================================
-- Deletes a region and depending on the flags sub regions, buttons, items, ...
-- which belong to the region. If the flags are false then the region relation
-- is set to null in the effected components.
--==============================================================================
procedure delete_region (
    p_region_id          in number,
    p_flow_id            in number,
    p_page_id            in number,
    p_security_group_id  in number,
    p_delete_buttons     in boolean,
    p_delete_items       in boolean,
    p_delete_sub_regions in boolean,
    p_delete_lists       in boolean,
    p_delete_dyn_actions in boolean );

--===============================================================================
-- Creates 4 pages for the data upload wizard
--===============================================================================
procedure create_data_load_wizard(
    p_flow_id                  in number,
    --
    p_name                     in varchar2,
    p_owner                    in varchar2,
    p_table_name               in varchar2,
    p_exists                   in varchar2 default 'no',
    p_page_mode                in varchar2,
    p_group_name               in varchar2 default null,
    --
    p_user_interface_id        in number,
    --
    p_tab_set                  in varchar2,
    p_tab_name                 in varchar2,
    p_tab_label                in varchar2,
    --
    p_nav_list_id              in number   default null,
    p_nav_list_item_id         in number   default null,
    p_nav_list_item_name       in varchar2 default null,
    p_nav_list_parent_item_id  in number   default null,
    p_nav_list_child_item_name in varchar2 default null,
    --
    p_breadcrumb_id            in number,
    p_breadcrumb_name          in varchar2,
    p_parent_breadcrumb_id     in number,
    --
    p_page_step_1              in number,
    p_page_step_2              in number,
    p_page_step_3              in number,
    p_page_step_4              in number,
    --
    p_page_label_step_1        in varchar2,
    p_page_label_step_2        in varchar2,
    p_page_label_step_3        in varchar2,
    p_page_label_step_4        in varchar2,
    --
    p_region_name_step_1       in varchar2,
    p_region_name_step_2       in varchar2,
    p_region_name_step_3       in varchar2,
    p_region_name_step_4       in varchar2,
    --
    p_page_next_label          in varchar2 default 'NEXT',
    p_page_previous_label      in varchar2 default 'PREVIOUS',
    p_page_cancel_label        in varchar2 default 'CANCEL',
    p_page_cancel_branch       in varchar2 default '1',
    p_page_finish_label        in varchar2 default 'SUBMIT',
    p_page_finish_branch       in varchar2 default '1' );

--===============================================================================
-- Creates a page and a region based on a plug-in.
--===============================================================================
procedure create_region_plugin_page (
    p_flow_id                  in number,
    --
    p_page_id                  in number,
    p_page_name                in varchar2,
    p_group_name               in varchar2                       default null,
    p_page_mode                in varchar2,
    p_user_interface_id        in number,
    --
    p_tab_set                  in varchar2,
    p_tab_name                 in varchar2,
    p_tab_label                in varchar2,
    --
    p_nav_list_id              in number                         default null,
    p_nav_list_item_id         in number                         default null,
    p_nav_list_item_name       in varchar2                       default null,
    p_nav_list_parent_item_id  in number                         default null,
    p_nav_list_child_item_name in varchar2                       default null,
    --
    p_breadcrumb_id            in number,
    p_breadcrumb_name          in varchar2,
    p_parent_breadcrumb_id     in number,
    --
    p_region_name              in varchar2,
    p_region_type              in varchar2,
    --
    p_location                 in apex_180100.wwv_flow_exec_api.t_location   default apex_180100.wwv_flow_exec_api.c_location_local_db,
    p_source_type              in apex_180100.wwv_flow_exec_api.t_query_type default apex_180100.wwv_flow_exec_api.c_query_type_sql_query,
    p_remote_server_id         in number                         default null,
    p_table_owner              in varchar2                       default null,
    p_table_name               in varchar2                       default null,
    p_region_source            in varchar2                       default null,
    p_column_names             in varchar2                       default null,
    p_web_src_module_id        in number                         default null,
    --
    p_attribute_01             in varchar2                       default null,
    p_attribute_02             in varchar2                       default null,
    p_attribute_03             in varchar2                       default null,
    p_attribute_04             in varchar2                       default null,
    p_attribute_05             in varchar2                       default null,
    p_attribute_06             in varchar2                       default null,
    p_attribute_07             in varchar2                       default null,
    p_attribute_08             in varchar2                       default null,
    p_attribute_09             in varchar2                       default null,
    p_attribute_10             in varchar2                       default null,
    p_attribute_11             in varchar2                       default null,
    p_attribute_12             in varchar2                       default null,
    p_attribute_13             in varchar2                       default null,
    p_attribute_14             in varchar2                       default null,
    p_attribute_15             in varchar2                       default null,
    p_attribute_16             in varchar2                       default null,
    p_attribute_17             in varchar2                       default null,
    p_attribute_18             in varchar2                       default null,
    p_attribute_19             in varchar2                       default null,
    p_attribute_20             in varchar2                       default null,
    p_attribute_21             in varchar2                       default null,
    p_attribute_22             in varchar2                       default null,
    p_attribute_23             in varchar2                       default null,
    p_attribute_24             in varchar2                       default null,
    p_attribute_25             in varchar2                       default null );

--===============================================================================
-- Creates a region based on a plug-in.
--===============================================================================
procedure create_region_plugin (
    p_id                          in number                         default null,
    p_application_id              in number,
    p_page_id                     in number,
    p_title                       in varchar2,
    p_parent_region_id            in number                         default null,
    p_display_point               in varchar2                       default 'BODY',
    p_display_sequence            in number                         default 10,
    p_template_id                 in number                         default null,
    p_region_template_options     in varchar2                       default null,
    p_component_template_options  in varchar2                       default null,
    p_type                        in varchar2,
    --
    p_location                    in apex_180100.wwv_flow_exec_api.t_location   default apex_180100.wwv_flow_exec_api.c_location_local_db,
    p_source_type                 in apex_180100.wwv_flow_exec_api.t_query_type default apex_180100.wwv_flow_exec_api.c_query_type_sql_query,
    p_remote_server_id            in number                         default null,
    p_table_owner                 in varchar2                       default null,
    p_table_name                  in varchar2                       default null,
    p_source                      in varchar2                       default null,
    p_column_names                in varchar2                       default null,
    p_web_src_module_id           in number                         default null,
    --
    p_ajax_items_to_submit        in varchar2                       default null,
    p_attribute_01                in varchar2                       default null,
    p_attribute_02                in varchar2                       default null,
    p_attribute_03                in varchar2                       default null,
    p_attribute_04                in varchar2                       default null,
    p_attribute_05                in varchar2                       default null,
    p_attribute_06                in varchar2                       default null,
    p_attribute_07                in varchar2                       default null,
    p_attribute_08                in varchar2                       default null,
    p_attribute_09                in varchar2                       default null,
    p_attribute_10                in varchar2                       default null,
    p_attribute_11                in varchar2                       default null,
    p_attribute_12                in varchar2                       default null,
    p_attribute_13                in varchar2                       default null,
    p_attribute_14                in varchar2                       default null,
    p_attribute_15                in varchar2                       default null,
    p_attribute_16                in varchar2                       default null,
    p_attribute_17                in varchar2                       default null,
    p_attribute_18                in varchar2                       default null,
    p_attribute_19                in varchar2                       default null,
    p_attribute_20                in varchar2                       default null,
    p_attribute_21                in varchar2                       default null,
    p_attribute_22                in varchar2                       default null,
    p_attribute_23                in varchar2                       default null,
    p_attribute_24                in varchar2                       default null,
    p_attribute_25                in varchar2                       default null,
    p_condition_type              in varchar2                       default null,
    p_condition_expr              in varchar2                       default null,
    p_condition_expr2             in varchar2                       default null );

--===============================================================================
-- Creates region columns for a region where the type uses region columns.
--===============================================================================
procedure create_region_columns (
    p_application_id        in number,
    p_page_id               in number,
    p_region_id             in number,
    p_region_type           in varchar2,
    --
    p_location              in apex_180100.wwv_flow_exec_api.t_location   default apex_180100.wwv_flow_exec_api.c_location_local_db,
    p_source_type           in apex_180100.wwv_flow_exec_api.t_query_type default apex_180100.wwv_flow_exec_api.c_query_type_sql_query,
    p_remote_server_id      in number                         default null,
    p_table_owner           in varchar2                       default null,
    p_table_name            in varchar2                       default null,
    p_region_sql            in varchar2                       default null,
    p_column_names          in varchar2                       default null,
    p_web_src_module_id     in number                         default null );

procedure create_named_lov (
    p_id      in out number,
    p_flow_id in     number,
    p_name    in     varchar2,
    p_query   in     varchar2 );

procedure create_breadcrumb_region (
    p_application_id             in number,
    p_page_id                    in number,
    p_seq                        in number,
    p_breadcrumb_id              in number,
    p_breadcrumb_entry_id        in number default null,
    p_breadcrumb_entry_name      in varchar2,
    p_parent_breadcrumb_entry_id in number );

procedure create_jqm_list_view_region (
    p_id                     in number   default null,
    p_flow_id                in number,
    p_page_id                in number,
    p_name                   in varchar2,
    p_seq                    in number,
    p_template_id            in number,
    p_display_point          in varchar2 default 'BODY',
    --
    p_sql_statement          in varchar2,
    p_page_items_to_submit   in varchar2 default null,
    p_text_column            in varchar2,
    p_supplement_info_column in varchar2 default null,
    p_counter_column         in varchar2 default null,
    p_list_divider           in varchar2 default null,
    p_link_target            in varchar2 default null,
    p_enable_search          in boolean  default false,
    p_is_inset               in boolean  default false );

procedure copy_named_lov (
    p_lov_id_from         in number,
    p_lov_name_to         in varchar2,
    p_copy_from_flow_id   in number default null,
    p_flow_id             in number default null,
    p_lov_id_to           in number default null);

procedure copy_button (
    p_button_id_from         in number,
    p_button_name_to         in varchar2,
    p_button_text_to         in varchar2,
    p_button_page_id_to      in number default null,
    p_button_region_to       in number default null,
    p_button_sequence_to     in number default null);

procedure copy_page_item (
    p_copy_from_item_id     in number,
    p_copy_to_item_name     in varchar2,
    p_copy_to_item_sequence in varchar2,
    p_copy_to_page_id       in number default null,
    p_copy_to_item_plug     in varchar2 default null,
    p_copy_to_prompt        in varchar2 default null,
    p_copy_to_source_type   in varchar2 default null,
    p_copy_to_source        in varchar2 default null);

function get_header_toolbar_region_id (
   p_application_id         in number,
   p_user_interface_id      in number )
   return number;

function get_footer_toolbar_region_id (
   p_application_id         in number,
   p_user_interface_id      in number )
   return number;

function get_footer_default_template_id (
    p_flow_id                   in number,
    p_user_interface_id         in number )
    return number;

function get_header_default_template_id (
    p_flow_id                   in number,
    p_user_interface_id         in number )
    return number;

procedure create_user_interface (
    p_flow_id         in number,
    p_ui_type_name    in varchar2,
    p_display_name    in varchar2,
    p_display_seq     in number,
    p_use_auto_detect in varchar2,
    p_is_default      in varchar2,
    p_theme_id        in number,
    p_home_url        in varchar2,
    p_login_url       in varchar2,
    p_global_page_id  in number
);

procedure create_tab (
     p_flow_id       in number,
     p_page_id       in number,
     p_tab_set       in varchar2,
     p_tab_name      in varchar2 default null,
     p_tab_text      in varchar2 default null,
     p_tab_also_current_for_pages in varchar2 default null);

procedure create_navigation_list_item (
    p_flow_id                  in number,
    p_page_id                  in number,
    p_page_name                in varchar2,
    p_nav_list_id              in number,
    p_nav_list_item_id         in number default null,
    p_nav_list_item_name       in varchar2 default null,
    p_nav_list_parent_item_id  in number default null,
    p_nav_list_child_item_name in varchar2 default null,
    p_nav_list_item_icon       in varchar2 default null );

--==============================================================================
procedure create_list (
    p_flow_id                  in number,
    p_page_id                  in number,
    p_name                     in varchar2,
    p_entry_name_01            in varchar2,
    p_page_01                  in varchar2,
    p_entry_name_02            in varchar2,
    p_page_02                  in varchar2,
    p_entry_name_03            in varchar2,
    p_page_03                  in varchar2,
    p_entry_name_04            in varchar2,
    p_page_04                  in varchar2,
    p_entry_name_05            in varchar2,
    p_page_05                  in varchar2,
    p_deploy                   in varchar2, -- CURRENT_PAGE or EACH_ENTRY
    p_region_template          in varchar2,
    p_list_template_id         in varchar2,
    p_region_position          in varchar2,
    p_required_patch           in varchar2 );

procedure create_ig_region (
    p_id                   in number default null,
    p_application_id       in number,
    p_page_id              in number,
    p_title                in varchar2,
    p_display_sequence     in number default 10,
    p_sql                  in varchar2 default null,
    p_is_editable          in boolean default false,
    p_save_when_button_id  in number   default null,
    p_toolbar_buttons      in varchar2 default 'RESET:SAVE',
    p_pk_column            in varchar2 default null,
    p_pk2_column           in varchar2 default null,
    p_fk_columns           in varchar2 default null,
    p_link                 in varchar2 default null,
    p_ajax_items_to_submit in varchar2 default null );

procedure create_ig_page (
    p_application_id            in number,
    p_page_id                   in number,
    p_page_name                 in varchar2 default null,
    p_page_mode                 in varchar2,
    p_user_interface_id         in number,
    p_tab_set                   in varchar2 default null,
    p_tab_name                  in varchar2 default null,
    p_tab_text                  in varchar2 default null,
    --
    p_nav_list_id               in number   default null,
    p_nav_list_item_id          in number   default null,
    p_nav_list_item_name        in varchar2 default null,
    p_nav_list_parent_item_id   in number   default null,
    p_nav_list_child_item_name  in varchar2 default null,
    --
    p_breadcrumb_id             in number   default null,
    p_breadcrumb_name           in varchar2 default null,
    p_parent_bc_id              in  number  default null,
    --
    p_sql                       in varchar2,
    p_is_editable               in boolean  default false,
    p_pk_column                 in varchar2 default null,
    p_pk2_column                in varchar2 default null,
    p_link                      in varchar2 default null );

procedure create_md_single_page (
    p_application_id            in number,
    p_page_id                   in number,
    p_page_name                 in varchar2 default null,
    p_page_mode                 in varchar2,
    p_user_interface_id         in number,
    p_tab_set                   in varchar2 default null,
    p_tab_name                  in varchar2 default null,
    p_tab_text                  in varchar2 default null,
    --
    p_nav_list_id               in number   default null,
    p_nav_list_item_id          in number   default null,
    p_nav_list_item_name        in varchar2 default null,
    p_nav_list_parent_item_id   in number   default null,
    p_nav_list_child_item_name  in varchar2 default null,
    --
    p_breadcrumb_id             in number   default null,
    p_breadcrumb_name           in varchar2 default null,
    p_parent_bc_id              in number   default null,
    --
    p_master_region             in t_md,
    p_detail_region             in t_md );

procedure create_md_two_page (
    p_application_id            in number,
    p_user_interface_id         in number,
    p_tab_set                   in varchar2 default null,
    p_tab_name                  in varchar2 default null,
    p_tab_text                  in varchar2 default null,
    --
    p_nav_list_id               in number   default null,
    p_nav_list_item_id          in number   default null,
    p_nav_list_item_name        in varchar2 default null,
    p_nav_list_parent_item_id   in number   default null,
    p_nav_list_child_item_name  in varchar2 default null,
    --
    p_breadcrumb_id             in number   default null,
    p_parent_bc_id              in number   default null,
    --
    p_master                    in t_md,
    p_detail                    in t_md );

end my_flow_wizard_api;