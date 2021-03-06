create extension if not exists "uuid-ossp";

create or replace procedure seed() language plpgsql as $$
declare
begin

---------------- users ----------------

insert into users(username, password, email, age, created_on)
values ('Nikolay', 'root', 'b@a', 23, current_timestamp);

insert into users(username, password, email, age, created_on)
values ('Nikolay', 'root', 'c@a', 24, current_timestamp);

---------------- mobile_devices ----------------

insert into mobile_devices(number, uid, data, created_on)
values (902394234, uuid_generate_v4(), '{"connection_cnt": 11, "brand": "google"}', current_timestamp);

insert into mobile_devices(number, uid, data, created_on)
values (902394234, uuid_generate_v4(), '{"connection_cnt": 4, "brand": "apple"}', current_timestamp);

insert into mobile_devices(number, uid, data, created_on)
values (1299461131, uuid_generate_v4(), '{"connection_cnt": 0, "brand": "google"}', current_timestamp);

---------------- accounts ----------------

insert into accounts(name, user_id, mobile_device_id, created_on)
values ('acc-name1', 1, 1, current_timestamp);

insert into accounts(name, user_id, mobile_device_id, created_on)
values ('acc-name2', 2, 1, current_timestamp);

insert into accounts(name, user_id, mobile_device_id, created_on)
values ('Nikolay', 1, 2, current_timestamp);

insert into accounts(name, user_id, mobile_device_id, created_on)
values ('Nikolay', 1, 2, current_timestamp);

insert into accounts(name, user_id, mobile_device_id, created_on)
values ('acc-name1', 1, 3, current_timestamp);

---------------- events ----------------

insert into events(account_id, data)
values (1, '{"type": "0xF0"}');

insert into events(account_id, data)
values (4, '{"type": "0xAA"}');

insert into events(account_id, data)
values (2, '{}');

insert into events(account_id, data)
values (3, '{}');

end;$$;