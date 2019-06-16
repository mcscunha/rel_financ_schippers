SELECT
    r.codigocentrocusto,
    c.descricao,
    l.recnum,
    SUM(r.valor) valorcentrocusto,
    SUM(l.valor) valorlanc,
    SUM(r.percrateio) percrateio,
    l.codconta,
    p.conta,
    l.recnum numlanc,
    p.grupoconta,
    l.numnota,
    l.codfornec,
    l.historico,
    l.dtpagto,
    tot.qtdcentrocusto,
    tot.vlrtotalcentrocusto
FROM
    pclanc                l,
    pccentrocusto         c,
    pcrateiocentrocusto   r,
    pcconta               p,
    pcnfsaid,
    (
        SELECT
            COUNT(qtdcentrocusto) qtdcentrocusto,
            SUM(vlrtotalcentrocusto) vlrtotalcentrocusto,
            codigocentrocusto
        FROM
            (
                SELECT
                    COUNT(rc1.codigocentrocusto) qtdcentrocusto,
                    SUM(rc1.valor) vlrtotalcentrocusto,
                    l1.recnum,
                    rc1.codigocentrocusto
                FROM
                    pclanc                l1,
                    pccentrocusto         c1,
                    pcrateiocentrocusto   rc1,
                    pcconta               p1
                WHERE
                    l1.codconta = rc1.codconta
                    AND l1.codconta = p1.codconta
                    AND l1.recnum = rc1.recnum
                    AND rc1.codigocentrocusto = c1.codigocentrocusto
                    AND rc1.codfilial IN ('1')
                    AND ( nvl(l1.dtcompetencia, l1.dtlanc) >= '01/03/2019' )
                    AND ( nvl(l1.dtcompetencia, l1.dtlanc) <= '31/03/2019' )
                GROUP BY
                    rc1.codigocentrocusto,
                    c1.descricao,
                    l1.codconta,
                    p1.conta,
                    l1.recnum,
                    p1.grupoconta,
                    l1.numnota,
                    l1.codfornec,
                    l1.historico,
                    l1.dtpagto
            )
        GROUP BY
            codigocentrocusto
    ) tot
WHERE
    l.codconta = r.codconta
    AND l.codconta = p.codconta
    AND l.numtransvenda = pcnfsaid.numtransvenda (+)
    AND l.recnum = r.recnum
    AND r.codigocentrocusto = c.codigocentrocusto
    AND tot.codigocentrocusto = c.codigocentrocusto
    AND r.codfilial IN ('1')
    AND ( nvl(l.dtcompetencia, l.dtlanc) >= '01/03/2019' )
    AND ( nvl(l.dtcompetencia, l.dtlanc) <= '31/03/2019' )
    AND nvl(l.codrotinabaixa, 0) <> 737
    AND nvl(pcnfsaid.condvenda, 0) NOT IN (10, 20, 98, 99)
    AND (
        (nvl(pcnfsaid.codfiscal, 0) NOT IN (522, 622, 722, 532, 632, 732))
        OR
        (TO_CHAR(l.codconta) = (
            SELECT
                valor
            FROM
                pcparamfilial
            WHERE
                nome = 'CON_CODCONTRECJUR')
        )
    )
    AND (
        NOT EXISTS (
            SELECT
                d.numtransent
            FROM
                pcestcom   d,
                pcnfsaid   n
            WHERE
                d.numtransent = l.numtransent
                AND d.dtestorno = l.dtlanc
                AND d.numtransvenda = n.numtransvenda
                AND n.condvenda IN (20)
        )
    )
    AND (nvl(p.investimento, 'N') <> 'S')
    AND p.grupoconta >= 200
    AND p.grupoconta <= 900
    AND nvl(l.codrotinabaixa, 0) NOT IN (737)
HAVING
    SUM(r.valor) <> 0                                                                 
GROUP BY 
    r.codigocentrocusto,
    c.descricao,
    l.codconta,
    p.conta,
    l.recnum,
    p.grupoconta,
    l.numnota,
    l.codfornec,
    l.historico,
    l.dtpagto,
    tot.qtdcentrocusto,
    tot.vlrtotalcentrocusto                                             
ORDER by 
    codigocentrocusto,
    codconta,
    valorcentrocusto desc,
    recnum
;