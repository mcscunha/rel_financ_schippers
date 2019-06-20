-- Valores validados
-- Validado em 19/06/2019

-- RECEBIMENTO
select
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
  a.vpago VALOR_PAGO,
  a.dtpag,
  a.dtemissao,
  a.operacao,
  a.dtdesc,
  a.obs,
  a.numtrans,
from
  pcprest a
  join pcclient b on b.codcli = a.codcli
  join pccob c on c.codcob = a.codcob
  join pcusuari d on d.codusur = a.codusur 
  --join pccentrocusto e on e.codigocentrocusto = d.codigocentrocusto
where
  a.dtpag between '01/03/2019'
  and '31/03/2019'
  and a.codcob not in ('BNF', 'CRED')
  and a.codfilial = '1'
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
  --and e.codigocentrocusto = '1.10'
order by
  a.codfilial,
  vendedor,
  a.dtpag;