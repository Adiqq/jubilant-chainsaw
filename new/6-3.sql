CREATE TABLE HISTORIA (
 ID_PRAC NUMBER,
 PLACA_POD NUMBER,
 ETAT VARCHAR2(20),
 ZESPOL VARCHAR2(20),
 MODYFIKACJA DATE);

CREATE OR REPLACE TRIGGER trigger_historia
BEFORE UPDATE OR DELETE ON pracownicy
FOR EACH ROW
BEGIN
    IF DELETING THEN
        INSERT INTO historia values (:OLD.id_prac, :OLD.placa_pod, :OLD.etat, (SELECT nazwa from zespoly where
        id_zesp= :OLD.id_zesp), SYSDATE);
    END IF;
    IF (:NEW.placa_pod != :OLD.placa_pod OR :NEW.etat != :OLD.etat OR
        :NEW.id_zesp != :OLD.id_zesp) THEN
        INSERT INTO historia values (:OLD.id_prac, :OLD.placa_pod, :OLD.etat, (SELECT nazwa from zespoly where
        id_zesp= :OLD.id_zesp), SYSDATE);
    END IF;
END;