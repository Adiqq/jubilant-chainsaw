declare
    v_nazwisko PRACOWNICY.NAZWISKO%TYPE;
    v_etat PRACOWNICY.ETAT%TYPE;
    v_id PRACOWNICY.ID_PRAC%TYPE;
    
begin
    SELECT ID_PRAC INTO v_id
    FROM PRACOWNICY 
    WHERE ROWNUM <= 1 
    ORDER BY PLACA_POD DESC;  
    
    SELECT NAZWISKO, ETAT INTO v_nazwisko,v_etat
    FROM PRACOWNICY 
    WHERE ID_PRAC = v_id;
    
    dbms_output.put_line('Najlepiej zarabia pracownik ' || v_nazwisko || '.');
    dbms_output.put_line('Pracuje on jako ' || v_etat || '.');
end;