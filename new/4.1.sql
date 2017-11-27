CREATE OR REPLACE PROCEDURE PODWYZKA(
    p_id_zesp IN number DEFAULT 10,
    p_pod IN number DEFAULT 0) IS
    
    CURSOR c_pracownicy IS
    SELECT NAZWISKO, PLACA_POD FROM PRACOWNICY WHERE ID_ZESP = p_id_zesp FOR UPDATE;
BEGIN
FOR r_prac IN c_pracownicy LOOP
    UPDATE pracownicy SET placa_pod = r_prac.placa_pod + (r_prac.placa_pod * (p_pod/100))
    WHERE CURRENT OF c_pracownicy;
END LOOP;
END PODWYZKA;