declare
    v_choice number(1) := &wybor;
    
begin
    IF (v_choice = 0) THEN
    dbms_output.put_line(TO_CHAR(SYSDATE, 'DD-MM-YYYY'));
    ELSE
    dbms_output.put_line(TO_CHAR(SYSDATE, 'HH24:MI:SS'));
    END IF;
end;