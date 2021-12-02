DROP TABLE RESULTAT;
DROP TABLE EXAMEN;
DROP TABLE PREREQUIS;
DROP TABLE INSCRIPTION;
DROP TABLE MODULE;
DROP TABLE ETUDIANT;

CREATE TABLE ETUDIANT
(numEtud number CONSTRAINT pk_etudiant PRIMARY KEY,
nom varchar2(40),
prenom varchar2(40), 
datenaiss date, 
moyenne real
);

CREATE TABLE MODULE
(codMod number CONSTRAINT pk_module PRIMARY KEY,
nomMod varchar2(15),
effecMax number DEFAULT 30,
effectif number DEFAULT 30
);

CREATE TABLE EXAMEN
(codMod number, 
codExam number, 
dateExam date,
CONSTRAINT pk_examen PRIMARY KEY (codMod, codExam),
CONSTRAINT fk_examen FOREIGN KEY (codMod) REFERENCES MODULE(codMod)
);

CREATE TABLE INSCRIPTION
(numEtud number,
codMod number,
dateInsc date default sysdate,
CONSTRAINT pk_inscription PRIMARY KEY (codMod, numEtud),
CONSTRAINT fk_inscription_etudiant FOREIGN KEY (numEtud) REFERENCES ETUDIANT(numEtud),
CONSTRAINT fk_inscription_module FOREIGN KEY (codMod) REFERENCES MODULE
(codMod)
);

CREATE TABLE PREREQUIS
(codMod number,
codModPrereq number,
noteMin number(2) DEFAULT 10 NOT NULL,
CONSTRAINT pk_prerequis PRIMARY KEY (codMod, codModPrereq),
CONSTRAINT fk_prerequis_codmod FOREIGN KEY (codMod) REFERENCES MODULE(codMod),
CONSTRAINT fk_prerequis_codmodprereq FOREIGN KEY (codModPrereq) REFERENCES
MODULE(codMod)
);

CREATE TABLE RESULTAT
(codMod number,
codExam number,
numEtud number,
note number(4, 2),
CONSTRAINT pk_resultat PRIMARY KEY (codMod, numEtud, codExam),
CONSTRAINT fk_resultat_examen FOREIGN KEY (codMod, codExam) REFERENCES EXAMEN (codMod, codExam),
CONSTRAINT fk_resultat_inscription FOREIGN KEY (codMod, numEtud) REFERENCES
INSCRIPTION(codMod,numEtud)
);

INSERT INTO MODULE(codMod, nomMod) VALUES (1, 'Oracle'); 
INSERT INTO MODULE(codMod, nomMod) VALUES (2, 'C++'); 
INSERT INTO MODULE(codMod, nomMod) VALUES (3, 'C'); 
INSERT INTO MODULE(codMod, nomMod) VALUES (4, 'Algo'); 
INSERT INTO MODULE(codMod, nomMod) VALUES (5, 'Merise'); 
INSERT INTO MODULE(codMod, nomMod) VALUES (6, 'PL/SQL Oracle'); 
INSERT INTO MODULE(codMod, nomMod) VALUES (7, 'mySQL'); 
INSERT INTO MODULE(codMod, nomMod) VALUES (8, 'Algo avancee'); 

INSERT INTO PREREQUIS (codMod, codModPrereq) VALUES (1, 5); 
INSERT INTO PREREQUIS (codMod, codModPrereq) VALUES (2, 3); 
INSERT INTO PREREQUIS VALUES (6, 1, 12); 
INSERT INTO PREREQUIS (codMod, codModPrereq) VALUES (6, 5); 
INSERT INTO PREREQUIS (codMod, codModPrereq) VALUES (8, 5); 
INSERT INTO PREREQUIS (codMod, codModPrereq) VALUES (7, 5);

INSERT INTO ETUDIANT VALUES
((SELECT nvl(MAX(numEtud), 0) + 1 FROM ETUDIANT), 'Fourier','Joseph',NULL, NULL);

INSERT INTO INSCRIPTION (codMod, numEtud) VALUES
((SELECT numEtud FROM ETUDIANT WHERE nom = 'Fourier'),
(SELECT codMod FROM MODULE WHERE nomMod = 'Oracle')
);

INSERT INTO EXAMEN VALUES
(
(SELECT codMod FROM MODULE WHERE nomMod = 'Oracle'),1, to_date('02012008',
'ddmmyyyy')
);

INSERT INTO RESULTAT VALUES        
(
(SELECT codMod FROM MODULE WHERE nomMod = 'Oracle'), 1,
(SELECT numEtud FROM ETUDIANT WHERE nom = 'Fourier'),19  );

UPDATE RESULTAT SET note = 20 wHERE numEtud = (SELECT numEtud FROM ETUDIANT
WHERE nom = 'Fourier')
AND codMod = (SELECT codMod FROM MODULE WHERE nomMod = 'Oracle') AND codExam = 
1;

UPDATE PREREQUIS SET noteMin = 2;

INSERT INTO EXAMEN VALUES (2, 1, sysdate);


