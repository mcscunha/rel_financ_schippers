SELECT
    'Despesas',
    /*
    a.recnum,
    a.codconta,
    a.codfilial,
    (nvl(a.dtcompetencia, a.dtlanc)) data_filtro,
    */
    sum(a.vpago) Total
FROM
    pclanc                     a
    LEFT JOIN pcfornec         b ON b.codfornec = a.codfornec
    JOIN pcconta               c ON c.codconta = a.codconta
    JOIN pcrateiocentrocusto   d ON d.recnum = a.recnum
    JOIN pccentrocusto         e ON e.codigocentrocusto = d.codigocentrocusto
WHERE
    ( nvl(c.investimento, 'N') <> 'S' )
    AND c.grupoconta >= 200
    AND c.grupoconta <= 900
    AND nvl(a.codrotinabaixa, 0) NOT IN (737)
    AND a.codfilial = '1'
    AND (nvl(a.dtcompetencia, a.dtlanc) >= '01/06/2019')
    AND (nvl(a.dtcompetencia, a.dtlanc) <= '30/06/2019')
/*
group BY
    a.recnum,
    a.codconta,
    a.codfilial,
    (nvl(a.dtcompetencia, a.dtlanc))
*/


union ALL

select
  'Bonificacao',
  /*
  pcmov.numtransitem,
  pcmov.seqmov,
  pcmov.codfilial,
  pcnfsaid.dtfat,
  */
  sum(nvl(pcmov.qt, 0) * nvl(pcest.custofornec, 0))
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
  and pcnfsaid.codfilial in ('1')
  and to_date(pcnfsaid.dtfat, 'DD-MM-YY') between 
        to_date('01/06/2019', 'DD/MM/YYYY') and
        to_date('30/06/2019', 'DD/MM/YYYY')
/*
group BY
  pcmov.numtransitem,
  pcmov.seqmov,
  pcmov.codfilial,
  pcnfsaid.dtfat
*/


union ALL

select
  'DEV - RESUMO_FATURA_AVULSA',
  /*
  numnota,
  codfornec,
  SCHIPPERS.view_devol_resumo_faturavulsa.codfilial,
  dtent,
  */
  count(vldevolucao)
from
  SCHIPPERS.view_devol_resumo_faturavulsa
  join pcusuari on pcusuari.nome = SCHIPPERS.view_devol_resumo_faturavulsa.nome
where
  1 = 1
  and SCHIPPERS.view_devol_resumo_faturavulsa.codfilial = '1'
  and dtent between '01/06/2019' and '30/06/2019'
/*
group BY
  numnota,
  codfornec,
  SCHIPPERS.view_devol_resumo_faturavulsa.codfilial,
  dtent
*/

union all

select
  'Devol - RESUMO_FATURAMENTO',
  /*
  numnota,
  codfornec,
  SCHIPPERS.view_devol_resumo_faturamento.codfilial,
  dtent,
  */
  count(vldevolucao)
from
  SCHIPPERS.view_devol_resumo_faturamento
  join pcusuari on pcusuari.nome = SCHIPPERS.view_devol_resumo_faturamento.nome
where
  CONDVENDA NOT IN (4, 8, 10, 13, 20, 98, 99)
  and SCHIPPERS.view_devol_resumo_faturamento.codfilial = '1'
  and dtent between '01/06/2019' and '30/06/2019'
/*
group BY
  numnota,
  codfornec,
  SCHIPPERS.view_devol_resumo_faturamento.codfilial,
  dtent
*/


union ALL


select
  'Recebimento',
  /*
  a.numtransvenda,
  a.duplic,
  a.codfilial,
  a.dtpag,
  */
  sum(a.vpago)
from
  pcprest a
  join pcclient b on b.codcli = a.codcli
  join pccob c on c.codcob = a.codcob
  join pcusuari d on d.codusur = a.codusur 
where
  a.codcob not in ('BNF', 'CRED')
  and a.codfilial = '1'
  and a.dtpag between '01/06/2019' and '30/06/2019'
/*
group BY
  a.numtransvenda,
  a.duplic,
  a.codfilial,
  a.dtpag
*/

union ALL


select
  'Faturamento',
  /*
  pcmov.numtransitem,
  pcmov.numnota,
  pcmov.codfilial,
  pcnfsaid.dtfat,
  */
  sum(pcmov.qt * pcmov.punit)
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
  and pcnfsaid.codfilial in ('1')
  and to_date(pcnfsaid.dtfat, 'DD-MM-YY') between 
	to_date('01/06/2019', 'DD/MM/YYYY') and 
	to_date('30/06/2019', 'DD/MM/YYYY')
/*
group BY
  pcmov.numtransitem,
  pcmov.numnota,
  pcmov.codfilial,
  pcnfsaid.dtfat
*/


ORDER BY
    1
;
