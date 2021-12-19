select *
from accounts acc
         join users usr on acc.user_id = usr.id
         join mobile_devices md on md.id = acc.mobile_device_id
where (md.data ->> 'connection_cnt')::int > 5 and (md.data ->> 'brand') ~~ '%oo%';

select name
from accounts acc
where exists(
              select 1
              from users usr
              where acc.name = usr.username
          )
group by name;

select name
from accounts acc
         join users usr on acc.user_id = usr.id
         join mobile_devices md on md.id = acc.mobile_device_id
group by name;

select name
from accounts acc
         join users usr on acc.user_id = usr.id
where (select avg(age) from users) > 22
group by name;