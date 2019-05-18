-- PIVOT
create table teste as
   select * from (
  select CD_DEPTO,NR_CARGO
  from FUNC F)
  pivot
  (
    count(NR_CARGO)
    for NR_CARGO IN (54,42,43,53)
  )
  order by CD_DEPTO;

--UNPIVOT
create table teste2 as
select * from teste 
  unpivot
  ( QTDE
    for NR_CARGO in ("54","42","43","53")
  )
  order by CD_DEPTO,NR_CARGO;

drop table teste;
drop table teste2;
select * from teste;
select * from teste2;

SELECT IC.INDEX_NAME,IC.COLUMN_NAME,IC.COLUMN_POSITION COL_POS,IX.UNIQUENESS 
  FROM USER_INDEXES IX,USER_IND_COLUMNS IC 
  WHERE IC.INDEX_NAME = IX.INDEX_NAME AND IC.TABLE_NAME = 'FUNC';

CREATE INDEX CIDAOFOFO ON FUNC(NM_FUNC DESC);  
DROP INDEX CIDAOFOFO;

