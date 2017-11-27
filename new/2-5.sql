DECLARE
CURSOR c_pracownicy (p_etat pracownicy.etat%TYPE) IS
    SELECT NAZWISKO FROM pracownicy
    WHERE etat = p_etat;
v_etat pracownicy.etat%TYPE := &etat;
    
BEGIN
FOR r_prac IN c_pracownicy(v_etat) LOOP
    DBMS_OUTPUT.PUT_LINE(r_prac.nazwisko);
END LOOP;
END;