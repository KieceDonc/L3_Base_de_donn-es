
DECLARE 
    CURSOR c IS SELECT * FROM Action FOR UPDATE OF Statut;

BEGIN 
    FOR v_in IN  c
        LOOP
            IF v_in.Nouv_valeur IS NOT NULL THEN
                IF v_in.Op = 'u' THEN
                    UPDATE Temp SET Valeur=v_in.Nouv_valeur WHERE Ligne=v_in.Ligne;
                    IF SQL%NOTFOUND THEN
                        INSERT INTO Temp (Ligne,Valeur) VALUES (v_in.Ligne, v_in.Nouv_valeur);
                        UPDATE Action SET Statut = 'ligne nn trouver : valeur inseree' WHERE CURRENT OF c;
                    ELSE
                        UPDATE Action SET Statut = 'mise a jour : success' WHERE CURRENT OF c;
                    END IF;
                    UPDATE Action SET Statut = 'mise a jour : success' WHERE CURRENT OF c;
                ELSE IF v_in.Op = 'd' THEN
                /*ELSE IF v_in.Op = 'i' THEN
                    INSERT INTO Temp (Ligne,Valeur) VALUES (v_in.Ligne, v_in.Nouv_valeur);
                    UPDATE Action SET Statut = 'insertion success' WHERE CURRENT OF c;
                */
                ELSE
                    UPDATE Action SET Statut = 'opérateur invalide : aucune action' WHERE CURRENT OF c;
                END IF;
            END IF;
        END LOOP;
        COMMIT;
END;  
/