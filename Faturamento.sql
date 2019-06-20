-- Consolidado - Perfeito
-- Validade em 19/06/2019
--

-- FATURAMENTO
select
  pcmov.codfilial,
  pcmov.codusur,
  pcusuari.nome,
  sum(pcmov.qt * pcmov.punit) TotalPago
from pcmov
join pcnfsaid on
    pcnfsaid.numtransvenda = pcmov.numtransvenda
    and pcnfsaid.numnota = pcmov.numnota
join pcpedc on
    pcpedc.numtransvenda = pcnfsaid.numtransvenda 
join pcusuari on
    pcusuari.codusur = pcmov.codusur
where
  pcpedc.posicao = 'F'
  and pcnfsaid.condvenda in (1, 5)
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
group by
  pcmov.codfilial,
  pcmov.codusur,
  pcusuari.nome
order by
  codfilial,
  nome
;
