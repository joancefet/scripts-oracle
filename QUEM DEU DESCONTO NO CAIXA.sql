select a.codfil, a.tpnota, a.dtnota, a.numnota, a.serie, a.coditprod, a.qtcomp, a.descricao,
a.codsupervisorcancel Supervisor, b.nome, a.codoper Operador, c.nome
from pdv_jornal a, cxa_operador b, cxa_operador c
where a.codfil = 3
and a.serie = 'U03'
and dtnota = '16/10/2015'
and a.codsupervisorcancel = b.codoper
and a.codoper = c.codoper
and a.codfil = b.codfil
and a.codfil = c.codfil