create table joueur( 
    idj number constraint pk_joueur primary key, 
    nom varchar2(30), 
    id_capitaine number 
);
alter table joueur add constraint fk_joueur_capitaine foreign key(id_capitaine) 
        references joueur(idj);


insert into joueur values(1,'omar',null);
insert into joueur values(2,'aicha',1);
insert into joueur values(3,'kiki',1);
insert into joueur values(4,'kamal',null);
insert into joueur values(5,'sisi',4);
insert into joueur values(6,'hafid',4);
insert into joueur values(7,'mouna',4);


select joueur.nom as "le joueur", capitaine.nom as "son capitaine" 
from joueur join joueur capitaine  
        on joueur.id_capitaine=capitaine.idj;

select joueur.nom as "le joueur", capitaine.nom as "son capitaine" 
from joueur left outer join joueur capitaine  
        on joueur.id_capitaine=capitaine.idj;

select joueur.nom as "le joueur", nvl(capitaine.nom,'sans') as "son capitaine" 
from joueur left outer join joueur capitaine  
        on joueur.id_capitaine=capitaine.idj;


