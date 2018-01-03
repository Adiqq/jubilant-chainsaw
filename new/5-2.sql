CREATE OR REPLACE PACKAGE ZMIENNE IS
    PROCEDURE ZwiekszLicznik;
    PROCEDURE ZmniejszLicznik;
    FUNCTION PokazLicznik RETURN NUMBER;
END ZMIENNE;
--
CREATE OR REPLACE PACKAGE BODY ZMIENNE IS
    vLicznik NUMBER;
    PROCEDURE ZwiekszLicznik IS
    BEGIN
        vLicznik := vLicznik + 1;
        dbms_output.put_line('Zwiększono licznik');
    END ZwiekszLicznik;
    PROCEDURE ZmniejszLicznik IS
    BEGIN
        vLicznik := vLicznik - 1;
        dbms_output.put_line('Zmniejszono licznik');
    END ZmniejszLicznik;
    FUNCTION PokazLicznik RETURN NUMBER IS
    BEGIN
        RETURN vLicznik;
    END PokazLicznik;
BEGIN
    vLicznik := 0;
    dbms_output.put_line('Zainicjalizowano');
END ZMIENNE;
--
begin
    Zmienne.ZwiekszLicznik;
    dbms_output.put_line(Zmienne.PokazLicznik);
    Zmienne.ZwiekszLicznik;
    dbms_output.put_line(Zmienne.PokazLicznik);
end; 