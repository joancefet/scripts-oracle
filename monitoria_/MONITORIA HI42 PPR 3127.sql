select codfil, numnota, serie, dtnota, dtatuest, coditprod, qtcomp, vldescitem, vltotitem, vlfrete, vlfreterat, vltotal, 
((vltotitem+nvl(vlfrete,0))-nvl(vltotal,0))
from mov_itsaida 
where dtatuest >= trunc(sysdate) -1
and (vltotitem+nvl(vlfrete,0)) <> nvl(vltotal,0)
and (((vltotitem+nvl(vlfrete,0))-nvl(vltotal,0))<-0.01 or ((vltotitem+nvl(vlfrete,0))-nvl(vltotal,0))> 0.01)
and tpnota = 512
and status <> 9