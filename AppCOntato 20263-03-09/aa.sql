CREATE DATABASE app_contato_bd;
use app_contato_bd;

create table contato_cont(
id_cont int not null auto_increment primary key,
nome_cont varchar(100),
telefone_cont varchar(50),
data_nasc_cont date,
sexo_cont varchar(20),
email_cont varchar(100)
);
select * from contato_cont;
INSERT INTO contato_cont (id_cont, nome_cont, telefone_cont, data_nasc_cont, sexo_cont, email_cont) VALUES
  (1, "Colby Poole","(565) 538-2566","2023-03-02", "masc", "augusto@gmail.com"),
  (2, "Alan Wyatt","(782) 512-8482","2023-02-03", "masc", "manu@gmail.com"),
  (3, "Carla Walker","(267) 373-8716","2022-01-01", "fem", "dome@gmail.com"),
  (4, "Ezekiel Rose","1-482-878-4262","2022-07-08", "masc", "kewillem@gmail.com"),
  (5, "Camille Trujillo","1-313-886-4212","2022-09-09", "fem", "nikoly@gmail.com");