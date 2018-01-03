CREATE OR REPLACE PROCEDURE IleRekordow(tableName VARCHAR) IS
    vCount NUMBER;
    sql_stmt VARCHAR2(200);
BEGIN
    sql_stmt := 'SELECT COUNT(*) FROM ' || tableName;
    EXECUTE IMMEDIATE sql_stmt INTO vCount;
    dbms_output.put_line('Liczba rekordów relacji ' || tableName || ': ' || vCount);
END;
--
begin
 IleRekordow('PRACOWNICY');
 IleRekordow('ZESPOLY');
 end; 