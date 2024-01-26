
-- TABELAS MODELO SECUNDÁRIAS
-- Se relacionam com outras tabelas modelo

create table departamento (
  iddepartamento varchar primary key,
  sigla varchar(10) not null,
  descricao varchar(50) not null
);

create table cargo (
  idcargo varchar primary key,
  cargahoraria integer not null,
  salario numeric(10,2) not null,
  nivelexperiencia varchar(20),
  departamento varchar
);

-- TABELA MODELO PRIMÁRIA
-- Se relaciona com a tabela fato

create table empregado (
  idempregado varchar primary key,
  cpf char(11) not null,
  nome varchar(100) not null,
  estadocivil varchar(20) not null,
  datanascimento date not null,
  cargo varchar
);

-- TABELA FATO
-- Registra algo que acontece numa data, local e/ou horário

create table expediente (
  idexpediente varchar primary key,
  dataexpediente date not null,
  entrada time not null,
  saidaalmoco time not null,
  entradaalmoco time not null,
  saida time not null,
  empregado varchar
);

-- CHAVES ESTRANGEIRAS

alter table cargo
add constraint departamento_fk foreign key (departamento) 
references departamento(iddepartamento);

alter table empregado
add constraint cargo_fk foreign key (cargo) 
references cargo(idcargo);

alter table expediente
add constraint empregado_fk foreign key (empregado) 
references empregado(idempregado);
