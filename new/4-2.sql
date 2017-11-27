CREATE OR REPLACE PROCEDURE PODWYZKA(
    p_id_zesp IN number DEFAULT 10,
    p_pod IN number DEFAULT 0) IS
    
    CURSOR c_pracownicy IS
    SELECT NAZWISKO, PLACA_POD FROM PRACOWNICY WHERE ID_ZESP = p_id_zesp FOR UPDATE;
    v_zesp_id zespoly.id_zesp%TYPE;
BEGIN
SELECT id_zesp INTO v_zesp_id FROM zespoly
WHERE id_zesp = p_id_zesp;
FOR r_prac IN c_pracownicy LOOP
    UPDATE pracownicy SET placa_pod = r_prac.placa_pod + (r_prac.placa_pod * (p_pod/100))
    WHERE CURRENT OF c_pracownicy;
END LOOP;
EXCEPTION
WHEN no_data_found THEN
    RAISE_APPLICATION_ERROR(-20010, 'Brak zespolu o podanym numerze ');
END PODWYZKA;