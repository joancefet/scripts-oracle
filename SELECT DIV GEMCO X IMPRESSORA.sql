SELECT S2-S1 AS "MOV_SAIDA - PDV_FISCAL" FROM 
(
SELECT SUM(VLTOTAL) S1 FROM   MOV_SAIDA
WHERE  CODFIL = &FILIAL
       AND NUMCXA = &CAIXA
       AND DTNOTA = '&DATA' --INSERÇÃO DE DATA: 01062016 EXEMPLO
       AND TPNOTA = 512
       AND STATUS <> 9) T1,


--select totalizador na impressora fiscal
(SELECT VLCONT S2
FROM   PDV_FISCAL
WHERE  CODFIL = &FILIAL
       AND PDV = &CAIXA  
       AND TIPO = 'F'
       AND DATA = '&DATA')  T2
       
       
--PRONTO
