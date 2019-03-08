select component_id, component_name, component_name
                 from apex_app_components
                where application_id = 200
                  and component_type = 'PAGE'
 
 declare
   v_workspace varchar2(30) := 'LOCAL';
   v_app_id    number       := 200;
 begin
   -- export Workspace
   pck_apex_export.export(i_workspace => v_workspace);
   
   -- export Application
   pck_apex_export.export(
     i_workspace => v_workspace
    ,i_app_id    => v_app_id
   );
   
   -- export Pages
   for rec in (select component_id, component_type
                 from apex_app_components
                where application_id = v_app_id
                  and component_type = 'PAGE')
   loop
     pck_apex_export.export(
       i_workspace => v_workspace
      ,i_app_id    => v_app_id
      ,i_page_id   => rec.component_id
      --,i_component => rec.component_type 
     );
   end loop;
 end;
 
 
 -- workspace export
 begin
   pck_apex_export.export(i_workspace => 'LOCAL');
 end;
 
 -- export Application
 begin
   pck_apex_export.export(
     i_workspace => 'LOCAL'
    ,i_app_id    => 200
   );
 end;
 -- component export
 begin
   pck_apex_export.export(
       i_workspace    => 'LOCAL'
      ,i_app_id       => 200
      ,i_component_id => 3
      ,i_component    => 'PAGE' 
     );
 end;