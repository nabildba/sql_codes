
--vues statiques 

-- DBA_  tous les objets de la base de données (accessible par l'utilisateur sys)
-- ALL_  tous les objets acceissible par l'utilisateur courant
-- USER_ tous les objets dans le schema de l'utulisateur courant
select  * from dictionary;-- toutes les vues statiques de la bases de données


select  * from dba_tables;--toutes les tables de la base de données
select  * from all_tables;--toutes les tables accessibles par l'utilisateur
select  * from user_tables;--toutes les tables dans le schema de l'utilisateur
--
select  * from all_tables where owner ='HR';
--
SELECT * FROM user_constraints;
-- vues generiques dba_objects, all_objects, user_objects
-- champs utiles : object_name, object_type , owner
SELECT * from all_objects where object_type ='table'

--decrire une table
DESCRIBE client;
--ou
descr  hr.employees;


--Les vues dynamiques (statistiques, de performances ...)
--Informations sur l'instance la memoire les sessions l'execution SQL, les fichiers..
-- v$
-- gv$ (global V$) colonne INST_ID ajoutée à chaque vue v$

SELECT * from v$fixed_view;--montre toutes les vues dynamiques

-- sessions actives
select * from v$session;
--☺►erminer une sessions
-- ALTER system kill session 'sid,seriel' immediate

-- performances: execution sql
select sql_text, executions from v$sql where cpu_time > 100000;


select * from v$sga;

select * from v$instance;

select * from v$datafile;

select * from v$logfile;

--
-- statistiques v$sysstat, v$sesstat, v$process
