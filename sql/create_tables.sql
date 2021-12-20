create table if not exists users (
        id serial   primary key,
        username    varchar ( 50 )  not null,
        password    varchar ( 50 )  not null,
        email       varchar ( 255 ) not null,
        age         integer         not null,
        created_on  timestamp       not null,
        last_login  timestamp
);

create table if not exists mobile_devices (
    id serial   primary key,
    number      integer        not null,
    uid         uuid           not null,
    data        json           default '{}',
    created_on  timestamp      not null
);

create table if not exists accounts(
    id serial   primary key,
    name        varchar(30),
    user_id     integer,
    points      bigint default 0,
    mobile_device_id integer,

    constraint fk_user
        foreign key (user_id)
            references users (id),

    constraint fk_mobile_device
        foreign key (mobile_device_id)
            references mobile_devices (id),

    created_on  timestamp      not null
);

create table if not exists events(
    id serial   primary key,
    account_id  integer     not null,
    data        json

--     constraint fk_account
--         foreign key(account_id)
--             references accounts(id)
);

create index if not exists mobile_devices_connection_cnt ON mobile_devices (((data ->> 'connection_cnt')::integer));
create index if not exists mobile_devices_number ON mobile_devices (number);
create index if not exists event_on_account ON events (account_id);