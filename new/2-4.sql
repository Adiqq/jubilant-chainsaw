DECLARE
CURSOR c_pracownicy IS
SELECT p.NAZWISKO, p.PLACA_POD, p.etat, z.NAZWA FROM pracownicy p LEFT JOIN zespoly z ON z.ID_ZESP = p.ID_ZESP FOR UPDATE;
BEGIN
FOR r_prac IN c_pracownicy LOOP
    IF (r_prac.nazwa = 'ALGORYTMY') THEN
        UPDATE pracownicy SET placa_pod = placa_pod + 100
        WHERE CURRENT OF c_pracownicy;
    ELSIF (r_prac.nazwa = 'ADMINISTRACJA') THEN
        UPDATE pracownicy SET placa_pod = placa_pod + 150
        WHERE CURRENT OF c_pracownicy;
    ELSIF (r_prac.etat = 'STAZYSTA') THEN
        DELETE pracownicy 
        WHERE CURRENT OF c_pracownicy;
    END IF;
END LOOP;
END;