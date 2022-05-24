drop database dbphoenix;

create database dbphoenix;

use dbphoenix;

create table tbusuarios(
codUsu int not null auto_increment,
nomeUsu varchar(45) not null,
telefoneUsu char(15),
primary key(codUsu));

insert into tbusuarios(nomeUsu,telefoneUsu)
	values('Vinicius','(11)93763-3325');
insert into tbusuarios(nomeUsu,telefoneUsu)
	values('Yaros','(11)93784-3321');
insert into tbusuarios(nomeUsu,telefoneUsu)
	values('Raissa','(11)97894-5604');
insert into tbusuarios(nomeUsu,telefoneUsu)
	values('Rodrigo','(11)91023-8520');
insert into tbusuarios(nomeUsu,telefoneUsu)
	values('Anna','(11)96547-4567');
insert into tbusuarios(nomeUsu,telefoneUsu)
	values('Vitoria','(11)95555-5555');

create table tbitemdoa(
codItemDoa int not null auto_increment,
nome varchar(45) not null,
nomeProd varchar(45) not null,
descricao varchar(100) not null,
codUsu int not null,
primary key(codItemDoa),
foreign key(codUsu)references tbusuarios(codUsu));

insert into tbitemdoa(nome,nomeProd,descricao,codUsu)
	values('Vinicius','cadeira de rodas','SOKRngSRNSNRpijsPIRgjPSrgSg',1);
insert into tbitemdoa(nome,nomeProd,descricao,codUsu)
	values('Raissa','protese','SOKRngSRNSNRpijsPIRgjPSrgSg',3);
insert into tbitemdoa(nome,nomeProd,descricao,codUsu)
	values('Anna','bota','SOKRngSRNSNRpijsPIRgjPSrgSg',5);


create table tbdonatario(
codDon int not null auto_increment,
nome varchar(45) not null,
produto_recebido varchar(45) not null,
codUsu int not null,
codItemDoa int not null,
primary key(codDon),
foreign key(codItemDoa)references tbitemdoa(codItemDoa));

insert into tbdonatario(nome,produto_recebido,codUsu,codItemDoa)
	values('Yaros','cadeira de rodas',2,1);
insert into tbdonatario(nome,produto_recebido,codUsu,codItemDoa)
	values('Rodrigo','protese',4,2);
insert into tbdonatario(nome,produto_recebido,codUsu,codItemDoa)
	values('Vitoria','bota',6,3);

create table tbdoacao(
codDoa int not null auto_increment,
codItemDoa int not null,
codDon int not null,
data date not null,
primary key(codDoa),
foreign key(codItemDoa)references tbitemdoa(codItemDoa),
foreign key(codDon)references tbdonatario(codDon));

insert into tbdoacao(codItemDoa,codDon,data)
	values(1,1,'2022/06/02');
insert into tbdoacao(codItemDoa,codDon,data)
	values(2,2,'2022/06/02');
insert into tbdoacao(codItemDoa,codDon,data)
	values(3,3,'2022/06/02');

select * from tbusuarios;
select * from tbitemdoa;
select * from tbdonatario;
select * from tbdoacao;

-- Nome da pessoa que recebeu a doação e nome do produto doado

select don.nome, don.produto_recebido
from tbdonatario as don
inner join tbdoacao as doa
on doa.codDoa = don.codDon;

-- Nome da pessoa que doou e o telefone

select it.nome, usu.telefoneUsu
from tbitemdoa as it
inner join tbdoacao as doa
on it.codItemDoa = doa.codDoa
inner join tbusuarios as usu
on doa.codDoa = usu.codUsu;

