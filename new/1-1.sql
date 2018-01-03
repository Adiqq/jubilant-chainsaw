declare
    v_tekst varchar(100) := 'Witaj, świecie!';
    v_liczba number := 1000.456 ;
begin
    dbms_output.put_line('Zmienna v_tekst: ' || v_tekst);
    dbms_output.put_line('Zmienna v_liczba: ' || v_liczba);
end;