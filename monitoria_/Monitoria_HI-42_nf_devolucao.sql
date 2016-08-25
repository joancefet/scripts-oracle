select codfil, tpnota, numnota, serie, dtnota, status
from ent_itent where tpnota = 5 
and dtnota >='07/02/2014'
and vlicmret < 0
and status <> 9
group by codfil, tpnota, numnota, serie, dtnota, status