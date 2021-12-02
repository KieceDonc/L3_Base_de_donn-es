
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