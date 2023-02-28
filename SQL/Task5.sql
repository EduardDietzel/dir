-- сотрудник богатый если у него зарпалата больше 15000, иначе он бедный
-- именем фамилией и уровнем богатства сотрудника

use hr;

select
	first_name,
	last_name,
	salary,
	case
		when salary > 15000 then 'rich'
		else 'poor'
        end as wealth
from employees;

