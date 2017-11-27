DECLARE
CURSOR c_pracownicy (p_etat pracownicy.etat%TYPE) IS
    SELECT NAZWISKO FROM pracownicy
    WHERE etat = p_etat;
v_etat pracownicy.etat%TYPE := &etat;
v_nazwa etaty.nazwa%TYPE;
BEGIN
SELECT nazwa INTO v_nazwa FROM etaty
WHERE nazwa = v_etat;
FOR r_prac IN c_pracownicy(v_etat) LOOP
    DBMS_OUTPUT.PUT_LINE(r_prac.nazwisko);
END LOOP;
EXCEPTION
WHEN no_data_found THEN
DBMS_OUTPUT.PUT_LINE('Nie istnieje etat o nazwie '|| v_etat);
END;