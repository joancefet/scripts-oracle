select codfil Fil, tpnota, codcli, numpedven Ped, dtpedido Data, coditprod Prod,precounit, codvendr, filorig,codembal,  
item, status, qtorig, qtcomp, qtfat, qtlib, qtreslib, qtcorte, flsepped_lmer, tpped, vlfrete, vldescfrete, vldescitemrat , 
vldesprat, vljuros, vljurosfin, dtentrega, codembal, mov_itped.vlipi,
sitcarga, flpedvenender MOVITENDER,flsepararetdep SEPAUT, fllotevencto Ton, 
fllibfat, QTCONFSEP_lmer, flvdantec
from mov_itped
where numpedven = 21463390
--and status not in (6,9) -- S� PEGA OS ITENS PENDENTES

--CONDI��ES PARA FATURAMENTO PARA SA�DA DEP�SITO 
-- QT LIB > 0
-- QTCONFSEP --  CONFIRMADO SEPARA��O
-- QT CORTE PREENCHIDO
-- SEPAUTO SE FOR = S ENT�O N�O PRECISA SEPARAR POR LOTE OU POR GEST�O (QTCORTE 

