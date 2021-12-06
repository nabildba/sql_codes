--sous requetes non correlées
select ename
from scott.emp  em1
where sal > (select min(sal) from scott.emp );
--ou 
select nom
from scott.emp  em1
where sal >= any (select sal from scott.emp );


select nom
from scott.emp  em1
where sal > (select max(sal) from scott.emp );
--ou 
select nom
from scott.emp  em1
where sal >= all (select sal from scott.emp );



--nom des employés avec un salaire superieure au salaire moyen de tous les employés
select *  
from scott.emp 
where sal > (select avg(sal) from scott.emp);


--sous requetes corrélées
--nom des employés avec un salaire superieure au salaire moyen de tous les employés du meme departement
select nom
from employe em1
where salaire > (select avg(salaire) from employe where departement = em.departement );


/*********** vue inline **************/

--salaire moyen par job (qui va devenir notre vue inline)
select job, avg(sal) 
from scott.emp 
group by job;

--le plus grand salaire moyen par job
select max(salmoy) 
from (select job, avg(sal) as salmoy 
        from scott.emp 
        group by job);
--le job qui a le plus grand salaire moyen
select job 
from   (select job, avg(sal) as salmoy 
        from scott.emp 
        group by job
       ) 
where salmoy =( select max(salmoy) 
                from(  select job, avg(sal) as salmoy 
                        from scott.emp 
                        group by job
                    )
               ) 





