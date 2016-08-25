SELECT mi.CODFIL,  mi.NUMNOTA, mi.SERIE, mi.dtnota, MI.VLTOTAL, MI.VLTOTITEM, NVL(MI.VLFRETE,0) FRETE, VLDESCITEM, VLDESCITEMRAT, VLFRETERAT, 'S',mi.tpnota
     FROM MOV_ITSAIDA MI
     Where
     MI.DTATUEST >= '07/02/2014'   --informar o dia
     AND MI.TPNOTA = 512
     AND (MI.VLTOTAL <> round(MI.VLTOTITEM + NVL(MI.VLFRETE,0),2)   or MI.VLTOTAL < 0 OR NVL(MI.VLFRETE,0) < 0)
     Union
     SELECT mi.CODFIL,  mi.NUMNOTA, mi.SERIE,  mi.dtnota, MI.VLTOTAL, MI.VLTOTITEM, NVL(MI.VLFRETE,0) FRETE, VLDESCITEM, VLDESCITEMRAT, 0, 'E',mi.tpnota
     FROM ENT_ITENT MI
     Where
     MI.DTATUEST >= '07/02/2014' --informar o dia
     AND MI.TPNOTA IN(59,53,5)
     AND (MI.VLTOTAL <> round(MI.VLTOTITEM + NVL(MI.VLFRETE,0),2)   or MI.VLTOTAL < 0 OR NVL(MI.VLFRETE,0) < 0)