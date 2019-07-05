drop table dw_schippers.recebimentos.Vendedores;

create table dw_schippers.recebimentos.Vendedores (
    codvigenciadesconto int IDENTITY(1,1) PRIMARY KEY NOT NULL,
    codusur int,
    nome varchar(100),
    codfilial int,
    codcentrocusto varchar(50),
    desccentrocusto varchar(100),
    dtInicio date,
    dtFim date
);

Insert into dw_schippers.recebimentos.Vendedores (codusur, nome, codfilial, codcentrocusto, desccentrocusto, dtInicio, dtFim) values ('1','VENDA DIRETA','1','1.1','VI VENDA DIRETA',null,null);
Insert into dw_schippers.recebimentos.Vendedores (codusur, nome, codfilial, codcentrocusto, desccentrocusto, dtInicio, dtFim) values ('3','MARCOS LEANDRO DO LAGO FRANCO','1','1.3','VE MARCOS LEANDRO DO LAGO FRANCO',null,null);
Insert into dw_schippers.recebimentos.Vendedores (codusur, nome, codfilial, codcentrocusto, desccentrocusto, dtInicio, dtFim) values ('4','DEBORA BERNARDES OLIVEIRA ','1','1.4','DEBORA BERNARDES OLIVEIRA',null,null);
Insert into dw_schippers.recebimentos.Vendedores (codusur, nome, codfilial, codcentrocusto, desccentrocusto, dtInicio, dtFim) values ('10','GLAUCO GONCALVES RIOS','1','1.10','VE GLAUCO GONCALVES RIOS',null,null);
Insert into dw_schippers.recebimentos.Vendedores (codusur, nome, codfilial, codcentrocusto, desccentrocusto, dtInicio, dtFim) values ('13','BOVINOS SCHBR','1','1.13','VI BOVINOS SCHBR',null,null);
Insert into dw_schippers.recebimentos.Vendedores (codusur, nome, codfilial, codcentrocusto, desccentrocusto, dtInicio, dtFim) values ('14','COSTAVET AGRONEGOCIOS LTDA','1','1.14','RE COSTAVET AGRONEGOCIOS LTDA',null,null);
Insert into dw_schippers.recebimentos.Vendedores (codusur, nome, codfilial, codcentrocusto, desccentrocusto, dtInicio, dtFim) values ('16','CEZARIO CASFI REPRE COM LTDA','1','1.16','RE CEZARIO CASFI REPRE COM LTDA',null,null);
Insert into dw_schippers.recebimentos.Vendedores (codusur, nome, codfilial, codcentrocusto, desccentrocusto, dtInicio, dtFim) values ('19','MARTIN H BIJSTERVELD','99','1.19','VE MARTIN H BIJSTERVELD',null,null);
Insert into dw_schippers.recebimentos.Vendedores (codusur, nome, codfilial, codcentrocusto, desccentrocusto, dtInicio, dtFim) values ('22','HUGO FRANCO ROMANIA','1','1.22','VI HUGO FRANCO ROMANIA',null,null);
Insert into dw_schippers.recebimentos.Vendedores (codusur, nome, codfilial, codcentrocusto, desccentrocusto, dtInicio, dtFim) values ('24','ODIRLEI CALDERAM','1','1.24','VE ODIRLEI CALDERAM',null,null);
Insert into dw_schippers.recebimentos.Vendedores (codusur, nome, codfilial, codcentrocusto, desccentrocusto, dtInicio, dtFim) values ('27','VENDEDOR INTERCOMPANY','1','1.27','VI VENDEDOR INTERCOMPANY',null,null);
Insert into dw_schippers.recebimentos.Vendedores (codusur, nome, codfilial, codcentrocusto, desccentrocusto, dtInicio, dtFim) values ('7','SIMONE CAMPOS','1','1.7','VE SIMONE CAMPOS',null,null);
Insert into dw_schippers.recebimentos.Vendedores (codusur, nome, codfilial, codcentrocusto, desccentrocusto, dtInicio, dtFim) values ('33','AVICULTURA TTA ','2','1.33','AVICULTURA TTA',null,null);
Insert into dw_schippers.recebimentos.Vendedores (codusur, nome, codfilial, codcentrocusto, desccentrocusto, dtInicio, dtFim) values ('37','TTA ADM','2','1.37','VI TTA ADM',null,null);
Insert into dw_schippers.recebimentos.Vendedores (codusur, nome, codfilial, codcentrocusto, desccentrocusto, dtInicio, dtFim) values ('40','VENDA INTERNA','1','1.40','VENDA INTERNA',null,null);
Insert into dw_schippers.recebimentos.Vendedores (codusur, nome, codfilial, codcentrocusto, desccentrocusto, dtInicio, dtFim) values ('30','JESSICA MIKAELA DA SILVA FARIA','2','1.30','ADMINISTRATIVO',null,null);
Insert into dw_schippers.recebimentos.Vendedores (codusur, nome, codfilial, codcentrocusto, desccentrocusto, dtInicio, dtFim) values ('6','JOAO FERNANDES RIBEIRO','1','1.6','VE JOAO FERNANDES RIBEIRO',null,null);
Insert into dw_schippers.recebimentos.Vendedores (codusur, nome, codfilial, codcentrocusto, desccentrocusto, dtInicio, dtFim) values ('17','LUCIANO AURI DOS SANTOS FLORES','2','1.17','VE LUCIANO AURI DOS SANTOS FLORES',null,null);
Insert into dw_schippers.recebimentos.Vendedores (codusur, nome, codfilial, codcentrocusto, desccentrocusto, dtInicio, dtFim) values ('5','TTA ROO','1','1.5','VI TTA-ROO',null,null);
Insert into dw_schippers.recebimentos.Vendedores (codusur, nome, codfilial, codcentrocusto, desccentrocusto, dtInicio, dtFim) values ('26','VINICIUS LOURENCO ALVES FERNANDES','2','1.26','VE VINICIUS LOURENCO ALVES FERNANDES',null,null);
Insert into dw_schippers.recebimentos.Vendedores (codusur, nome, codfilial, codcentrocusto, desccentrocusto, dtInicio, dtFim) values ('28','EVERTON FRIEDRICH','2','1.28','EVERTON FRIEDRICH',null,null);
Insert into dw_schippers.recebimentos.Vendedores (codusur, nome, codfilial, codcentrocusto, desccentrocusto, dtInicio, dtFim) values ('15','ANTONIO IRINEU FAEDO','1','1.15','VE ANTONIO IRINEU FAEDO',null,null);
Insert into dw_schippers.recebimentos.Vendedores (codusur, nome, codfilial, codcentrocusto, desccentrocusto, dtInicio, dtFim) values ('6','JOAO FERNANDES RIBEIRO','1','3.6','FILIAL',null,null);
Insert into dw_schippers.recebimentos.Vendedores (codusur, nome, codfilial, codcentrocusto, desccentrocusto, dtInicio, dtFim) values ('8','LEANDRO LUCIO BRUSCO','1','1.8','VE LEANDRO LUCIO BRUSCO',null,null);
Insert into dw_schippers.recebimentos.Vendedores (codusur, nome, codfilial, codcentrocusto, desccentrocusto, dtInicio, dtFim) values ('35','FELIPE LABARCA DE OLIVEIRA','1','1.35','VE FELIPE LABARCA',null,null);
Insert into dw_schippers.recebimentos.Vendedores (codusur, nome, codfilial, codcentrocusto, desccentrocusto, dtInicio, dtFim) values ('38','DOSAMAX ','1','1.38','VE DOSAMAX',null,null);
Insert into dw_schippers.recebimentos.Vendedores (codusur, nome, codfilial, codcentrocusto, desccentrocusto, dtInicio, dtFim) values ('1','VENDA DIRETA','1','2.1','ALIE',null,null);
Insert into dw_schippers.recebimentos.Vendedores (codusur, nome, codfilial, codcentrocusto, desccentrocusto, dtInicio, dtFim) values ('3','MARCOS LEANDRO DO LAGO FRANCO','1','2.3','DEBORA',null,null);
Insert into dw_schippers.recebimentos.Vendedores (codusur, nome, codfilial, codcentrocusto, desccentrocusto, dtInicio, dtFim) values ('1','VENDA DIRETA','1','3.1','MARKETING',null,null);
Insert into dw_schippers.recebimentos.Vendedores (codusur, nome, codfilial, codcentrocusto, desccentrocusto, dtInicio, dtFim) values ('3','MARCOS LEANDRO DO LAGO FRANCO','1','3.3','EXPEDICAO',null,null);
Insert into dw_schippers.recebimentos.Vendedores (codusur, nome, codfilial, codcentrocusto, desccentrocusto, dtInicio, dtFim) values ('4','DEBORA BERNARDES OLIVEIRA ','1','3.4','VENDAS',null,null);
Insert into dw_schippers.recebimentos.Vendedores (codusur, nome, codfilial, codcentrocusto, desccentrocusto, dtInicio, dtFim) values ('5','TTA ROO','1','3.5','ADMINISTRATIVO',null,null);
Insert into dw_schippers.recebimentos.Vendedores (codusur, nome, codfilial, codcentrocusto, desccentrocusto, dtInicio, dtFim) values ('12','BOVINOS TTA','1','1.12','VI BOVINOS TTA ',null,null);
Insert into dw_schippers.recebimentos.Vendedores (codusur, nome, codfilial, codcentrocusto, desccentrocusto, dtInicio, dtFim) values ('34','ALCENO DUMKE',null,'1.34','RE ALCENO',null,null);

update dw_schippers.recebimentos.Vendedores 
set dtInicio = '01/01/2000' 
where 
    codcentrocusto in (
        '1.3',  '1.1',  '1.3',  '1.10', '1.13',
        '1.16', '1.19', '1.22', '1.24', '1.30',
        '1.34', '1.35', '1.38'
    );

select * from dw_schippers.recebimentos.Vendedores;




