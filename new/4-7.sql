CREATE OR REPLACE FUNCTION SILNIA (p_liczba IN NUMBER) RETURN NUMBER IS
BEGIN
    IF (p_liczba < 2) THEN
        RETURN 1;
    ELSE
        RETURN p_liczba * SILNIA(p_liczba - 1);
    END IF;
END;