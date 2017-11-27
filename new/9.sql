declare
    v_choice number(1) := &wybor;
    
begin
    CASE v_choice
        WHEN 0 THEN dbms_output.put_line(TO_CHAR(SYSDATE, 'DD-MM-YYYY'));
        WHEN 1 THEN dbms_output.put_line(TO_CHAR(SYSDATE, 'HH24:MI:SS'));
        ELSE dbms_output.put_line('');
    END CASE;
end;