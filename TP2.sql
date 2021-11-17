--- PARTIE 1

-- AVEC NOT EXISTS : Validé
SELECT empno
FROM employe
WHERE NOT EXISTS(
    SELECT *
    FROM employe emp2
    WHERE employe.empno = emp2.chef
);


-- AVEC NOT IN : Validé
SELECT empno
FROM employe
WHERE employe.empno NOT IN (
    SELECT chef
    FROM employe
    WHERE chef IS NOT NULL
);


-- AVEC ALL : Validé
SELECT empno
FROM employe
WHERE employe.empno <> ALL (
    SELECT chef
    FROM employe
    WHERE chef IS NOT NULL
);


-- AVEC MINUS : Validé
SELECT empno
FROM employe
MINUS
SELECT chef
FROM employe;


-- AVEC LEFT JOIN : Validé 
SELECT DISTINCT employe.empno
FROM employe
LEFT OUTER JOIN employe emp2 ON emp2.chef = employe.empno
WHERE emp2.chef IS NULL;

---------------------
--- PARTIE 2 

SELECT employe.empno
FROM employe
WHERE chef IS NULL;


---------------------
--- PARTIE 3

SELECT employe.empno
FROM employe
WHERE employe.empno IN(
    SELECT chef
    FROM employe
);


---------------------
--- PARTIE 4

SELECT nom
FROM employe
WHERE EXISTS (
    SELECT *
    FROM employe emp2
    WHERE employe.empno = emp2.chef AND employe.salaire > emp2.salaire
);


---------------------
--- PARTIE 5


SELECT empno
FROM employe
WHERE EXISTS (
    SELECT *
    FROM employe emp2
    WHERE employe.empno = emp2.chef AND employe.salaire < emp2.salaire
);

