DECLARE
v_nazwisko PRACOWNICY.NAZWISKO%TYPE := '&nazwisko';
v_CheckPracowniuj NUMBER(9);
v_CheckPrzelozony NUMBER(9);
ex_szef EXCEPTION;
PRAGMA EXCEPTION_INIT(ex_szef, -2292); 

BEGIN
    
SELECT COUNT(*) into v_CheckPracowniuj 
FROM PRACOWNICY 
WHERE NAZWISKO = v_nazwisko;
    
IF (v_CheckPracowniuj < 1 ) THEN 
RAISE_APPLICATION_ERROR(-20020, 'Nie istnieje taki pracownik');
END IF;
    
IF (v_CheckPracowniuj > 1 ) THEN  
RAISE_APPLICATION_ERROR(-20030, 'Niejednoznaczne  wskazanie pracownika');
END IF;
    
SELECT COUNT(*) into v_CheckPrzelozony 
FROM PRACOWNICY 
WHERE ID_SZEFA = (SELECT ID_PRAC FROM PRACOWNICY WHERE nazwisko = v_nazwisko);

IF (v_CheckPrzelozony>0) THEN  
RAISE_APPLICATION_ERROR(-20040, 'Nie możesz usunąć przełożonego');
END IF;
        
DELETE FROM PRACOWNICY WHERE NAZWISKO = v_nazwisko;

EXCEPTION

WHEN ex_szef THEN
         
DBMS_OUTPUT.PUT_LINE('przy próbie usunięcia rekordu, dla którego istnieją przywiązane kluczem obcym rekordy  w  innej  relacji');

END;