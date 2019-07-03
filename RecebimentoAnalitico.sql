-- Analitico - ETL

-- RECEBIMENTO
select
  a.numtransvenda,
  a.prest,
  a.codfilial,
  a.codcli,
  b.estcob || ' - ' || b.cliente CLIENTE,
  a.codusur,
  b.estcob || ' - ' || d.nome vendedor,
  a.duplic,
  a.prest,
  a.dtvenc,
  a.codcob,
  c.cobranca,
  a.valor,
  a.vpago,
  a.dtpag,
  a.dtemissao
from
  pcprest a
  join pcclient b on b.codcli = a.codcli
  join pccob c on c.codcob = a.codcob
  join pcusuari d on d.codusur = a.codusur 
where
  a.codcob not in ('BNF', 'CRED', 'CANC', 'DEVT')
  and d.codusur not in (1, 27) /* 1=VendaDireta 27=Intercompany */
  /*
  and a.codfilial = '1'
  and a.dtpag between '01/03/2019' and '31/03/2019'
  and d.codusur in (
    34,
    36,
    13,
    16,
    9,
    28,
    35,
    10,
    22,
    30,
    3,
    19,
    24,
    40
  ) 
  */
  --and e.codigocentrocusto = '1.10'
order by
  a.numtransvenda,
  a.prest
