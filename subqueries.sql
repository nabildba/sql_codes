--sous requetes non correlée
select nom
from employe em1
where salaire > (select min(salaire) from employe);
--ou 
select nom
from employe em1
where salaire >= any (select salaire from employe);


select nom
from employe em1
where salaire > (select max(salaire) from employe);
--ou 
select nom
from employe em1
where salaire >= all (select salaire from employe);



--nom des employés avec un salaire superieure au salaire moyen de tous les employés



select nom
from employe em1
where salaire > (select avg(salaire) from employe);

--sous requetes corrélées
--nom des employés avec un salaire superieure au salaire moyen de tous les employés du meme departement
select nom
from employe em1
where salaire > (select avg(salaire) from employe where departement = em.departement );
