-- Valores validados
-- Falta descobrir o que é a coluna CUSTO RECEBIMENTO
select --*
    a.codfilial, a.codcli, b.estcob || ' - ' || b.cliente CLIENTE,
    a.codusur, b.estcob || ' - ' || d.nome, a.duplic, a.prest,
    a.dtvenc, a.codcob, c.cobranca, a.valor, a.vpago VALOR_PAGO, 
    a.dtpag, a.dtemissao, a.operacao, a.dtdesc, a.obs, a.numtrans 
from pcprest a
join pcclient b on
    b.codcli = a.codcli
join pccob c on
    c.codcob = a.codcob
join pcusuari d on
    d.codusur = a.codusur
where a.dtpag between  '01/03/2019' and '31/03/2019'
    and a.codcob not in ('BNF', 'CRED')
    --and a.duplic in (24595, 24597, 24600)
    and a.codfilial = '1'
    and a.codusur = 22
order by a.codfilial, a.dtpag
;


select * from pcclient;
select * from pccob;
select * from pcusuari;