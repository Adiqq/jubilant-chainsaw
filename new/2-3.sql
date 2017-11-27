DECLARE
CURSOR c_pracownicy IS
SELECT NAZWISKO, PLACA_POD FROM pracownicy WHERE TO_CHAR(ZATRUDNIONY,'DY') = 'PN' FOR UPDATE;
BEGIN
FOR r_prac IN c_pracownicy LOOP
    UPDATE pracownicy SET placa_pod = 1.2 * placa_pod
    WHERE CURRENT OF c_pracownicy;
END LOOP;
END;