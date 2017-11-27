DECLARE
CURSOR c_pracownicy IS
SELECT p.ID_PRAC, p.NAZWISKO, p.PLACA_POD, p.etat, (SELECT SUM(PLACA_POD) AS suma
   FROM pracownicy
   WHERE ID_SZEFA = p.ID_PRAC) suma
FROM pracownicy p
WHERE p.etat = 'PROFESOR' FOR UPDATE;
BEGIN
FOR r_prac IN c_pracownicy LOOP
    IF (r_prac.placa_pod + (r_prac.suma * 0.1)  < 2000) THEN
        UPDATE pracownicy SET placa_pod = r_prac.placa_pod + (r_prac.suma * 0.1)
        WHERE CURRENT OF c_pracownicy;
    ELSE
        RAISE_APPLICATION_ERROR(-20010, 'Pensja po podwyżce przekroczyłaby 2000!');
    END IF;
END LOOP;
END;