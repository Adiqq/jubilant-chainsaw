DECLARE
TYPE tKursor IS REF CURSOR;
CURSOR cWszystko IS
SELECT nazwa, CURSOR(SELECT nazwisko FROM pracownicy
p
WHERE id_zesp = z.id_zesp ORDER BY nazwisko) AS pracownik
FROM zespoly z ORDER BY nazwa;
v_pracownicy tKursor;
v_nazwa zespoly.nazwa%TYPE;
v_nazwisko pracownicy.nazwisko%TYPE;
v_liczba_pracownikow NUMBER;
v_placa NUMBER;
BEGIN
OPEN cWszystko;
    LOOP
    FETCH cWszystko INTO v_nazwa, v_pracownicy;
    EXIT WHEN cWszystko %NOTFOUND;
    DBMS_OUTPUT.PUT_LINE ('Zespół: '||v_nazwa);
        LOOP -- brak OPEN
            FETCH v_pracownicy INTO v_nazwisko;
            EXIT WHEN v_pracownicy%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE(v_pracownicy%ROWCOUNT||' '||v_nazwisko);
        END LOOP; -- brak CLOSE
    END LOOP;
CLOSE cWszystko;
END;