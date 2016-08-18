SELECT T1.CODFIL, T1.NUMCXA, T1.DTNOTA, T2.ENDERECOIP, T1.TOTAL_GEMCO, T1.TOTAL_IMPRESSORA, T1.DIV  FROM 
(
WITH MS AS 
(
            SELECT DISTINCT A.CODFIL, A.NUMCXA, A.DTNOTA, SUM(A.VLTOTAL) TOTAL_GEMCO
            FROM   MOV_SAIDA A
            WHERE  A.DTNOTA between '01/08/2016' and sysdate - 1 
                   AND A.TPNOTA = 512
                   AND A.STATUS <> 9
            GROUP  BY A.CODFIL, A.NUMCXA, A.DTNOTA
),

PF AS (
            SELECT DISTINCT B.CODFIL, B.PDV, B.DATA, SUM(B.VLCONT) TOTAL_IMPRESSORA
            FROM PDV_FISCAL B 
            WHERE B.TIPO = 'F'  AND B.DATA BETWEEN TO_DATE('&dataini') and sysdate - 2
            GROUP BY B.CODFIL, B.PDV, B.DATA  
            ) 
            
SELECT MS.CODFIL, MS.NUMCXA, MS.DTNOTA, MS.TOTAL_GEMCO, PF.TOTAL_IMPRESSORA, (TOTAL_IMPRESSORA - TOTAL_GEMCO) DIV
FROM   MS
LEFT  JOIN PF ON MS.CODFIL = PF.CODFIL
          AND MS.NUMCXA = PF.PDV
          AND MS.DTNOTA = PF.DATA
WHERE  (TOTAL_GEMCO-TOTAL_IMPRESSORA > 2) 
OR     (TOTAL_GEMCO-TOTAL_IMPRESSORA < -2)

----------------------------------------

UNION

SELECT * FROM(

            
SELECT DISTINCT A.CODFIL, A.NUMCXA, A.DTNOTA, SUM(A.VLTOTAL) TOTAL_GEMCO, 0 TOTAL_IMPRESSORA, 0
FROM   MOV_SAIDA A
WHERE  A.DTNOTA BETWEEN TO_DATE('&dataini') and sysdate - 2 
AND A.TPNOTA = 512
AND A.STATUS <> 9
AND A.SERIE LIKE '%U%'
 
GROUP  BY A.CODFIL, A.NUMCXA, A.DTNOTA) T1

WHERE T1.TOTAL_GEMCO > 0
AND NOT EXISTS (SELECT 1 FROM PDV_FISCAL P WHERE  1=1 
        AND P.DATA = t1.DTNOTA 
        AND P.CODFIL = t1.CODFIL
        AND P.PDV = t1.NUMCXA
        AND p.TIPO = 'F')
)T1

LEFT JOIN PDV_FISCAL T2 ON
T1.CODFIL =  T2.CODFIL 
AND T1.NUMCXA = T2.PDV 
AND T1.DTNOTA = T2.DATA
AND  T2.TIPO = 'F'
