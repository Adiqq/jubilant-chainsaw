declare
  n number := &liczba;
  temp number;
  suma number := 1;
begin
  temp := n;
  while temp>0 loop
    suma := temp*suma;
    temp := temp-1;
  end loop;
  dbms_output.put_line('Silnia ' || n || ' = '|| suma);
end;
