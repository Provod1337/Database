SELECT u."FirstName", u."LastName", r."CountryCode"
FROM "User" u
CROSS JOIN "Runner" r
CROSS JOIN "Marathon" m
WHERE m."MarathonName" = 'Marathon Skills 2011';