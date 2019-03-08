create table log_events(
    event_id  number not null primary key
    ,event_ts timestamp not null
    ,message  varchar2(4000)
    ,log_user varchar2(50) not null
)
/

create sequence log_events_seq
/

create or replace procedure l(i_message in varchar2) as
    pragma autonomous_transaction;
begin
  insert into log_events values (log_events_seq.nextval, systimestamp, i_message, nvl(v('APP_USER'), user));
  commit;
end;
/
