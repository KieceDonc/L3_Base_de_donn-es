
DROP TABLE Temp;

DROP TABLE Action;


CREATE TABLE Temp(
    Ligne INT PRIMARY KEY NOT NULL,
    Valeur INT
);

CREATE TABLE Action(
    Ligne INT PRIMARY KEY NOT NULL,
    Op VARCHAR(1),
    Nouv_valeur INT,
    Statut VARCHAR(255)
);

INSERT INTO Action (Ligne,Op,Nouv_valeur,Statut) VALUES (3,'u',590,NULL);
INSERT INTO Action (Ligne,Op,Nouv_valeur,Statut) VALUES (6,'i',2990,NULL);
INSERT INTO Action (Ligne,Op,Nouv_valeur,Statut) VALUES (5,'d',NULL,NULL);
INSERT INTO Action (Ligne,Op,Nouv_valeur,Statut) VALUES (7,'u',1599,NULL);
INSERT INTO Action (Ligne,Op,Nouv_valeur,Statut) VALUES (1,'i',399,NULL);
INSERT INTO Action (Ligne,Op,Nouv_valeur,Statut) VALUES (9,'d',NULL,NULL);
INSERT INTO Action (Ligne,Op,Nouv_valeur,Statut) VALUES (10,'x',NULL,NULL);

INSERT INTO TEMP (Ligne,Valeur) VALUES (1,399);
INSERT INTO TEMP (Ligne,Valeur) VALUES (2,2000);
INSERT INTO TEMP (Ligne,Valeur) VALUES (3,599);
INSERT INTO TEMP (Ligne,Valeur) VALUES (4,6500);
INSERT INTO TEMP (Ligne,Valeur) VALUES (6,2990);
INSERT INTO TEMP (Ligne,Valeur) VALUES (7,1599);