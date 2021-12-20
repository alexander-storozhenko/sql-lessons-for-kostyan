create or replace procedure set_spec_name(
    account_id int,
    new_name varchar(50)
)
language plpgsql as $$
declare
    acc_name varchar(50);
begin

    update accounts
    set name = 'acc-name-' || new_name
    where id = account_id;

    select name into acc_name from accounts where id = account_id;

    raise notice 'new account name: %', acc_name;

    commit;
end;$$;

create or replace function generate_name() returns varchar AS
$BODY$
declare
    name      varchar(255);
    rnd_value integer;
begin
    rnd_value = floor(random() * 5)::int;

    raise notice 'generated value: %', rnd_value;

    case rnd_value
    when 0 then
        name = 'Igor';
    when 1 then
        name = 'Victor';
    when 2 then
        name = 'Nikita';
    when 3 then
        name = 'Nikolay';
    when 4 then
        name = 'Bogdan';
    else
        name = 'Noname';
    end case;

    raise notice 'generated name: %', name;

    return name;
end;
$BODY$
language plpgsql volatile;


create or replace procedure set_account_point(acc_id int, value int)
language plpgsql as $$
declare
    result int;

-- transaction begin
begin

    update accounts
    set points = points + value
    where id = acc_id;

    result := (select points from accounts where accounts.id = acc_id);

    if result < 0 then
        rollback;
    end if;

commit;
end;$$;