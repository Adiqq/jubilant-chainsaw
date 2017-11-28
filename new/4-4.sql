CREATE OR REPLACE PROCEDURE NOWY_PRACOWNIK(
    p_nazwisko IN VARCHAR2,
    p_nazwa_zespolu IN VARCHAR2,
    p_nazwisko_szefa IN VARCHAR2,
    p_placa_pod IN NUMBER) IS
    v_id_zesp NUMBER;
    v_id_szefa NUMBER;
    v_id_prac_current NUMBER;
    
BEGIN
SELECT id_zesp INTO v_id_zesp FROM ZESPOLY
WHERE nazwa = p_nazwa_zespolu;

SELECT id_prac INTO v_id_szefa FROM PRACOWNICY
WHERE NAZWISKO = p_nazwisko_szefa;

SELECT MAX(id_prac) INTO v_id_prac_current FROM PRACOWNICY;

INSERT INTO PRACOWNICY
(id_prac, nazwisko, etat, id_szefa, zatrudniony, placa_pod, id_zesp)
VALUES
(v_id_prac_current + 10, p_nazwisko, 'STAZYSTA', v_id_szefa, CURRENT_DATE, p_placa_pod,v_id_zesp);

EXCEPTION
WHEN no_data_found THEN
    RAISE_APPLICATION_ERROR(-20010, 'Błedne nazwisko szefa lub nazwa zespołu.');
END;
    /