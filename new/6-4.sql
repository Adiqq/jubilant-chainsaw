CREATE OR REPLACE VIEW szefowie AS
SELECT nazwisko AS szef, (SELECT COUNT(*) from pracownicy where id_szefa = p.id_prac) AS pracownicy
FROM pracownicy p;

CREATE OR REPLACE TRIGGER usun_szefa
INSTEAD OF DELETE ON szefowie
FOR EACH ROW
DECLARE
    idszefa pracownicy.id_szefa%type;
BEGIN
    SELECT id_prac INTO idszefa FROM pracownicy WHERE nazwisko = :OLD.szef;
    DELETE pracownicy WHERE nazwisko = :OLD.szef OR id_szefa = idszefa;
END;