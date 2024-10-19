SELECT r."Gender", AGE(CURRENT_TIMESTAMP(2), r."DateOfBirth") AS "AGE", m."MarathonName" as "Marathon"
from "Runner" r 
CROSS JOIN "Marathon" m
cross join "Registration" re
where  re."RegistrationStatusId" = 4;