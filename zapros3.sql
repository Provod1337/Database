WITH age AS (
  SELECT AGE(CURRENT_TIMESTAMP(2), r."DateOfBirth") AS "AGE"
  FROM "Runner" r
)
select  m."MarathonName" as "Marathon",a."AGE", e."EventName", 
((re."RaceTime" / 60 / 60)::text || 'h ' || ((re."RaceTime" / 60 % 60)::text || 'min ' ||  (re."RaceTime" % 60)::text || 'sec')) AS "RaceTime",
re."BibNumber", r."Gender"
from "Marathon" m 
cross join "age" a
cross join "Runner" r
cross join "Event" e 
cross join "RegistrationEvent" re
left join "Gender" g ON r."Gender" = g."gender"
order by r."Gender" asc;
