-- COLUNA: VALE CREDITOS "A" (PENDENTE)
SELECT SUM(CL.VALLAN)
FROM   (SELECT DATENT, CODFILCXA, VALLAN, STATUS, CODEVE, FORMA, CONDPGTO, CODFIL, CODOPER, NUMCXA, NUMMOV
         FROM   CXA_LANCTO
         WHERE  DATENT >= &DATA
	      AND STATUS <> 9
	      AND CODEVE <> 26) CL
INNER  JOIN CXA_EVENTO CE ON CL.FORMA = CE.CODEVE
		         AND CE.CODEVE <> 19
		         AND CE.RECDEV = 'S'
		         AND (CE.FLEMITECOBRANCA NOT IN ('B', 'C') OR
		         CE.FLEMITECOBRANCA IS NULL)
INNER  JOIN CAD_FORMA CF ON CL.FORMA = CF.FORMA
		        AND CL.CONDPGTO = CF.CONDPGTO
		        AND CL.CODFIL = CF.CODFIL
		        AND ((CF.GERCXA = 'S') OR (CF.FLGERAER = 'S'))
INNER  JOIN CXA_MOVIMENTO CM ON CL.CODFILCXA = CM.CODFIL
			  AND CL.CODOPER = CM.CODOPER
			  AND CL.NUMCXA = CM.NUMCXA
			  AND CL.NUMMOV = CM.NUMMOV
			  AND CL.DATENT = CM.DATAINI
			  AND CL.CODFILCXA = &CODFIL
			  AND CL.DATENT = &DATA
