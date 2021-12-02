
CREATE VIEW salaires (serno, noms, lieu, salaireMin, salaireMax) AS 
SELECT service.serno, service.nom, lieu, min(salaire) AS salaireMin, max(salaire) AS salaireMax 
FROM service, employe
WHERE service.serno = employe.serno
GROUP BY service.serno, service.nom, service.lieu;