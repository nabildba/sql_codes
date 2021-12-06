--table dual
--afficher une valeur (echo)
select 'coucou' from dual;
--un calcul
select (13+30)*50 from dual;
--date systeme
select sysdate from dual;
--fonctions 
--voir les slides pour la liste des fonctions
select upper('coucou') from dual;

--colonne rownum
select rownum,ename, sal from scott.emp;
--
select rownum,ename, sal from scott.emp where rownum <6;

--case
select ename, job,
                case 
                    when sal between 0 and 1000 then 'pauvre' 
                    when sal between 1000 and 3000 then 'moyen' 
                    else 'riche' 
                end as "status"
from scott.emp;

--calcul des dates
--nombre d'années
 select ename, floor((sysdate - hiredate)/365) as experience from scott.emp;
--ou
select ename, floor(months_between(sysdate, hiredate)/12) as experience from scott.emp;
