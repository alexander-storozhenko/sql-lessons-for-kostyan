---------------- users ----------------

insert into users(username, password, email, age, created_on)
values ('bogdan', 'root', 'b@a', 23, current_timestamp);

insert into users(username, password, email, age, created_on)
values ('vova', 'root', 'c@a', 24, current_timestamp);

---------------- mobile_devices ----------------

insert into mobile_devices(number, uid, data, created_on)
values (902394234, 'ab31-knH1-mv21-kkT3', '{"connection_cnt": 11, "brand": "google"}', current_timestamp);

insert into mobile_devices(number, uid, data, created_on)
values (902394234, 'ab31-knH1-mv21-kkT3', '{"connection_cnt": 4, "brand": "apple"}', current_timestamp);

---------------- accounts ----------------

insert into accounts(name, user_id, mobile_device_id, created_on)
values ('acc-name1', 1, 1, current_timestamp);

insert into accounts(name, user_id, mobile_device_id, created_on)
values ('acc-name2', 2, 1, current_timestamp);

insert into accounts(name, user_id, mobile_device_id, created_on)
values ('bogdan', 1, 1, current_timestamp);

---------------- events ----------------

insert into events(account_id, data)
values (1, '{"type": "0xF0"}');

insert into events(account_id, data)
values (1, '{"type": "0xAA"}');

insert into events(account_id, data)
values (1, '{}');

insert into events(account_id, data)
values (1, '{}');