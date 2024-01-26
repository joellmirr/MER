
--tabela curso modelo primaria
--nao tem realcionamento direto com outra tabela

CREATE TABLE "curso" (
  "idcurso" varchar UNIQUE PRIMARY KEY NOT NULL,
  "descricaocursos" varchar NOT NULL,
  "cargahorariacursos" integer  NOT NULL CHECK(cargahorariacursos >= 0),
  "modalidade" varchar NOT NULL  CHECK(modalidade in ('Tecnólogo', 'Técnico', 'Qualificação', 'Aperfeiçoamento', 'Capacitação', 'Iniciação')),
  "eixotecnologico" varchar NOT NULL
);

insert into curso values
	(1,'Java',200,'Aperfeiçoamento','profissionalizante'),
	(2,'PHP',200,'Capacitação','Qualificação'),
	(3,'Javascript',200,'Iniciação','Aperfeiçoamento'),
	(4,'NodeJs',200,'Aperfeiçoamento','Iniciação'),
	(5,'Python',200,'Técnico','Técnico');
	
select * from curso

-----------------------------------------------------------------------------------------------------------------------------------------
--tabela modelo unidade secundaria
--por realcionar com outra tabela modelo primaria (tabela cursos)

CREATE TABLE "unidade" (
  "idunidade" varchar UNIQUE PRIMARY KEY NOT NULL,
  "descricaounidade" varchar NOT NULL,
  "cargahorariaunidade" integer DEFAULT 0 NOT NULL CHECK(cargahorariaunidade >= 0),
  "ordem" varchar   NOT NULL,
  "professor" varchar   NOT NULL,
  "curso" varchar   NOT NULL
);

insert into unidade values
	(1,'Senac Cora Coralina','200','1','Dani','1'),
	(2,'Senac Cora Coralina','150','1','maria','2'),
	(3,'Senac Cora Coralina','250','1','Jose','3'),
	(4,'Senac Cora Coralina','300','1','Bia','4'),
	(5,'Senac Cora Coralina','200','1','Dani','5');
	
select * from unidade
----------------------------------------------------------------------------------------------------------------------------------------
--tabela primaria, por relacionar tabela fato

CREATE TABLE "turma" (
  "idturma" varchar UNIQUE PRIMARY KEY NOT NULL,
  "datainicio" date DEFAULT CURRENT_DATE NOT NULL,
  "datafim" date DEFAULT CURRENT_DATE NOT NULL,
  "horasaulas" integer NOT NULL CHECK(horasaulas >= 0),
  "turno" varchar NOT NULL CHECK(turno in ('Matutino', 'Vespertino', 'Noturno')),
  "curso" varchar NOT NULL
);
---------------------------------------------------------------------------------------------------------------------------------------
insert into turma values
	(1,'10/01/2024','10/03/2024',200,'Matutino','1'),
	(2,'11/03/2024','13/05/2024',200,'Matutino','2'),
	(3,'12/05/2024','14/07/2024',200,'Matutino','3'),
	(4,'13/07/2024','15/09/2024',200,'Matutino','4'),
	(5,'14/09/2024','15/12/2024',200,'Matutino','5');

select * from turma
----------------------------------------------------------------------------------------------------------------------------------------
--tabela fato(pois fato acontece com data e local)

CREATE TABLE "aula" (
  "idaula" varchar UNIQUE PRIMARY KEY NOT NULL,
  "dataaula" date  DEFAULT CURRENT_DATE NOT NULL CHECK(dataaula >= CURRENT_DATE),
  "status" varchar DEFAULT 'Prevista' NOT NULL CHECK(status in ('Prevista', 'Ministrada', 'Cancelada')),
  "localaula" varchar NOT NULL,
  "docente" varchar NOT NULL,
  "turma" varchar NOT NULL,
  "unidade" varchar NOT NULL
);

insert into aula (unidade,turma,docente,localaula,status,dataaula,idaula) values ('1','1','1','sala30','Prevista','26/01/2024','1');
insert into aula (unidade,turma,docente,localaula,status,dataaula,idaula) values ('2','2','2','sala20','Ministrada','26/01/2024','2');
insert into aula (unidade,turma,docente,localaula,status,dataaula,idaula) values ('1','1','1','sala30','Cancelada','26/01/2024','3');
insert into aula (unidade,turma,docente,localaula,status,dataaula,idaula) values ('1','1','1','sala30','Prevista','26/01/2024','4');
insert into aula (unidade,turma,docente,localaula,status,dataaula,idaula) values ('1','1','1','sala30','Cancelada','26/01/2024','5');

select * from aula

--------------------------------------------------------------------------------------------------------------------------------------------
--tabela fato(pois fato acontece com data e local)   

CREATE TABLE "recessos" (
  "idrecesso" varchar UNIQUE PRIMARY KEY NOT NULL,
  "datarecesso" date  DEFAULT CURRENT_DATE NOT NULL,
  "descricaorecesso" varchar NOT NULL
);

insert into recessos (descricaorecesso,datarecesso,idrecesso) values('faltou agua','26/01/2024','1');
insert into recessos (descricaorecesso,datarecesso,idrecesso) values('faltou internet','26/01/2024','2');
insert into recessos (descricaorecesso,datarecesso,idrecesso) values('faltou energia','26/01/2024','3');
insert into recessos (descricaorecesso,datarecesso,idrecesso) values('feriado','26/01/2024','4');
insert into recessos (descricaorecesso,datarecesso,idrecesso) values('feriado','26/01/2024','5');

select * from aula

----------------------------------------------------------------------------------------------------------------------------------------------

ALTER TABLE "unidade" ADD FOREIGN KEY ("curso") REFERENCES "curso" ("idcurso");

ALTER TABLE "turma" ADD FOREIGN KEY ("curso") REFERENCES "curso" ("idcurso");

ALTER TABLE "aula" ADD FOREIGN KEY ("turma") REFERENCES "turma" ("idturma");

ALTER TABLE "aula" ADD FOREIGN KEY ("unidade") REFERENCES "unidade" ("idunidade");

ALTER TABLE "recessos" ADD FOREIGN KEY ("idrecesso") REFERENCES "aula" ("idaula");


















