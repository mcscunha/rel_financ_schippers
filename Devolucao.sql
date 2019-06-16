select
  'RESUMO_FATURA_AVULSA',
  codfilial,
  dtent,
  codfornec,
  null fornecedor,
  numnota,
  cliente,
  vlfrete,
  vldevolucao,
  nome,
  descricao,
  motivo,
  motivo2,
  null observacao
from
  VIEW_DEVOL_RESUMO_FATURAVULSA
where
  codfilial = '1'
  and dtent between '01/03/2019'
  and '31/03/2019'
union all
select
  'RESUMO_FATURAMENTO',
  codfilial,
  dtent,
  codfornec,
  fornecedor,
  numnota,
  cliente,
  vlfrete,
  vldevolucao,
  nome,
  descricao,
  motivo,
  motivo2,
  obs
from
  view_devol_resumo_faturamento
where
  CONDVENDA NOT IN (4, 8, 10, 13, 20, 98, 99)
  and codfilial = '1'
  and dtent between '01/03/2019'
  and '31/03/2019';