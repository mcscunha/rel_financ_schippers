-- Validado em 16/06/2019
-- Retirado com ajuda do Oracle SQLTracer
--
select
  a.codfilial,
  e.codigocentrocusto,
  e.descricao,
  c.codconta,
  c.conta,
  c.grupoconta,
  c.tipo,
  a.dtpagto,
  a.historico,
  a.numnota,
  a.valor,
  a.vpago,
  d.valor,
  d.percrateio
from
  pclanc a
  join pcfornec b on b.codfornec = a.codfornec
  join pcconta c on c.codconta = a.codconta
  join pcrateiocentrocusto d on d.recnum = a.recnum
  join pccentrocusto e on e.codigocentrocusto = d.codigocentrocusto
where
  a.codfilial = '1'
  AND (nvl(a.dtcompetencia, a.dtlanc) >= '01/03/2019')
  AND (nvl(a.dtcompetencia, a.dtlanc) <= '31/03/2019')
  and c.codconta = '200023'
  and d.codigocentrocusto = '1.10'
order by
  a.codfilial,
  a.dtpagto;