
-- TABELAS PRINCIPAIS
-- Se relacionam com tabela fato

create table filmes (
	id varchar primary key,
	titulo varchar(100) not null,
	genero varchar(20),
	duracao time,
	ano integer,
	fitas_disponiveis integer
);

create table socios (
	id varchar primary key,
	nomecompleto varchar(100) not null,
	endereco varchar(100),
	telefone varchar(15)
);

-- TABELA FATO
-- Acontece numa data, local e/ou horário

create table emprestimos (
	id varchar primary key,
	dataretirada date not null,
	dataprevista date not null,
	datadevolucao date,
	multa numeric(8,2),
	pago boolean,
	socio varchar not null,
	filme varchar not null
);

-- TABELA RELAÇÃO
-- Representa um relacionamento N:N

create table emprestimos_filmes (
	emprestimo varchar,
  	filme varchar,
  	primary key (emprestimo, filme)
);

-- CHAVES ESTRANGEIRAS

alter table emprestimos 
add constraint fk_socio foreign key (socio) 
references socios (id);

alter table emprestimos_filmes 
add constraint fk_filme foreign key (filme) 
references filmes(id);

alter table emprestimos_filmes 
add constraint fk_emprestimo foreign key (emprestimo) 
references emprestimos(id);
