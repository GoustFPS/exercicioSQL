CREATE OR REPLACE FUNCTION contar_clientes_cadastrados_no_dia(data_alvo IN DATE)
  RETURN NUMBER
IS
  total_clientes NUMBER := 0;
BEGIN
  FOR cliente IN (SELECT * FROM tabela_clientes WHERE TRUNC(data_cadastro) = TRUNC(data_alvo)) LOOP
    total_clientes := total_clientes + 1;
  END LOOP;

  RETURN total_clientes;
END contar_clientes_cadastrados_no_dia;
/
