DECLARE
CURSOR c_etaty IS
    SELECT NAZWA FROM ETATY;
CURSOR c_pracownicy (p_etat pracownicy.etat%TYPE) IS
    SELECT NAZWISKO, PLACA_POD FROM pracownicy
    WHERE etat = p_etat;
v_liczba_pracownikow NUMBER;
v_placa NUMBER;
BEGIN
FOR r_etat IN c_etaty LOOP
    v_liczba_pracownikow := 0;
    v_placa := 0;
    FOR r_prac IN c_pracownicy(r_etat.NAZWA) LOOP
        v_liczba_pracownikow := v_liczba_pracownikow + 1;
        v_placa := v_placa + r_prac.PLACA_POD;
        DBMS_OUTPUT.PUT_LINE(v_liczba_pracownikow || ' ' || r_prac.NAZWISKO || ', pensja: ' || r_prac.PLACA_POD );
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Liczba pracowników: ' || v_liczba_pracownikow);
    DBMS_OUTPUT.PUT_LINE('Średnia pensja: ' || v_placa / v_liczba_pracownikow);
END LOOP;
END;