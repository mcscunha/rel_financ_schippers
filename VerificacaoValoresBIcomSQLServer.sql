-- Verificacao da ultima data inserida E contagem de linhas
-- FILIAL 1
-- Alguns filtros referentes aos filtros aplicados no Power Query

    SELECT 'Devolucao' Tabela, A.CODFILIAL Filial, COUNT(*) NumLinhas, MAX(A.DTENT) MaiorData, round(sum(A.vldevolucao), 2) Total
    FROM DW_SCHIPPERS.RECEBIMENTOS.Devolucao A
    where A.CODfilial = 1
        and A.dtent between :DATAI and :DATAF
    group by A.codfilial
union
    SELECT 'Bonificacao', B.codfilial, COUNT(*), MAX(B.DTFAT), round(sum(isnull(B.qt, 0) * isnull(B.custofornec, 0)), 2)
    FROM DW_SCHIPPERS.Recebimentos.Bonificacao B
    where B.codfilial = 1
        and B.dtfat between :DATAI and :DATAF
    group by B.codfilial
union
    SELECT 'Despesas', C.codfilial, COUNT(*), max(C.dtcompetencia), round(sum(C.vpago), 2)
    FROM DW_SCHIPPERS.Recebimentos.Despesas C
    where C.codfilial = 1
        and C.codigocentrocusto like '1.%'
        and C.dtcompetencia between :DATAI and :DATAF
    group by C.codfilial
union
    SELECT 'Recebimento', D.codfilial, COUNT(*), MAX(D.DTPAG), round(sum(D.vpago), 2)
    FROM DW_SCHIPPERS.Recebimentos.Recebimento D
    where D.codfilial = 1
        and D.codusur not in (1, 27)
        and D.dtpag between '01/02/2019' and '28/02/2019'  -- MES ANTERIOR
    group by D.codfilial
union
    SELECT 'Faturamento', E.codfilial, COUNT(*), MAX(E.DTFat), round(sum(E.qt * E.punit), 2)
    FROM DW_SCHIPPERS.Recebimentos.Faturamento E
    where E.codfilial = 1
        and E.dtfat between :DATAI and :DATAF
    group by E.codfilial
;


