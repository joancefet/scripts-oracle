-- Chamados
SELECT TOP 10 * 
FROM CALL_REQ

-- Chamados
SELECT TOP 10 *
FROM ISSUE

--Contatos
SELECT TOP 10 *
from ca_contact

-- CR STAT
SELECT id, persid, del, sym, last_mod_dt, last_mod_by, description, code, active, hold, resolved, cr_flag, in_flag, pr_flag, tenant, fcr
FROM CR_STAT

-- LOCAIS
SELECT * FROM CA_LOCATION


-- Departamentos
SELECT TOP 100 * FROM CA_RESOURCE_DEPARTMENT


-- Tipos de chamados
SELECT TOP 100 * FROM PROB_CTG