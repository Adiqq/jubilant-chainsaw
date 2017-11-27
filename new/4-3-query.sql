VARIABLE v_pracownicy NUMBER
VARIABLE v_zespol VARCHAR2(20)
exec :v_zespol := 'ADMINISTRACJA';
exec LICZBA_PRACOWNIKOW(:v_zespol,:v_pracownicy);
PRINT v_pracownicy 