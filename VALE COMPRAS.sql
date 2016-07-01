SELECT *
FROM   CRC_TITULO
WHERE  1 = 1
AND CODFIL = &CODFIL
--AND DTEMISSAO = '16/09/2015'
--AND NUMRECDEVOL = (&RECIBO);
--AND NUMTIT = &NUMTIT
AND numped = 21378527
--AND               dtemissao = '17/08/2015'
--AND               numnota = 3952 --nota de saida
--AND               serie = 'U65's
--AND               cgccpf = '70979090130'
--AND               sldtit <> 0

SELECT *
FROM   CRC_LANCTO
WHERE  1 = 1
	  AND CODFIL = &CODFIL
	  AND numtit IN (2312327, 2311478)
	  AND NUMTIT = &NUMTITULO
--AND           NRDOCDEVOL = &NUMRECEBDEVOL


