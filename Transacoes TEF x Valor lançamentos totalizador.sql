SELECT  TEF, LANCTO, TEF-LANCTO DIV FROM (SELECT SUM(VLTRANSACAO) TEF 
	  FROM TRANSACOES_TEF A
WHERE 
	 A.FILIAL = &FILIAL
	 AND DTTRANSACAO = TO_DATE('&DATA')
	 AND STATUS <> 9) T1,

(SELECT LANCTO FROM (SELECT SUM(B.VALLAN) LANCTO
FROM CXA_LANCTO B
WHERE B.CODFIL = &FILIAL
AND B.DATENT = TO_DATE('&DATA')
AND B.CODEVE IN (6,7)
AND B.STATUS <> 9) T2);