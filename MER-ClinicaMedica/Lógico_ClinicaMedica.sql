/* Lógico_ClinicaMedica: */

CREATE TABLE Consultas (
    idConsulta INTEGER PRIMARY KEY,
    dataConsulta DATE,
    valorConsulta FLOAT,
    motivoConsulta VARCHAR,
    medico INTEGER,
    paciente INTEGER,
    exame INTEGER,
    funcionario INTEGER
);

CREATE TABLE Paciente (
    idPaciente INTEGER PRIMARY KEY,
    nomePaciente VARCHAR,
    enderecoPaciente VARCHAR,
    cpf VARCHAR,
    telefone VARCHAR
);

CREATE TABLE Medicos (
    Atributo_1 INTEGER PRIMARY KEY,
    nomeMedico VARCHAR,
    enderecoMedico VARCHAR,
    cpf VARCHAR,
    crm VARCHAR,
    telefone VARCHAR,
    especialidade VARCHAR
);

CREATE TABLE Exames (
    idExame INTEGER PRIMARY KEY,
    descricaoExame VARCHAR,
    nomeExame VARCHAR
);

CREATE TABLE Funcionario (
    idFuncionario INTEGER PRIMARY KEY,
    nomeFuncionario VARCHAR,
    cpf VARCHAR,
    cargo VARCHAR,
    telefone VARCHAR,
    enderecoFuncionario VARCHAR
);

CREATE TABLE HistoricoMedico (
    idHistoricoMedico INTEGER PRIMARY KEY,
    fk_Medicos_Atributo_1 INTEGER,
    fk_Consultas_idConsulta INTEGER
);

CREATE TABLE HistoricoPaciente (
    idHitoricoPaciente INTEGER PRIMARY KEY,
    fk_Paciente_idPaciente INTEGER,
    fk_Consultas_idConsulta INTEGER
);

CREATE TABLE HistoricoExames (
    idHistoricoExame INTEGER PRIMARY KEY,
    fk_Exames_idExame INTEGER,
    fk_Consultas_idConsulta INTEGER
);

CREATE TABLE HistoricoFuncionario (
    fk_Funcionario_idFuncionario INTEGER,
    fk_Consultas_idConsulta INTEGER,
    idHitoricoFuncionario INTEGER PRIMARY KEY
);
 
ALTER TABLE Consultas ADD CONSTRAINT FK_Consultas_2
    FOREIGN KEY (medico???, paciente???, exame???, funcionario???)
    REFERENCES HistoricoFuncionario (???, ???, ???, ???);
 
ALTER TABLE HistoricoMedico ADD CONSTRAINT FK_HistoricoMedico_1
    FOREIGN KEY (fk_Medicos_Atributo_1)
    REFERENCES Medicos (Atributo_1)
    ON DELETE RESTRICT;
 
ALTER TABLE HistoricoMedico ADD CONSTRAINT FK_HistoricoMedico_2
    FOREIGN KEY (fk_Consultas_idConsulta)
    REFERENCES Consultas (idConsulta)
    ON DELETE SET NULL;
 
ALTER TABLE HistoricoPaciente ADD CONSTRAINT FK_HistoricoPaciente_1
    FOREIGN KEY (fk_Paciente_idPaciente)
    REFERENCES Paciente (idPaciente)
    ON DELETE RESTRICT;
 
ALTER TABLE HistoricoPaciente ADD CONSTRAINT FK_HistoricoPaciente_2
    FOREIGN KEY (fk_Consultas_idConsulta)
    REFERENCES Consultas (idConsulta)
    ON DELETE SET NULL;
 
ALTER TABLE HistoricoExames ADD CONSTRAINT FK_HistoricoExames_1
    FOREIGN KEY (fk_Exames_idExame)
    REFERENCES Exames (idExame)
    ON DELETE RESTRICT;
 
ALTER TABLE HistoricoExames ADD CONSTRAINT FK_HistoricoExames_2
    FOREIGN KEY (fk_Consultas_idConsulta)
    REFERENCES Consultas (idConsulta)
    ON DELETE SET NULL;
 
ALTER TABLE HistoricoFuncionario ADD CONSTRAINT FK_HistoricoFuncionario_1
    FOREIGN KEY (fk_Funcionario_idFuncionario)
    REFERENCES Funcionario (idFuncionario)
    ON DELETE RESTRICT;
 
ALTER TABLE HistoricoFuncionario ADD CONSTRAINT FK_HistoricoFuncionario_2
    FOREIGN KEY (fk_Consultas_idConsulta)
    REFERENCES Consultas (idConsulta)
    ON DELETE SET NULL;