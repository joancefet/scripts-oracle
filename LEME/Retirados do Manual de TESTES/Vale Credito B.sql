-- COLUNA: VALE CREDITO "B"
SELECT SUM(ENT_NOTA.VLTOTAL)
FROM   DBAGEMCO_P.ENT_NOTA ENT_NOTA
WHERE  (ENT_NOTA.TPNOTA IN (5, 53, 59))
       AND (ENT_NOTA.STATUS <> 9)
       AND (ENT_NOTA.DTNOTA = &DATA)
       AND (ENT_NOTA.CODFIL IN (&CODFIL, &CODDEPOS))
