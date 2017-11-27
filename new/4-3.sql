CREATE OR REPLACE PROCEDURE LICZBA_PRACOWNIKOW(
    p_zespol IN VARCHAR2,
    p_pracownicy OUT number) IS
    v_id_zesp NUMBER;
BEGIN
SELECT id_zesp INTO v_id_zesp FROM ZESPOLY
WHERE nazwa = p_zespol;

SELECT COUNT(*) INTO p_pracownicy FROM PRACOWNICY
WHERE id_zesp = v_id_zesp;

EXCEPTION
WHEN no_data_found THEN
    RAISE_APPLICATION_ERROR(-20010, 'Brak zespolu o podanej nazwie ');
END LICZBA_PRACOWNIKOW;