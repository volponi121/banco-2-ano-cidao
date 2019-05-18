CREATE OR REPLACE FUNCTION TOT_PEDIDOS (TCODIGO IN NUMBER) RETURN
FLOAT IS
  VALORTOTAL FLOAT;
BEGIN

SELECT SUM(VALORTOTAL) INTO VALORTOTAL FROM PEDIDO WHERE CODCLIENTE = TCODIGO;
RETURN VALORTOTAL;

  EXCEPTION
  WHEN NO_DATA_FOUND THEN
  RETURN 0;
END;
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION QTDE_PRODUTO (PCODIGO IN NUMBER) RETURN 
NUMBER IS
  QTDE NUMBER;
  CURSOR C1 IS SELECT IP.CODPRODUTO, IP.CODPEDIDO, IP.QUANTIDADE 
  FROM ITEMPEDIDO IP  
  WHERE IP.CODPRODUTO = PCODIGO;
  
  RC1 C1%ROWTYPE;
  
BEGIN
OPEN C1;
QTDE := 0;
LOOP
  FETCH C1 INTO RC1;
  EXIT WHEN C1%NOTFOUND;
  QTDE:= QTDE + RC1.QUANTIDADE;
END LOOP;
INS_REQUISICAO(PCODIGO,QTDE);
CLOSE C1;
RETURN QTDE;

  EXCEPTION
  WHEN NO_DATA_FOUND THEN
  RETURN 0;
END;
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE INS_REQUISICAO (PCODIGO IN NUMBER,PQTDE IN NUMBER) IS
BEGIN
  INSERT INTO REQUISICAO_COMPRA(CODREQUISICAOCOMPRA,CODPRODUTO,DATA,QUANTIDADE) 
  VALUES (SQ_CODREQUISICAO.NEXTVAL,PCODIGO,SYSDATE,PQTDE);
END;
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
CREATE SEQUENCE SQ_CODREQUISICAO
START WITH 1
INCREMENT BY 1;
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
DECLARE
  QTDE NUMBER;
BEGIN
  qtde := QTDE_PRODUTO(1);
  DBMS_OUTPUT.PUT_LINE('QUANTIDADE VENDIDA: '||qtde);
END;
