declare
    v_promien number := &promien;
    v_pole number;
    v_obwod number;
    pi CONSTANT number := 3.14;
    
begin
    v_pole := pi * POWER(v_promien,2);
    v_obwod := 2 * pi * v_promien;
    dbms_output.put_line('Promien: ' || v_promien);
    dbms_output.put_line('Pole: ' || v_pole);
    dbms_output.put_line('Obwod: ' || v_obwod);
end;