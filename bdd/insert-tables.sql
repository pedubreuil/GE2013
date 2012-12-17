ALTER TABLE  `referentiel_segment` CHANGE  `original_segment`  `original_segment` INT( 11 ) NULL;


INSERT INTO Access_level (id_level,label)
VALUES 
	(1,"Public"),	-- par tous
	(5,"Partagé"),	-- par les membres GMAP
	(10,"Privé");	-- par le créateur
	
INSERT INTO PROFILE
	(id_profile,name,referentiel_crud_own,referentiel_read_others,requete_crud_own,requete_read_others) VALUES
	(1	,	"Visiteur",0				,1						 ,0					,	1			),
	(2	,	"Membre GMAP",1				,5						 , 1				,	5			),
	(10	,	"Administrateur",1			,10						 ,1					,	10			);


INSERT INTO USER	
	(id_user,first_name,last_name,fk_profile,email) VALUES
	(1		,'PE'		, 'DUB',10,'pedubreuil@gmail.com');

	
INSERT INTO REFERENTIEL_ETUDE
	(id_referentiel,label,description) VALUES
	(1			,'référentiel 01', 'description ref 01');
	
INSERT INTO REFERENTIEL_AXE
	(id_axe,label,description,fk_level,fk_user) VALUES
	(11,'axe 01', 'description axe 01',1,1);

	
INSERT INTO REFERENTIEL_AXE_ETUDE
	(id_referentiel,id_axe) VALUES
	(1			,11);

INSERT INTO REFERENTIEL_SEGMENT
	(id_segment,label,description,fk_axe) VALUES
	(111,'segment 01', 'description segment 01',11);

INSERT INTO REFERENTIEL_KEYWORD
	(id_keyword,text,fk_segment) VALUES
	(1111,'Usine pétrolière', 111);
