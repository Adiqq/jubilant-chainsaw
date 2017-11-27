declare
    v_liczba number(3) := &liczba;
    v_wynik number(10) := 1;
begin
    IF (v_liczba = 0) THEN
        dbms_output.put_line('1');
    ELSE
        WHILE(v_liczba > 0) LOOP
            v_wynik := v_wynik * v_liczba;
            v_liczba := v_liczba - 1;
        END LOOP;
        dbms_output.put_line(v_wynik);
    END IF;
end;