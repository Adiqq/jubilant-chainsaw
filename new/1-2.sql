declare
    v_tekst varchar(100) := 'Witaj, świecie!';
    v_liczba number := 1000.456 ;
    
begin
    v_tekst := v_tekst || ' Witaj, nowy dniu!';
    v_liczba := v_liczba + 10e+15;
    dbms_output.put_line('Zmienna v_tekst: ' || v_tekst);
    dbms_output.put_line('Zmienna v_liczba: ' || v_liczba);
end;