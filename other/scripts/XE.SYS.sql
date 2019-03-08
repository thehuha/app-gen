select * 
from apex_application_page_proc
where application_id = 4500
  and page_id = 1003
  order by process_point, execution_sequence;
  
select * 
from apex_application_page_da_acts
where application_id = 4500
  and page_id = 1003  
  
  grant resource to hr
  
  
select s.remote_addr
      ,d.flow_id app_id
      ,i.display_sequence seq
      ,d.item_name, d.item_value_vc2 item_value
      ,d.item_filter
      ,d.session_state_status
      ,d.is_encrypted
      --,s.cookie the_user
      ,s.security_group_id
      ,d.flow_instance
      --,d.* 
from apex_180100.wwv_flow_data d
    ,apex_180100.wwv_flow_sessions$ s
    ,apex_application_page_db_items i
where d.flow_instance = s.id
and   i.item_id(+)    = d.item_id
and   i.page_id(+) = 259
--and   s.security_group_id = 100001 -- workspace group ID 
--and   item_name is not null
and   flow_instance   = 6315977474060 -- session ID
and   flow_id = 4000 -- ignore dev builder et al
order by flow_id, i.display_sequence, d.item_name


select * from apex_application_page_items where page_id = 259





select c.collection_name
      ,cm.*
  from apex_180100.wwv_flow_collections$ c
      ,apex_180100.wwv_flow_collection_members$ cm
 where cm.collection_id = c.id;

wwv_flow_wizard_api.c_edit_image

grant execute on APEX_180100.wwv_flow_wizard_api to hr