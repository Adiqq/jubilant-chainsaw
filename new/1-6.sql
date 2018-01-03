declare
    v_row PRACOWNICY%ROWTYPE;
    
begin
    SELECT * INTO v_row
    FROM PRACOWNICY 
    WHERE ROWNUM <= 1 
    ORDER BY PLACA_POD DESC;  
    
    dbms_output.put_line('Najlepiej zarabia pracownik ' || v_row.NAZWISKO || '.');
    dbms_output.put_line('Pracuje on jako ' || v_row.ETAT || '.');
end;