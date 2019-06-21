-- Analitico - ETL

-- BONIFICACAO
select
  pcmov.numtransitem,
  pcmov.seqmov,
  pcmov.codfilial,
  pcnfsaid.dtfat,
  pcnfsaid.dtlancto,
  pcnfsaid.dtsaida,
  pcusuari.codusur,
  pcusuari.nome,
  pcplpag.codplpag,
  pcplpag.descricao,
  pcnfsaid.uf,
  pcnfsaid.cliente,
  pcmov.descricao,
  pcmov.unidade,
  pcmov.tipomercdepto,
  pcmov.embalagem,
  nvl(pcmov.qt, 0) Qtde,
  nvl(pcest.custofornec, 0) CustoFornec
from
  pcmov
join pcnfsaid on
    pcnfsaid.numtransvenda = pcmov.numtransvenda
join pcpedc on 
    pcpedc.numtransvenda = pcnfsaid.numtransvenda
join pcusuari on 
    pcusuari.codusur = pcpedc.codusur
join pcplpag on 
    pcplpag.codplpag = pcnfsaid.codplpag
join pcest on 
    pcest.codfilial = pcnfsaid.codfilial
    and pcest.codprod = pcmov.codprod
where
  pcpedc.posicao = 'F'
  and pcnfsaid.numnota = pcmov.numnota
  and pcnfsaid.condvenda in (1, 5)
  and pcplpag.codplpag = 8  /* BONIFICACAO */
  /* 
  and pcnfsaid.codfilial in ('1')
  and to_date(pcnfsaid.dtfat, 'DD-MM-YY') between 
        to_date('01/03/2019', 'DD/MM/YYYY')
        and to_date('31/03/2019', 'DD/MM/YYYY')
  and pcusuari.codusur in (
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
    24
  )
  */
order by
    pcmov.numtransitem
;