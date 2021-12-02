
CREATE OR REPLACE TRIGGER no_update_notemin
BEFORE UPDATE ON PREREQUIS
FOR EACH ROW 

BEGIN
    IF :old.NoteMin!=:new.NoteMin THEN RAISE_APPLICATION_ERROR(-20999,'Impossible de modifier la note minimal');
    END IF;
END;
/