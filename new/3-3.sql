DECLARE
v_Identyfikator PRACOWNICY.ID_PRAC%TYPE := '&IDPRAC';
v_nazwisko PRACOWNICY.NAZWISKO%TYPE := '&NAzwisko';
v_IDZESP PRACOWNICY.ID_ZESP%TYPE:= &IDZesp;
v_placaPod PRACOWNICY.PLACA_DOD%TYPE := &Placa_POD;
v_Check_IDZESP Number(9);
ex_Zesp EXCEPTION;
ex_ID EXCEPTION;
ex_PlacaPod EXCEPTION;
PRAGMA EXCEPTION_INIT(ex_ID, -1400);
PRAGMA EXCEPTION_INIT(ex_PlacaPod, -2290);
PRAGMA EXCEPTION_INIT(ex_Zesp, -2291);
BEGIN
IF (v_Identyfikator is null OR v_Identyfikator = '') THEN
        
RAISE ex_ID;
    
END IF;
IF (v_placaPod<101) THEN
RAISE ex_PlacaPod;
END if;
SELECT COUNT(*) into v_Check_IDZESP  
FROM ZESPOLY 
WHERE ID_ZESP = v_IDZESP;
IF (v_Check_IDZESP <1) THEN
RAISE ex_Zesp;
END IF;
INSERT INTO PRACOWNICY( ID_PRAC,NAZWISKO,ID_zesp,Placa_pod) 
VALUES (v_Identyfikator,v_nazwisko, v_IDZESP, v_placaPod);
EXCEPTION
    
WHEN DUP_VAL_ON_INDEX THEN
        
DBMS_OUTPUT.PUT_LINE('użytkownik  podał  identyfikator,  którego  wartość  dubluje  istniejące  już  identyfikatory pracowników');
    
WHEN ex_ID THEN
        
DBMS_OUTPUT.PUT_LINE('użytkownik nie podał wartości identyfikator');
    
WHEN ex_PlacaPod THEN
        
DBMS_OUTPUT.PUT_LINE('użytkownik podał wartość płacy mniejszą niż 101');
    
WHEN ex_Zesp THEN
        
DBMS_OUTPUT.PUT_LINE('Nie ma takiego zespolu');
    
WHEN OTHERS THEN
        
DBMS_OUTPUT.PUT_LINE('Inny błąd');

END;