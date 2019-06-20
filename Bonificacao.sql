-- Consolidado
-- Testado em 19/06/2019
--
-- BONIFICACAO
select
  pcmov.codfilial FILIAL,
  'R' TIPO,
  pcusuari.codusur,
  pcusuari.nome,
  pcplpag.codplpag,
  pcplpag.descricao,
  100 PERC_RATEIO,
  sum(pcmov.qt * nvl(pcest.custofornec, 0)) CustoTotal
from
  pcmov
  join pcnfsaid on pcnfsaid.numtransvenda = pcmov.numtransvenda
  join pcpedc on pcpedc.numtransvenda = pcnfsaid.numtransvenda
  join pcusuari on pcusuari.codusur = pcpedc.codusur
  join pcplpag on pcplpag.codplpag = pcnfsaid.codplpag
  join pcest on pcest.codfilial = pcnfsaid.codfilial
  and pcest.codprod = pcmov.codprod
where
  pcpedc.posicao = 'F'
  and pcnfsaid.numnota = pcmov.numnota
  and pcnfsaid.condvenda in (1, 5)
  and pcplpag.codplpag = 8  /* BONIFICACAO */
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
group by
  pcmov.codfilial,
  pcusuari.codusur,
  pcusuari.nome,
  pcplpag.codplpag,
  pcplpag.descricao;