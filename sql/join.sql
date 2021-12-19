select events.id, events.account_id, acc.name
from events
    inner join accounts acc on events.account_id = acc.id