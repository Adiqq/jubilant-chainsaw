CREATE OR REPLACE PROCEDURE IleRekordów(tableName VARCHAR) IS
    vCount NUMBER;
    sql_stmt VARCHAR2(100);
BEGIN
    sql_stmt := 'SELECT COUNT(*) AS "count" FROM :1 ' ||
    'RETURNING count INTO :2';
    EXECUTE IMMEDIATE sql_stmt
    USING tableName RETURNING INTO vCount;
    dbms_output.put_line('Liczba rekordów relacji ' || tableName || ': ' || vCount);
END;