declare
    SUBTYPE TPieniadze IS NUMBER(9,2);
    v_pieniadze TPieniadze;
    
begin
    SELECT PLACA_POD * 12 INTO v_pieniadze
    FROM PRACOWNICY 
    WHERE NAZWISKO = 'SLOWINSKI';
    
    dbms_output.put_line('Pracownik SLOWINSKI zarabia rocznie ' || v_pieniadze);
end;