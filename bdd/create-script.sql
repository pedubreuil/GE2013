
CREATE TABLE Referentiel_etude (
                id_referentiel INT AUTO_INCREMENT NOT NULL,
                label VARCHAR(40) NOT NULL,
                description VARCHAR(300),
                PRIMARY KEY (id_referentiel)
);


CREATE TABLE Access_level (
                id_level INT AUTO_INCREMENT NOT NULL,
                label VARCHAR(40) NOT NULL,
                PRIMARY KEY (id_level)
);


CREATE TABLE Profile (
                id_profile INT AUTO_INCREMENT NOT NULL,
                name VARCHAR(30) NOT NULL,
                referentiel_crud_own BOOLEAN NOT NULL,
                referentiel_read_others INT NOT NULL,
                requete_crud_own BOOLEAN NOT NULL,
                requete_read_others INT NOT NULL,
                PRIMARY KEY (id_profile)
);


CREATE TABLE User (
                id_user INT AUTO_INCREMENT NOT NULL,
                first_name VARCHAR(40) NOT NULL,
                last_name VARCHAR(40) NOT NULL,
                fk_profile INT NOT NULL,
                email VARCHAR(200) NOT NULL,
                creation_date DATE,
                address VARCHAR(80),
                city VARCHAR(50),
                zip_code VARCHAR(15),
                country VARCHAR(30),
                phone VARCHAR(30),
                last_login DATE,
                PRIMARY KEY (id_user)
);


CREATE TABLE Referentiel_axe (
                id_axe INT AUTO_INCREMENT NOT NULL,
                label VARCHAR(40) NOT NULL,
                fk_level INT NOT NULL,
                fk_user INT NOT NULL,
                description VARCHAR(300),
                PRIMARY KEY (id_axe)
);


CREATE TABLE Referentiel_axe_etude (
                id_axe INT NOT NULL,
                id_referentiel INT NOT NULL,
                PRIMARY KEY (id_axe, id_referentiel)
);


CREATE TABLE Referentiel_segment (
                id_segment INT AUTO_INCREMENT NOT NULL,
                label VARCHAR(40) NOT NULL,
                description VARCHAR(300) NOT NULL,
                original_segment INT NOT NULL,
                fk_axe INT NOT NULL,
                PRIMARY KEY (id_segment)
);


CREATE TABLE Referentiel_keyword (
                id_keyword INT AUTO_INCREMENT NOT NULL,
                fk_segment INT NOT NULL,
                text VARCHAR(150) NOT NULL,
                PRIMARY KEY (id_keyword)
);


CREATE TABLE Referentiel_segment_keyword_history (
                id_segment INT NOT NULL,
                id_keyword INT NOT NULL,
                creation_date DATE NOT NULL,
                deletion_date DATE NOT NULL,
                PRIMARY KEY (id_segment, id_keyword)
);


ALTER TABLE Referentiel_axe_etude ADD CONSTRAINT referentiel_etude_referentiel_axe_etude_fk
FOREIGN KEY (id_referentiel)
REFERENCES Referentiel_etude (id_referentiel)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Profile ADD CONSTRAINT profile_level_profile_fk
FOREIGN KEY (referentiel_read_others)
REFERENCES Access_level (id_level)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Profile ADD CONSTRAINT profile_level_profile_fk1
FOREIGN KEY (requete_read_others)
REFERENCES Access_level (id_level)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Referentiel_axe ADD CONSTRAINT access_level_referentiel_axe_fk
FOREIGN KEY (fk_level)
REFERENCES Access_level (id_level)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE User ADD CONSTRAINT profile_user_fk
FOREIGN KEY (fk_profile)
REFERENCES Profile (id_profile)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Referentiel_axe ADD CONSTRAINT user_referentiel_axe_fk
FOREIGN KEY (fk_user)
REFERENCES User (id_user)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Referentiel_segment ADD CONSTRAINT referentiel_axe_referentiel_segment_fk
FOREIGN KEY (fk_axe)
REFERENCES Referentiel_axe (id_axe)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Referentiel_axe_etude ADD CONSTRAINT referentiel_axe_referentiel_axe_etude_fk
FOREIGN KEY (id_axe)
REFERENCES Referentiel_axe (id_axe)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Referentiel_segment ADD CONSTRAINT original_segment_fk
FOREIGN KEY (original_segment)
REFERENCES Referentiel_segment (id_segment)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Referentiel_segment_keyword_history ADD CONSTRAINT referentiel_segment_referentiel_segment_keyword_history_fk
FOREIGN KEY (id_segment)
REFERENCES Referentiel_segment (id_segment)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Referentiel_keyword ADD CONSTRAINT referentiel_segment_referentiel_keyword_fk
FOREIGN KEY (fk_segment)
REFERENCES Referentiel_segment (id_segment)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Referentiel_segment_keyword_history ADD CONSTRAINT referentiel_keyword_referentiel_segment_keyword_history_fk
FOREIGN KEY (id_keyword)
REFERENCES Referentiel_keyword (id_keyword)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
