SELECT p.ID_PRAC, p.NAZWISKO, p.PLACA_POD, p.etat, (SELECT SUM(PLACA_POD) AS suma
   FROM pracownicy
   WHERE ID_SZEFA = p.ID_PRAC) suma
FROM pracownicy p
WHERE p.etat = 'PROFESOR'