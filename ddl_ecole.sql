

--Creation de table
--Contraintes inline
create table formateur( 
       nform number(10) primary key, 
       nomform varchar2(30)  not null, 
       email varchar2(30) unique, 
       tel varchar2(13) check(tel like '06%') 
);

--Suppression de table
drop table formateur;

--Création de table
--Contraintes nommées
create table formateur( 
       nform number(10) constraint pk_formateur primary key, 
       nomform varchar2(30)  , 
       email varchar2(30), 
       tel varchar2(13), 
       constraint nom_obligatoire check(nomform is not null), 
       constraint tel_valid  check(tel like '06%') --tel doit commencer par 06
);

--Créer Sequence
create sequence nform_seq;

--Inserer des données 
insert into formateur values(nform_seq.nextval,'karim','karim@ecole.com','0699887744');
insert into formateur values(nform_seq.nextval,'riad','riad@ecole.com','0611445588')
insert into formateur values(nform_seq.nextval,'salma','salma@ecole.com','0633226688')

--enerer une viola6ion de la  Contrainte tel_valid
insert into formateur values(nform_seq.nextval,'salma','salma@ecole.com','0533226688');

--
select * from formateur;

--Cré
create table groupe( 
    ngrp number(10) constraint pk_groupe primary key, 
    nomgrp varchar2(30), 
    filiere varchar2(30) 
);
create sequence ngrp_seq;
insert into groupe values(ngrp_seq.nextval,'Dev-A','Developpement');
insert into groupe values(ngrp_seq.nextval,'Dev-B','Developpement');
insert into groupe values(ngrp_seq.nextval,'Mark-A','Marketing');
insert into groupe values(ngrp_seq.nextval,'RH-A','Ressources Humaines');

--
create table attribution( 
    nform number(10), 
    ngrp number(10), 
    constraint pk_groupe_formateur primary key(nform, ngrp), 
    constraint fk_groupe_attribution 
              foreign key (ngrp) references groupe(ngrp),
    constraint fk_formateur_attribution 
               foreign key (nform) references formateur(nform) 
);
insert into attribution values(1,1);
insert into attribution values(1,2);
insert into attribution values(3,1);
insert into attribution values(3,3);
insert into attribution values(4,3);
insert into attribution values(4,4);

--
create table activite( 
    nact number(10) constraint pk_activite primary key, 
    nomact varchar2(30) 
);
insert into activite values(10,'sport');
insert into activite values(20,'art');
insert into activite values(30,'langue');

--
create table eleve ( 
 nel number(10), 
 nomel varchar2(30), 
 date_naissance date, 
 ngrp number(10), 
 nact number(10), 
 constraint pk_eleve primary key(nel), 
 constraint fk_eleve_groupe foreign key (ngrp) references groupe(ngrp), 
 constraint fk_eleve_activite foreign key (nact) references activite(nact) 
);

create sequence neleve_seq;

insert into eleve values(neleve_seq.nextval, 'donald',to_date('1999-11-30','YYYY-MM-DD'),1,10);
insert into eleve values(neleve_seq.nextval, 'kim',to_date('1998-11-30','YYYY-MM-DD'),1,null);
insert into eleve values(neleve_seq.nextval, 'sara',to_date('2000-11-30','YYYY-MM-DD'),1,30);
insert into eleve values(neleve_seq.nextval, 'leo',to_date('1978-11-30','YYYY-MM-DD'),2,10);
insert into eleve values(neleve_seq.nextval, 'aicha',to_date('1999-11-30','YYYY-MM-DD'),2,10);
insert into eleve values(neleve_seq.nextval, 'jiji',to_date('1996-11-30','YYYY-MM-DD'),3,null);
insert into eleve values(neleve_seq.nextval, 'mona',to_date('2000-06-30','YYYY-MM-DD'),3,10);
insert into eleve values(neleve_seq.nextval, 'kiki',to_date('1990-11-30','YYYY-MM-DD'),4,30);
insert into eleve values(neleve_seq.nextval, 'amal',to_date('1995-11-05','YYYY-MM-DD'),4,null)
insert into eleve values(neleve_seq.nextval, 'tarik',to_date('2003-11-30','YYYY-MM-DD'),4,20)
insert into eleve values(neleve_seq.nextval, 'sarah',to_date('1991-11-10','YYYY-MM-DD'),4,10)
