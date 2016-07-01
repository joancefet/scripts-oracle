SELECT *
FROM   MOV_JORNAL
WHERE  --codfil = 31 and 
 CODMODULO = 7    	 6--notas de saída canceladas / 7 notas de entrada canceladas
 AND DATA >= '15/10/2015' -- 
 AND DESCRICAO LIKE '%421846%'
 AND REG_ID >= 400730411