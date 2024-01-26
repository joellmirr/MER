CREATE TABLE AcidenteVeiculo (
	idacidente INTEGER PRIMARY key 	AUTO_INCREMENT,
    descricaoacidente VARCHAR(100) NOT NULL,
    dataacidente DATE NOT NULL,
    horaacidente TIMESTAMP NOT NULL,
    localizacao INTEGER NOT NULL, 
    naturezaacidente VARCHAR(100) NOT NULL,
    condicoesclimaticas VARCHAR(100) NOT NULL,
    veiculo INTEGER NOT NULL,
    vitima INTEGER NOT NULL,
    danos VARCHAR(100) NOT NULL
);

CREATE TABLE Veiculo (
	idveiculo INTEGER PRIMARY key AUTO_INCREMENT,
    fabricante VARCHAR(100) NOT NULL,
    modelo VARCHAR(100) NOT NULL,
    anofabricacao INTEGER NOT NULL, 
    placa VARCHAR(7) NOT NULL,
    motorista INTEGER NOT NULL
);

CREATE TABLE PessoaVitima (
    idpessoa INTEGER PRIMARY key AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(100) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    descricaopessoa VARCHAR(100) NOT NULL,
    telefone VARCHAR(9) NOT NULL
);

CREATE TABLE Localizacao (
    idlocalizacao INTEGER PRIMARY key AUTO_INCREMENT,
    rodovia VARCHAR(100) NOT NULL,
    estado VARCHAR(100) NOT NULL,
    municipio VARCHAR(100) NOT NULL,
    descricaolocalizacao VARCHAR(100) NOT NULL
);

CREATE TABLE Motorista (
    idmotorista INTEGER PRIMARY key AUTO_INCREMENT,
    endereco VARCHAR(100) NOT NULL,
    cnh INTEGER NOT NULL,
    descricaomotorista VARCHAR(100) NOT NULL,
    telefone VARCHAR(9) NOT NULL
);

CREATE TABLE VitimaAcidente (
    idvitimaacidente INTEGER PRIMARY key AUTO_INCREMENT,
    pessoa INTEGER NOT NULL,
    acidente INTEGER NOT NULL
);

ALTER TABLE AcidenteVeiculo ADD CONSTRAINT FK_AcidenteVeiculo_Localizacao
    FOREIGN KEY (localizacao)
    REFERENCES Localizacao (idlocalizacao);

ALTER TABLE AcidenteVeiculo ADD CONSTRAINT FK_AcidenteVeiculo_Veiculo
    FOREIGN KEY (veiculo)
    REFERENCES Veiculo (idveiculo);
   
   ALTER TABLE AcidenteVeiculo ADD CONSTRAINT FK_AcidenteVeiculo_Veiculo_Pessoa
    FOREIGN KEY (vitima)
    REFERENCES  PessoaVitima (idpessoa);

ALTER TABLE VitimaAcidente ADD CONSTRAINT FK_VitimaAcidente_Pessoa
    FOREIGN KEY (pessoa)
    REFERENCES PessoaVitima (idpessoa);
   
   
ALTER TABLE VitimaAcidente ADD CONSTRAINT FK_VitimaAcidente_Pessoa_Acidente
    FOREIGN KEY ( acidente)
    REFERENCES  AcidenteVeiculo (idacidente);
   
   
   
