CREATE OR REPLACE FUNCTION SILNIA (p_liczba IN NUMBER) RETURN NUMBER IS
v_wynik NUMBER := 1;
v_liczba NUMBER := p_liczba;

BEGIN
    IF (v_liczba = 0) THEN
        v_wynik := 0;
    ELSE
        WHILE v_liczba > 0
        LOOP
            v_wynik := v_wynik * v_liczba;
            v_liczba := v_liczba - 1;
        END LOOP;
    END IF;
    RETURN v_wynik;
END;