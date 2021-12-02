
CREATE OR REPLACE TRIGGER max_effectif
BEFORE INSERT OR UPDATE ON INSCRIPTION
FOR EACH ROW 
DECLARE
    v_mod MODULE%ROWTYPE;
    
BEGIN
    SELECT * INTO v_mod FROM MODULE WHERE CodMod = :new.CodMod;

    UPDATE MODULE
    SET Effectif = Effectif + 1
    WHERE codmod = :NEW.codmod;

    IF v_mod.Effectif > v_mod.EffecMax 
    THEN RAISE_APPLICATION_ERROR(-20998,'Impossible d ajouter l étudiant car effectif max déjà atteint');
    END IF;
END;
/