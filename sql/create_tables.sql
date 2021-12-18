create table if not exists users (
        id serial   primary key,
        username    varchar ( 50 )  not null,
        password    varchar ( 50 )  not null,
        email       varchar ( 255 ) not null,
        created_on  timestamp       not null,
        last_login  timestamp
);

create table if not exists mobile_devices (
    id serial   primary key,
    number      integer        not null,
    uid         varchar ( 50 ) not null,
    data        json           default '{}',
    created_on  timestamp      not null,

    user_id     integer,

    constraint fk_user
        foreign key(user_id)
            references users(id)
);

create table if not exists accounts(
    id serial   primary key,
    name        varchar(30),
    user_id     integer,

    constraint fk_user
        foreign key(user_id)
            references users(id)
);


create index if not exists user_on_mobile_devices ON mobile_devices (number);