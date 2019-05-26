-- Nao validado
select 
    codcli, codfilial, prest, duplic, valor, dtvenc, 
    vpago, dtpag, dtemissao, operacao, dtdesc, obs,
    numtrans 
from pcprest
where dtpag between  '01/05/2019' and '31/05/2019'
order by codfilial, dtpag
;
