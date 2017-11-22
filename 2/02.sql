LARE
  CURSOR c_pracownicy IS
    SELECT
      nazwisko
    FROM PRACOWNICY
    ORDER BY (PLACA_POD + NVL(PLACA_DOD,  0)) DESC
    ;
  v_nazwisko PRACOWNICY.nazwisko%TYPE;
BEGIN
  OPEN c_pracownicy;
  LOOP
    FETCH c_pracownicy INTO v_nazwisko;
    EXIT WHEN c_pracownicy%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(c_pracownicy%ROWCOUNT || ' : ' || v_nazwisko);
    EXIT WHEN c_pracownicy%ROWCOUNT = 3;
  END LOOP;
  CLOSE c_pracownicy;
END;
