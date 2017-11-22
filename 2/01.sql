DECLARE
  CURSOR c_pracownicy IS
    SELECT
      nazwisko,
      zatrudniony
    FROM PRACOWNICY
    WHERE ETAT = 'ASYSTENT';
  v_nazwisko PRACOWNICY.nazwisko%TYPE;
  v_zatrudniony PRACOWNICY.zatrudniony%TYPE;
BEGIN
  OPEN c_pracownicy;
  LOOP
    FETCH c_pracownicy INTO v_nazwisko, v_zatrudniony;
    EXIT WHEN c_pracownicy%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(v_nazwisko || ' pracuje od: ' || v_zatrudniony);
  END LOOP;
  CLOSE c_pracownicy;
END;
