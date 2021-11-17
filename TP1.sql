CREATE TABLE service (
    serno INTEGER PRIMARY KEY,
    nom VARCHAR(40) NOT NULL,
    lieu VARCHAR(40) NOT NULL
);

CREATE TABLE employe (
    empno INTEGER PRIMARY KEY,
    nom VARCHAR(40) NOT NULL,
    prenom VARCHAR(40) NOT NULL,
    fonction VARCHAR(40) NOT NULL,
    chef INTEGER,
    dateembauche DATE NOT NULL,
    salaire NUMBER(6,2) DEFAULT 0,
    commission NUMBER(6,2),
    serno INTEGER NOT NULL,
    CONSTRAINT unique_nom_prenom
        UNIQUE (prenom,nom),
    CONSTRAINT values_fonction 
        CHECK (fonction IN ('President','Gerant','Secretaire','Vendeur')),
    CONSTRAINT foreign_serno
        FOREIGN KEY (serno)
        REFERENCES service (serno)
        ON DELETE CASCADE,
    CONSTRAINT foreign_chef
        FOREIGN KEY (chef)
        REFERENCES employe (empno)
        ON DELETE CASCADE
);