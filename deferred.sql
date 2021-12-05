/***************** Probleme *****************/

--impossible de creer la table classe avant la table etudiant
create table classe( 
    id_classe number constraint pk_classe primary key, 
    nomc varchar2(30), 
    id_representant number, 
    constraint fk_classe_represenant  
            foreign key(id_representant) references etudiant(id_etd) 
     
);

--impossible de creer la table etudiant avant la table classe
create table etudiant ( 
    id_etd number constraint pk_etudiant primary key, 
    nome varchar2(30), 
    id_classe number, 
    constraint fk_etudiant_classe  
        foreign key (id_classe) references classe(id_classe) 
);


/********************* solution  *****************************/
--On crée la table classe sans la contrainte lié à la table etudiant
create table classe( 
    id_classe number constraint pk_classe primary key, 
    nomc varchar2(30), 
    id_representant number 
);

create table etudiant ( 
    id_etd number constraint pk_etudiant primary key, 
    nome varchar2(30), 
    id_classe number, 
    constraint fk_etudiant_classe  
        foreign key (id_classe) references classe(id_classe) 
);

--ajouter la contrainte enre la table classe et la table etudiant
alter table classe add constraint fk_classe_represenant  
            foreign key(id_representant) references etudiant(id_etd);


/****************** Probleme ***********************/
insert into classe values(1,'Bachelor 1 dev med',10);
insert into etudiant values(10,'kamal',1);

/********** **************/
alter table classe disable constraint  fk_classe_represenant;
insert into classe values(1,'Bachelor 1 dev med',10);
insert into etudiant values(10,'kamal',1);
alter table classe enable validate constraint  fk_classe_represenant;

/***************** ***************************/
--cleanin
alter table classe drop constraint fk_classe_represenant;
delete from etudiant;
delete from classe;

--
alter table classe add constraint fk_classe_representant  
            foreign key(id_representant) references etudiant(id_etd) 
            deferrable initially deferred;

insert into classe values(1,'Bachelor 1 ddev med',10);
insert into etudiant values(10,'kamal',1);
