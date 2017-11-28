CREATE OR REPLACE FUNCTION STAZ (p_zatrudniony IN DATE) RETURN NUMBER IS
v_years number;
BEGIN
    select months_between(TRUNC(sysdate),
                      p_zatrudniony
                     )/12 INTO v_years from dual;
    RETURN ROUND(v_years, 0);
END;