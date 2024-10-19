WITH avg AS (
  SELECT avg(re."RaceTime") as avg_racetime
  FROM "RegistrationEvent" re
)
select sum(r."RunnerId") as AmountOfRunners, 
((a."avg_racetime" / 60 / 60)::text || 'h ' || ((a."avg_racetime" / 60 % 60)::text || 'min ' ||  (a."avg_racetime" % 60)::text || 'sec')) AS "AVG_RACETIME",
r."Gender"
from "Runner" r
cross join "RegistrationEvent" re
cross join "avg" a
where re."RaceTime" != 0 
group by a."avg_racetime", r."Gender";

select u."FirstName", u."LastName", extract(year from Age(r."DateOfBirth")) as AGE, g."Gender", m."MarathonName",ev."EventName", c."CountryName",
  ROW_NUMBER() OVER (PARTITION BY ev."EventName" ORDER BY re."RaceTime" ASC) AS position
from "Event" ev
inner join "Marathon" m ON ev."MarathonId" = m."MarathonId"
inner join "Country" c on m."CountryCode" = c."CountryCode"
inner join "RegistrationEvent" re ON ev."EventId" = rei."EventId"
inner join  "Registration" reg on rei."RegistrationId" = reg."RegistrationId"
inner join "Runner" r on reg."RunnerId" = r."RunnerId"
inner join "User" u on u."Email" = r."Email"
inner join "Gender" g on r."GenderId" = g."GenderId"
where ev."MarathonId" = '3' AND re."RaceTime" != 0
order by ev."EventName" asc, g."Gender" asc, race_time asc;