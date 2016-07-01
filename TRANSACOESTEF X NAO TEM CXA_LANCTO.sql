SELECT A.*
FROM   TRANSACOES_TEF A
WHERE  1 = 1
       AND A.FILIAL = 9
       AND A.NUMCXA = 43
       AND A.DTTRANSACAO = '12/01/2016'
       --       AND MS.NUMNOTA IN (275176)
       AND NOT EXISTS
                      (SELECT 1
                       FROM   CXA_LANCTO L
                       WHERE  1=1
                       AND A.FILIAL = L.CODFIL
                       AND A.NUMCXA = L.NUMCXA 
                       AND A.NUMCUPOM =  L.NUMNOT)
