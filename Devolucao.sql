-- Valores consolidados
-- Validados em 19/06/2019
--
--grant select on view_devol_resumo_faturavulsa to consulta;
--grant select on view_devol_resumo_faturamento to consulta;

-- DEVOLUCAO
select 
    nome,
    cliente,
    count(nome) NumDevolucoes,
    sum(vldevolucao) ValorTotalDevolucoes
from 
    (
        select
          'RESUMO_FATURA_AVULSA',
          SCHIPPERS.view_devol_resumo_faturavulsa.codfilial,
          pcusuari.codusur,
          dtent,
          codfornec,
          null fornecedor,
          numnota,
          cliente,
          vlfrete,
          vldevolucao,
          pcusuari.nome,
          descricao,
          SCHIPPERS.view_devol_resumo_faturavulsa.motivo,
          motivo2,
          null observacao
        from
          SCHIPPERS.view_devol_resumo_faturavulsa
        join pcusuari on
          pcusuari.nome = SCHIPPERS.view_devol_resumo_faturavulsa.nome
        where
          SCHIPPERS.view_devol_resumo_faturavulsa.codfilial = '1'
        
        union all
        
        select
          'RESUMO_FATURAMENTO',
          SCHIPPERS.view_devol_resumo_faturamento.codfilial,
          pcusuari.codusur,
          dtent,
          codfornec,
          fornecedor,
          numnota,
          cliente,
          vlfrete,
          vldevolucao,
          pcusuari.nome,
          descricao,
          SCHIPPERS.view_devol_resumo_faturamento.motivo,
          motivo2,
          obs
        from
          SCHIPPERS.view_devol_resumo_faturamento
        join pcusuari on
          pcusuari.nome = SCHIPPERS.view_devol_resumo_faturamento.nome
        where
          CONDVENDA NOT IN (4, 8, 10, 13, 20, 98, 99)
          and SCHIPPERS.view_devol_resumo_faturamento.codfilial = '1'
    )
where
  dtent between '01/03/2019' and '31/03/2019'
  and pcusuari.codusur in (
        34, 36, 13,
        16,  9, 28,
        35, 10, 22,
        30,  3, 19,
        24
  )
group by
    cliente,
    nome
;
