CREATE TABLE Login (
    id VARCHAR(50) PRIMARY KEY AUTO_INCREMENT,
    usuario VARCHAR(50) NOT NULL,
    senha VARCHAR(10) NOT NULL
);

CREATE TABLE AcidenteVeiculo (
    idacidente VARCHAR(50) PRIMARY key AUTO_INCREMENT,
    descricaoacidente VARCHAR(100) NOT NULL,
    dataacidente DATE NOT NULL,
    horaacidente TIMESTAMP NOT NULL,
    danos VARCHAR(100) NOT NULL,
    rodovia VARCHAR(100) NOT NULL,
    uf VARCHAR(100) NOT NULL,
    municipio VARCHAR(100) NOT NULL,
    descricaolocalizacao VARCHAR(100) NOT NULL
    veiculo INTEGER NOT NULL,
    vitima INTEGER NOT NULL
    
);

CREATE TABLE Veiculo (
    idveiculo VARCHAR(50) PRIMARY key AUTO_INCREMENT,
    fabricante VARCHAR(100) NOT NULL,
    modelo VARCHAR(100) NOT NULL,
    anofabricacao INTEGER NOT NULL, 
    placa VARCHAR(7) NOT NULL,
    motorista INTEGER NOT NULL
);

CREATE TABLE PessoaVitima (
    idpessoa VARCHAR(50) PRIMARY key AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(100) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    descricaopessoa VARCHAR(100) NOT NULL,
    telefone VARCHAR(9) NOT NULL
);

CREATE TABLE Motorista (
    idmotorista VARCHAR(50) PRIMARY key AUTO_INCREMENT,
    endereco VARCHAR(100) NOT NULL,
    cnh VARCHAR(10) NOT NULL,
    descricaomotorista VARCHAR(100) NOT NULL,
    telefone VARCHAR(9) NOT NULL
);

    ALTER TABLE AcidenteVeiculo ADD CONSTRAINT FK_AcidenteVeiculo_Veiculo
    FOREIGN KEY (veiculo)
    REFERENCES Veiculo (idveiculo);
   
   ALTER TABLE AcidenteVeiculo ADD CONSTRAINT FK_AcidenteVeiculo_Veiculo_Pessoa
    FOREIGN KEY (vitima)
    REFERENCES  PessoaVitima (idpessoa);


   
   
   
