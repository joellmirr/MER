--tabela modelo secundaria por realcionar com outra tabela modelo
create table cargo (
  idcargo varchar primary key unique,
  cargahoraria varchar(10) not null,
  salario numeric(10,2) not null check(salario >= 0),
  nivelexperiencia varchar(20) check (category in ('junior','pleno','estagio','master','vig','ultra')),
  departamento varchar
);
--departamento tabela modelo primaria
create table departamento (
  iddepartamento varchar primary key unique,
  sigla varchar(10) not null,
  descricao varchar(50) not null
);
--tabela primaria, relaciona tabela fato
create table empregado (
  idempr varchar primary key unique,
  cpf char(11) not null unique,
  nome varchar(100) not null,
  estadocivil varchar(20) not null ,
  datanascimento date not null,
  cargo varchar
 );
--tabela fato(fato acontece com data local)
create table expediente (
  idexpe varchar primary key unique,
  dataexpediente date not null default getdate(),
  entrada time not null default current_timestamp,
  entradaalmoco time not null default current_timestamp,
  saidaalmoco time not null default current_timestamp,
  saida time not null default current_timestamp,
  empregado varchar
);

alter table empregado
  add constraint cargo_fk foreign key (cargo) references cargo(idcargo);

alter table cargo
  add constraint departamento_fk foreign key (departamento) references departamento(iddepartamento);

alter table expediente
  add constraint empregado_fk foreign key (empregado) references empregado(idempr);
  
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Atividade - 2º: Popular as tabelas entidade principais, com 6 registros cada, sem informar o nome das colunas, vários registros de uma vez só.
--departamneto
insert into departamento  values(1,'pro','programador sistemas');
insert into departamento  values(2,'vig','vigilante');
insert into departamento  values(3,'pa','padeiro');
insert into departamento  values(4,'po','polical');
insert into departamento  values(5,'pe','pedreiro');
insert into departamento  values(6,'gu','guarda');

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Atividade - 1º: Popular as tabelas entidade secundárias, com 2 registros cada, citando o nome das colunas, um registro por vez
--cargo
insert into cargo(idcargo,cargahoraria,salario,nivelexperiencia,departamento) values(1,'10',1000,'junior',1);
insert into cargo(idcargo,cargahoraria,salario,nivelexperiencia,departamento) values(2,'20',2000,'vig',2);
insert into cargo(idcargo,cargahoraria,salario,nivelexperiencia,departamento) values(3,'30',3000,'estagio',3);
insert into cargo(idcargo,cargahoraria,salario,nivelexperiencia,departamento) values(4,'40',4000,'pleno',4);
insert into cargo(idcargo,cargahoraria,salario,nivelexperiencia,departamento) values(5,'50',5000,'master',5);
insert into cargo(idcargo,cargahoraria,salario,nivelexperiencia,departamento) values(6,'60',6000,'ultra',6);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Atividade - 2º: Popular as tabelas entidade principais, com 6 registros cada, sem informar o nome das colunas, vários registros de uma vez só.
--empregado
insert into empregado(idempr,cpf,nome,estadocivil,datanascimento,cargo) values(1,'joelmir','1234567890','solteiro','2024/01/25',1);
insert into empregado(idempr,cpf,nome,estadocivil,datanascimento,cargo) values(2,'joel','1234567890','solt','2024/01/10',2);
insert into empregado(idempr,cpf,nome,estadocivil,datanascimento,cargo) values(3,'jo','1234567890','casado','2024/01/15',3);
insert into empregado(idempr,cpf,nome,estadocivil,datanascimento,cargo) values(4,'jj','1234567890','instavel','2024/01/05',4);
insert into empregado(idempr,cpf,nome,estadocivil,datanascimento,cargo) values(5,'joelmir','1234567890','solteiro','2024/01/17',5);
insert into empregado(idempr,cpf,nome,estadocivil,datanascimento,cargo) values(6,'joel','1234567890','casado','2024/01/01',6);

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Atividade - 3º: Popular as tabelas fato, com 3 registros cada, sem informar o nome das colunas, um registro por vez.
--expediente
insert into expediente(idexpe,dataexpediente,entrada,entradaalmoco,saidaalmoco,saida,empregado) values(1,'2024/01/25','07:00:00','12:00:00','13:00:00','17:00:00',1);
insert into expediente(idexpe,dataexpediente,entrada,entradaalmoco,saidaalmoco,saida,empregado) values(2,'2024/01/25','07:00:00','12:00:00','13:00:00','17:00:00',2);
insert into expediente(idexpe,dataexpediente,entrada,entradaalmoco,saidaalmoco,saida,empregado) values(3,'2024/01/25','07:00:00','12:00:00','13:00:00','17:00:00',3);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select * from cargo;

select * from departamento;

select * from empregado;

select * from expediente;















