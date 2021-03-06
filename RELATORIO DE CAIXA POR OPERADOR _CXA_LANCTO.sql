/* SELECTS QUE ATENDAM DIVERGÊNCIAS NO RELATÓRIO DE CAIXA POR OPERADOR */

-- SELECT * SOMATÓRIA CXA_LANCTO -- NFCE
SELECT T1.CODFIL, T1.NUMCXA, T1.DATENT, T1.CODOPER, T1.NUMNOT, T1.SOMALANCTO, B.CHAVENFE FROM (
SELECT DISTINCT CODFIL, NUMCXA, DATENT, CODOPER, NUMNOT, SUM(VALLAN) SOMALANCTO
FROM CXA_LANCTO A
WHERE CODFIL = &filial
AND NUMCXA = &caixa
AND DATENT = '&data'
AND CODEVE = &evento
AND CODOPER = &OPERADOR
GROUP BY  CODFIL, NUMCXA, DATENT, CODOPER, NUMNOT) T1

LEFT JOIN MOV_SAIDA B

ON  T1.CODFIL = B.CODFIL
	     AND T1.NUMCXA =  B.NUMCXA
	     AND T1.NUMNOT = B.NUMNOTA
	     AND T1.DATENT =  B.DTNOTA
