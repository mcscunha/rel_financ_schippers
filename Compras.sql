-- Nao validado
select 
    recnum, codfilial, dtlanc, dtvenc, codconta, 
    historico, numnota, duplic, valor, dtpagto, vpago,
    fornecedor
from pclanc
where dtpagto between '01/05/2019' and '31/05/2019'
order by codfilial, codconta, dtpagto
;
