SELECT *
FROM   PDV_FISCAL
WHERE  DATA >= TRUNC(SYSDATE + 1)
       AND GRANTOTAL = GRANTOTALANT
       AND MOVDIA = 0

UNION
SELECT *
FROM   PDV_FISCAL
WHERE  DATA >= TRUNC(SYSDATE)
       AND TIPO = 'F'
       AND MOVDIA = 0
