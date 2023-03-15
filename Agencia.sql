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
foreign key (id_ban_fk) references banco (id_ban)
);
create table funcionario(
id_fun int primary key auto_increment,
nome_fun varchar (100),
telefone_fun varchar (100),
cpf_fun varchar (100),
rg_fun varchar (100),
funcao_fun varchar (100),
email_fun varchar (100),
endereco_fun varchar (300),
salario_fun double,
id_end_fk int not null,
id_age_fk int not null,
foreign key (id_age_fk) references agencia (id_age),
foreign key (id_end_fk) references endereco (id_end)
);
create table conta(
id_con int primary key auto_increment,
tipo_con varchar (100),
saldo_con double,
limite_con double,
id_cli_fk int not null,
id_fun_fk int not null,
foreign key (id_cli_fk) references cliente (id_cli),
foreign key (id_fun_fk) references funcionario (id_fun)
);
create table emprestimo(
id_emp int primary key auto_increment,
tipo_emp varchar (100),
valor_emp double,
juros_emp double,
parcela_emp int,
prazo_emp date,
id_con_fk int not null,
foreign key (id_con_fk) references conta (id_con)
);
create table despesa(
id_des int primary key auto_increment,
numero_des int,
origem_des varchar (100),
vencimento_des date,
valor_des double
);
create table caixa(
id_cai int primary key auto_increment,
tipo_cai varchar (100),
numero_cai int,
saldo_atual_cai double,
id_fun_fk int not null,
foreign key (id_fun_fk) references funcionario (id_fun)
);
create table pagamento(
id_pag int primary key auto_increment,
valor_pag double,
juros_pag double,
date_pag date,
id_con_fk int not null,
id_des_fk int not null,
id_cai_fk int not null,
foreign key (id_con_fk) references conta (id_con),
foreign key (id_des_fk) references despesa (id_des),
foreign key (id_cai_fk) references caixa (id_cai)
);
create table transferencia(
id_trans int primary key auto_increment,
valor_trans double,
tipo_trans varchar (100),
data_trans date,
id_con_des_fk int not null,
id_con_ord_fk int not null,
id_cai_fk int not null,
foreign key (id_con_des_fk) references conta (id_con),
foreign key (id_con_ord_fk) references conta (id_con),
foreign key (id_cai_fk) references caixa (id_cai)
);
create table deposito(
id_dep int primary key auto_increment,
hora_dep time,
data_dep date,
valor_dep double,
tipo_dep varchar (100),
id_con_fk int not null,
id_cai_fk int not null,
foreign key (id_con_fk) references conta (id_con),
foreign key (id_cai_fk) references caixa (id_cai)
);
create table investimento(
id_inv int primary key auto_increment,
parcela_inv int,
prazo_inv date,
id_con_fk int not null,
id_aca_fk int not null,
foreign key (id_con_fk) references conta (id_con),
foreign key (id_aca_fk) references acao (id_aca)
);
create table saque(
id_saq int primary key auto_increment,
hora_saq time,
data_saq date,
valor_saq double,
id_cai_fk int not null,
id_con_fk int not null,
foreign key (id_con_fk) references conta (id_con),
foreign key (id_cai_fk) references caixa (id_cai)
);
create table cli_con(
id_cli_con int primary key auto_increment,
id_cli_fk int not null,
id_con_fk int not null,
foreign key (id_con_fk) references conta (id_con),
foreign key (id_cli_fk) references cliente (id_cli)
);