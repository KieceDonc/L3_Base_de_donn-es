
CREATE VIEW salairesFranc (empno, nom, prenom, fonction, serno, salairefranc, commissionfranc)  AS 
SELECT empno, nom, prenom, fonction, serno, (salaire * 6.55957) AS salairefranc, (commission * 6.55957) AS commissionfranc 
FROM employe;