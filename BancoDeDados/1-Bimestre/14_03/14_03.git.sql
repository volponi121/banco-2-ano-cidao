CREATE OR REPLACE FUNCTION RNOME_CLIENTE (CCODIGO IN NUMBER) RETURN
VARCHAR2 IS
  NOME VARCHAR2(100);
BEGIN
SELECT C.NOME INTO NOME FROM CLIENTE C WHERE C.CODCLIENTE = CCODIGO;
RETURN NOME;
EXCEPTION
WHEN NO_DATA_FOUND THEN
  NOME:='Cliente Não Encontrado';
  RETURN NOME;
END;

SELECT RNOME_CLIENTE(1)FROM DUAL; --Chamando a Função

SELECT CODPEDIDO, CODCLIENTE, RNOME_CLIENTE(CODCLIENTE) AS NOME, VALORTOTAL
FROM PEDIDO; --FUNCIONA COMO UM INNER JOIN

SELECT * FROM CLIENTE

-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE RQTDE_VALOR(CCODIGO IN NUMBER, RQTDE OUT NUMBER, RVALOR OUT NUMBER)IS
BEGIN
  SELECT SUM(IP.QUANTIDADE),SUM(IP.VALORUNITARIO*IP.QUANTIDADE) INTO RQTDE,RVALOR FROM ITEMPEDIDO IP
  INNER JOIN PEDIDO P ON IP.CODPEDIDO=P.CODPEDIDO
  WHERE P.CODCLIENTE = CCODIGO;
  
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RQTDE  :=0;
    RVALOR :=0; 
END;

DECLARE
  vQtde ITEMPEDIDO.QUANTIDE%TYPE;
  vValor ITEMPEDIDO.VALORUNITARIO%TYPE;
  vNome VARCHAR2(100);
BEGIN
  RQTDE_VALOR(3,vQtde,vValor);
  vNome := RNOME_CLIENTE(1);
  Dbms_output.put_line(' Qtde: ' || vQtde || ' Valor: ' || vValor);
END;