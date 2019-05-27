-- Nao validado
select a.*
--    a.codfilial, a.codconta, c.conta, c.grupoconta,
--    a.codfornec, b.emitenfe,  a.historico,
--    a.numnota, a.duplic, 
--    a.valor, a.dtvenc, a.dtpagto, a.vpago
from pclanc a
join pcfornec b on
    b.codfornec = a.codfornec
join pcconta c on
    c.codconta = a.codconta
where a.dtpagto between  '01/03/2019' and '31/03/2019'
    and a.codfilial = '1'
order by 
    a.codfilial, 
    a.dtpagto
;

select * from pcconta;
select * from pcmovcr where data between  '01/03/2019' and '31/03/2019';