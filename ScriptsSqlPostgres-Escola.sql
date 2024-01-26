
-- TABELA MODELO SECUNDÁRIA
-- Se relaciona com outra tabela modelo

create table disciplinas (
	id varchar primary key,
	descricao varchar(80) not null,
	docente varchar(100) not null,
	semestre varchar(20) not null
);

-- TABELA MODELO PRINCIPAL
-- Se relaciona com a tabela fato

create table alunos (
	id varchar primary key ,
	matricula varchar(30) not null ,
	cpf char(11) not null,
	nomecompleto varchar(100) not null,
	datanascimento date not null
);

-- TABELA FATO
-- Acontece numa data, local e/ou horário

create table provas (
	id varchar primary key,
	data_aplicacao date not null,
	nota float not null,
	situacao varchar(20) not null,
	disciplina varchar not null
);

-- TABELA RELAÇÃO
-- Representa um relacionamento N:N

 create table alunos_provas(
	aluno varchar,
  	prova varchar,
  	primary key (aluno, prova)
);

-- CHAVES ESTRANGEIRAS

-- A coluna "disciplina" da tabela "provas"
-- faz referência à coluna "id" da tabela "disciplinas"
alter table provas
add constraint disciplina_fk foreign key (disciplina) 
references disciplinas(id);

-- A coluna "aluno" da tabela "alunos_provas"
-- faz referência à coluna "id" da tabela "alunos"
alter table alunos_provas
add constraint aluno_fk foreign key (aluno) 
references alunos(id);

-- A coluna "prova" da tabela "alunos_provas"
-- faz referência à coluna "id" da tabela "provas"
alter table alunos_provas
add constraint prova_fk foreign key (prova) 
references provas(id);





 	
