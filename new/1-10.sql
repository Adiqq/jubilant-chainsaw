begin
LOOP
    IF TO_CHAR(SYSDATE, 'SS') = '25' THEN
    dbms_output.put_line(TO_CHAR(SYSDATE, 'HH24:MI:SS'));
    dbms_output.put_line('Nadeszla 25 sekunda');
    EXIT;
    END IF;
END LOOP;
end;