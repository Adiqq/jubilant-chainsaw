CREATE OR REPLACE PACKAGE MODYFIKACJE IS
    PROCEDURE DodajKolumne(relacja VARCHAR2, kolumna VARCHAR2, typ_wartosci VARCHAR2);
    PROCEDURE UsunKolumne(relacja VARCHAR2, kolumna VARCHAR2);
    PROCEDURE ZmienTypKolumny(relacja VARCHAR2, kolumna VARCHAR2, typ_wartosci VARCHAR2, czy_zachowac_dane NUMBER);
END;
--
CREATE OR REPLACE PACKAGE BODY MODYFIKACJE IS
    sql_stmt VARCHAR2(200);
    PROCEDURE DodajKolumne(relacja VARCHAR2, kolumna VARCHAR2, typ_wartosci VARCHAR2) IS
    BEGIN
        sql_stmt := 'ALTER TABLE ' || relacja || ' ' || 'ADD ' || kolumna || ' ' || typ_wartosci;
        EXECUTE IMMEDIATE sql_stmt;
    END;
    PROCEDURE UsunKolumne(relacja VARCHAR2, kolumna VARCHAR2) IS
    BEGIN
        sql_stmt := 'ALTER TABLE ' || relacja || ' ' || 'DROP COLUMN ' || kolumna;
        EXECUTE IMMEDIATE sql_stmt;
    END;
    PROCEDURE ZmienTypKolumny(relacja VARCHAR2, kolumna VARCHAR2, typ_wartosci VARCHAR2, czy_zachowac_dane NUMBER) IS
    BEGIN
        IF czy_zachowac_dane = 1 THEN
            sql_stmt := 'ALTER TABLE ' || relacja || ' ' || 'MODIFY ' || kolumna || ' ' || typ_wartosci;
            EXECUTE IMMEDIATE sql_stmt;
        ELSIF czy_zachowac_dane = 0 THEN
            UsunKolumne(relacja, kolumna);
            DodajKolumne(relacja, kolumna, typ_wartosci);
        ELSE
            NULL;
        END IF;
    END;
END;
---
DROP TABLE TestTable;
CREATE TABLE TestTable(
Id Number PRIMARY KEY
);
---
INSERT INTO TestTable(Id) VALUES(1);
---
SELECT * FROM TestTable;
---
begin
    Modyfikacje.DodajKolumne('TestTable', 'Name', 'VARCHAR(40)');
    Modyfikacje.DodajKolumne('TestTable', 'PhoneNumber', 'VARCHAR(40)');
    EXECUTE IMMEDIATE 'INSERT INTO TestTable(Id,Name,PhoneNumber) VALUES(2, :1, :2)' USING 'test', '1';
    Modyfikacje.ZmienTypKolumny('TestTable', 'Name', 'VARCHAR(50)', 1);
    Modyfikacje.ZmienTypKolumny('TestTable', 'PhoneNumber', 'Number', 0);
    Modyfikacje.UsunKolumne('TestTable', 'Name');
    Modyfikacje.UsunKolumne('TestTable', 'PhoneNumber');
    EXECUTE IMMEDIATE 'DELETE FROM TestTable WHERE Id = 2';
end; 