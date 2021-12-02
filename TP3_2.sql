
CREATE TRIGGER addSalaireFranc
INSTEAD OF INSERT ON salairefranc
BEGIN
INSERT INTO employe( empno, nom, prenom, fonction, chef, dateembauche, salaire, commission, serno)
VALUES (:NEW.empno, :NEW.nom, :NEW.prenom, :NEW.fonction, NULL,NULL, :NEW.salaire/6.55957, :NEW.commission, :NEW.serno)
END