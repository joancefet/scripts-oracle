--Selects usados no oracle
SELECT USERNAME FROM DBA_USERS WHERE USERNAME LIKE 'USER%'

SELECT * FROM GLOBAL_NAME

SELECT * FROM V$SESSION

SELECT USERNAME FROM DBA_USERS WHERE USERNAME

SELECT * FROM DBA_TAB_PRIVS WHERE GRANTEE = '%DBCONSULT'

SELECT * FROM DBA_ROLE_PRIVS WHERE GRANTEE LIKE '%DBCONSULT'

SELECT * FROM DBA_OBJECTS WHERE OBJECT_NAME LIKE '%CXA_SANGRIA%'
