-- Despesas com Vendedores
-- Validado em 19/06/2019
-- Retirado com ajuda do Oracle SQLTracer
--
-- DESPESA MENSAL
SELECT
    a.codfilial,
    c.tipo,
    e.codigocentrocusto,
    e.descricao,
    c.codconta,
    c.conta,
    --a.historico,
    c.grupoconta,
    d.percrateio,
    round((SUM(a.vpago) * (d.percrateio / 100)), 2) ValorTotal
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
    AND (nvl(a.dtcompetencia, a.dtlanc) >= '01/03/2019')
    AND (nvl(a.dtcompetencia, a.dtlanc) <= '31/03/2019')
    AND d.codigocentrocusto in (
            '1.10',     /* GLAUCO           */
            '1.13',     /* BOVINOS SCHBR    */
            '1.16',     /* CEZARIO          */
            '1.19',     /* MARTIN           */
            '1.22',     /* HUGO             */
            '1.24',     /* ODIRLEI          */
            '1.26',     /* VINICIUS         */
            '1.3',      /* MARCOS           */
            '1.34',     /* ALCENO           */
            '1.35',     /* FELIPE           */
            '1.6'       /* JOAO FERNANDES   */
    )
GROUP BY
    a.codfilial,
    c.tipo,
    e.codigocentrocusto,
    e.descricao,
    c.codconta,
    c.conta,
    --a.historico,
    d.percrateio,
    c.grupoconta
ORDER BY
    descricao,
    conta
;




