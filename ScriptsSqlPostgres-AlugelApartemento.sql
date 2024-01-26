
-- TABELA MODELO SECUNDÁRIAS
-- Se relaciona com outras tabelas modelo

CREATE TABLE proprietarios (
	id VARCHAR PRIMARY KEY,
	cpf CHAR(11) NOT NULL,
	nomecompleto VARCHAR(100) NOT NULL,
	datanascimento DATE,
	estadocivil VARCHAR(20) NOT NULL
);

-- TABLAS MODELO PRINCIPAIS
-- Se relacionam com a tabela fato

CREATE TABLE unidades (
	id VARCHAR PRIMARY KEY,
	numero VARCHAR(10) NOT NULL,
	nomecondominio VARCHAR(50) NOT NULL,
	edificio VARCHAR(50) NOT NULL,
	proprietario VARCHAR NOT NULL
);

CREATE TABLE inquilinos(
	id VARCHAR PRIMARY KEY,
 	cpf CHAR(11) NOT NULL,
	nomecompleto VARCHAR(50) NOT NULL,
	datanascimento DATE,
	estadocivil VARCHAR(20) NOT NULL
);

-- TABELA FATO
-- Acontece numa data, local e/ou horário

CREATE TABLE contratos (
	id VARCHAR PRIMARY KEY,
	datainicio DATE NOT NULL,
	datatermino DATE,
	valor NUMERIC(10,2) NOT NULL,
	inquilino VARCHAR NOT NULL,
	unidade VARCHAR NOT NULL
);

-- CHAVES ESTRANGEIRAS
	
ALTER TABLE unidades ADD CONSTRAINT 
fk_proprietario FOREIGN KEY (proprietario) 
REFERENCES proprietarios(id);

ALTER TABLE contratos ADD CONSTRAINT 
fk_inquilino FOREIGN KEY (inquilino) 
REFERENCES inquilinos(id);

ALTER TABLE contratos ADD CONSTRAINT 
fk_unidade FOREIGN KEY (unidade) 
REFERENCES unidades(id);
