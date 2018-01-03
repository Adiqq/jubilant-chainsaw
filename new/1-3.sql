declare
    v_liczba number := &liczba;
    v_liczba2 number := &liczba2;
    v_result number;
    
begin
    v_result := v_liczba + v_liczba2;
    dbms_output.put_line('Wynik dodawania ' || v_liczba || ' i ' || v_liczba2 || ': ' || v_result);
end;