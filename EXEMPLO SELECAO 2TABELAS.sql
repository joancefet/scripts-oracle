SELECT T1.DATA, T2.DTNOTA, T2.TPNOTA, T2.NUMNOTA FROM

EXPLAIN SELECT DATA FROM PDV_FISCAL T1
INNER JOIN

(SELECT NUMNOTA, TPNOTA, DTNOTA FROM MOV_SAIDA) T2

ON T1.DATA = T2.DTNOTA
AND T2.NUMNOTA = 15918


EXPLAIN SELECT * FROM clientes c JOIN enderecos e ON c.id = e.id_cliente;
EXPLAIN SELECT * FROM clientes c, enderecos e WHERE c.id = e.id_cliente;
