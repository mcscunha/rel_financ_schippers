-- Analitico - ETL

-- FATURAMENTO
select
  pcmov.numtransitem,
  pcmov.dtmov,
  pcmov.numnota,
  pcmov.codprod,
  pcmov.codfilial,
  pcmov.codusur,
  pcusuari.nome,
  pcmov.descricao,
  pcnfsaid.uf,
  pcmov.codplpag,
  pcplpag.descricao,
  pcmov.vlfrete,
  pcmov.percdesc/100,
  pcmov.vldesconto,
  pcmov.qt,
  pcmov.punit
from pcmov
join pcnfsaid on
    pcnfsaid.numtransvenda = pcmov.numtransvenda
    and pcnfsaid.numnota = pcmov.numnota
join pcpedc on
    pcpedc.numtransvenda = pcnfsaid.numtransvenda 
join pcusuari on
    pcusuari.codusur = pcmov.codusur
join pcplpag on
    pcplpag.codplpag = pcmov.codplpag
where
  pcpedc.posicao = 'F'
  and pcnfsaid.condvenda in (1, 5)
  /*
  and pcnfsaid.codfilial in ('1')
  and to_date(pcnfsaid.dtfat, 'DD-MM-YY') between 
	to_date('01/03/2019', 'DD/MM/YYYY') and 
	to_date('31/03/2019', 'DD/MM/YYYY')
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
    24,
    40
  )
  */
order by
  pcmov.numtransitem
;
