-- Analitico - ETL

-- DESPESA MENSAL
SELECT
    a.recnum,
    a.codconta,
    a.codfilial,
    e.codigocentrocusto,
    e.descricao Vendedor,
    a.numnota,
    c.conta DescCentroCusto,
    a.historico DetalheDespesa,
    c.grupoconta,
    a.vpago,
    (d.percrateio / 100) PercRateio
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
    /*
    AND a.codfilial = '1'
    AND (nvl(a.dtcompetencia, a.dtlanc) >= '01/03/2019')
    AND (nvl(a.dtcompetencia, a.dtlanc) <= '31/03/2019')
    AND d.codigocentrocusto in (
            '1.10',
            '1.13',
            '1.16',
            '1.19',
            '1.22',
            '1.24',
            '1.26',
            '1.3',
            '1.34',
            '1.35',
            '1.6'
    )
    */
ORDER BY
    a.recnum
;