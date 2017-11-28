DECLARE
TYPE tKursor IS REF CURSOR;
v_zmienna_kur tKursor;
r_pracownik pracownicy%ROWTYPE; r_zespol zespoly%ROWTYPE;
v_id_zesp NUMBER;
BEGIN
SELECT id_ZESP INTO v_id_zesp FROM pracownicy
GROUP BY id_ZESP
HAVING MAX(to_char(to_date('','dd-mon-yy'),'mm'))
OPEN v_zmienna_kur FOR SELECT * FROM pracownicy;
    LOOP
    FETCH v_zmienna_kur INTO r_pracownik;
    EXIT WHEN v_zmienna_kur %NOTFOUND;
    DBMS_OUTPUT.PUT_LINE (r_pracownik.nazwisko);
    END LOOP;    LOOP
    FETCH v_zmienna_kur INTO r_pracownik;
    EXIT WHEN v_zmienna_kur %NOTFOUND;
    DBMS_OUTPUT.PUT_LINE (r_pracownik.nazwisko);
    END LOOP;

CLOSE v_zmienna_kur;
OPEN v_zmienna_kur FOR SELECT * FROM zespoly;
    LOOP
    FETCH v_zmienna_kur INTO r_zespol;
    EXIT WHEN v_zmienna_kur %NOTFOUND;
    DBMS_OUTPUT.PUT_LINE (r_zespol.nazwa);
    END LOOP;
CLOSE v_zmienna_kur;
END;