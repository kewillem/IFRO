create database bd_agencia_bancaria_kew;
use bd_agencia_bancaria_kew;

create table endereco(
id_end integer primary key auto_increment,
rua_end varchar (300) not null,
numero_end int,
bairro_end varchar (300),
cep_end varchar (30) not null,
uf_end varchar (300) not null,
pais_end varchar (300) not null
);

create table banco(
id_ban int primary key auto_increment,
nome_ban varchar (300) not null,
cnpj_ban varchar (300),
logo_ban blob,
site_ban varchar (300),
telefone_ban varchar (300),
id_end_fk int not null,
foreign key (id_end_fk) references endereco (id_end)
);

create table acao(
id_aca int primary key auto_increment,
nome_aca varchar (300) not null,
rendimento_aca double not null,
origem_aca varchar (300)
);

create table cliente(
id_cli int primary key auto_increment,
nome_cli varchar (300),
cpf_cli varchar (30),
rg_cli varchar (30),
sexo_cli varchar (30),
data_nasc_cli date,
tel_cli varchar (30),
email_cli varchar (100),
id_end_fk int not null,
foreign key (id_end_fk) references endereco (id_end)
);

create table agencia(
id_age int primary key auto_increment,
email_age varchar (100),
telefone_age varchar (100),
numero_age int,
id_end_fk int not null,
id_ban_fk int not null,
foreign key (id_end_fk) references endereco (id_end),
foreign key (id_ban_fk) references endereco (id_ban)
);


