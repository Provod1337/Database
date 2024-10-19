Запрос должен позволить просматривать список всех бегунов, которые зарегистрированы на текущий марафон. Составить запрос, который может фильтровать бегунов по статусу регистрации и выбранным типам марафона, и он может сортировать все поля таблицы результатов. 
Общее количество бегунов, которые выведены в список, должно быть отображено над списком.
Имя, Фамилия, адрес электронной почты и регистрационный статус должны быть указаны для каждого бегуна.


select distinct u."FirstName", u."LastName", ru."Email", rgs."RegistrationStatusId",ev."EventTypeId" 
from "User" u
inner join "Role" r on u."RoleId" = r."RoleId" 
inner join "Runner" ru on u."Email" = ru."Email" 
inner join "Registration" reg on ru."RunnerId" = reg."RunnerId" 
inner join "RegistrationEvent" rei on reg."RegistrationId" = rei."RegistrationId" 
inner join "Event" ev on rei."EventId" = ev."EventId" 
inner join "RegistrationStatus" rgs on reg."RegistrationStatusId" = rgs."RegistrationStatusId" 
where rgs."RegistrationStatusId" = 1
order by "EventTypeId" asc;

select 
count(*) From (
select distinct 
  u."FirstName", 
  u."LastName", 
  ru."Email", 
  rgs."RegistrationStatus"
from  "User" u
join "Role" r on u."RoleId" = r."RoleId" 
join "Runner" ru on u."Email" = ru."Email" 
join "Registration" reg on ru."RunnerId" = reg."RunnerId"
join "RegistrationEvent" rei on reg."RegistrationId" = rei."RegistrationId"
join "Event" ev on rei."EventId" = ev."EventId" 
join "RegistrationStatus" rgs on reg."RegistrationStatusId" = rgs."RegistrationStatusId"  
where ev."EventTypeId" = 'FM' and rgs."RegistrationStatusId" = 1 ) as "a" 
