Спонсоры должны быть сгруппированы по благотворительным организациям, которым они перечисляют деньги.
Также должны выводится сводные данные:
•Благотворительные организации: общее количество благотворительных организаций.
•Всего спонсорских взносов: общая сумма спонсорских пожертвований, полученная для всех благотворительных организаций.


select count(distinct c."charityname") as charity, sum(s."amount") as sum_spon
from "Charity" c
inner join "Registration" r on c."charityid" = r."charityid"
inner join "Sponsorship" s on r."registrationid" = s."registrationid";

select c."charityname" as charity, count(distinct s."sponsorshipid") as sum_sponsors, sum(s."amount") AS all_donation       
from "Charity" c 
inner join "Registration" r on c."charityid" = r."charityid"
inner join "Sponsorship" s on r."registrationid" = s."registrationid"
group by c."charityname"  
order by charity;
