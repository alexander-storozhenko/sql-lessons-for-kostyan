create or replace procedure set_spec_name(
    account_id int,
    new_name varchar(50)
)
    language plpgsql
as $$
begin

    update accounts
    set name = 'acc-name-' || new_name
    where id = account_id;

    commit;
end;$$