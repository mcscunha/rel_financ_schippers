-- Consolidado - Perfeito
select
  pcmov.codfilial,
  pcmov.dtmov,
  pcmov.numnota,
  pcmov.codepto,
  pcmov.descricao,
  pcmov.numtranshistorico,
  pcmov.qt,
  pcmov.punit,
  pcmov.custofin,
  pcmov.custocont,
  pcmov.custoreal,
  pcmov.qt * pcmov.punit TotalPago
from
  schippers.pcmov,
  schippers.pcnfsaid,
  schippers.pcpedc
where
  pcnfsaid.numtransvenda = pcmov.numtransvenda
  and pcnfsaid.numtransvenda = pcpedc.numtransvenda
  and pcpedc.posicao = 'F'
  and pcnfsaid.numnota = pcmov.numnota
  and pcnfsaid.condvenda in (1, 5)
  and pcnfsaid.codfilial in ('1')
  and to_date(pcnfsaid.dtfat, 'DD-MM-YY') between 
	to_date('01/05/2019', 'DD/MM/YYYY') and 
	to_date('31/05/2019', 'DD/MM/YYYY')
order by
  codfilial,
  dtmov
;