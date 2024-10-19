Все бегуны, которые зарегистрированы на текущий марафон отображаются в таблице, как: имя, фамилия - BibNumber (CountryCode).

SELECT u."FirstName", u."LastName", r."CountryCode"
FROM "User" u
CROSS JOIN "Runner" r
CROSS JOIN "Marathon" m
WHERE m."MarathonName" = 'Marathon Skills 2011';
