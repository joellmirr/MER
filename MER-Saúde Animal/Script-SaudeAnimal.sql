/* Lógico_SaudeAnimal: */

CREATE TABLE ExamesAnimal (
    idexameeanimal INTEGER PRIMARY key AUTO_INCREMENT,
    pesoanimal FLOAT NOT NULL,
    datapeso DATE NOT NULL,
    datavacina DATE NOT NULL,
    vacina VARCHAR(100) NOT NULL,
    tipoexame VARCHAR(100) NOT NULL,
    resultadoexame VARCHAR(100) NOT NULL,
    animal INTEGER NOT NULL,
    veterinario INTEGER NOT NULL
);

CREATE TABLE Animal (
    idanimal INTEGER PRIMARY KEY unique AUTO_INCREMENT,
    nomeanimal VARCHAR(100) NOT NULL,
    especie VARCHAR(100) NOT NULL,
    datanascimente DATE NOT NULL,
    sexo VARCHAR(10) NOT NULL,
    descricaoanimal VARCHAR(100) NOT NULL,
    Fazendaanimal INTEGER NOT NULL
);

CREATE TABLE Veterinario (
    idveterinario INTEGER PRIMARY KEY unique AUTO_INCREMENT,
    nomeveterinario VARCHAR(100) NOT NULL,
    especilaidade VARCHAR(100) NOT NULL,
    telefonevterinario VARCHAR(100) NOT NULL,
    crmv VARCHAR(100) NOT NULL,
    enderecoveterinario VARCHAR(100) NOT NULL
);

CREATE TABLE Fazenda (
    idfazenda INTEGER PRIMARY key unique AUTO_INCREMENT,
    nomefazenda VARCHAR(100) NOT NULL,
    enderecofazenda VARCHAR(100) NOT NULL,
    proprietariofazenda VARCHAR(100) NOT NULL,
    telefonefazenda VARCHAR(100) NOT NULL
);
 
ALTER TABLE ExamesAnimal ADD CONSTRAINT FK_ExamesAnimal_2
    FOREIGN KEY (veterinario)
    REFERENCES Veterinario (idveterinario);
   
   ALTER TABLE ExamesAnimal ADD CONSTRAINT FK_ExamesAnimal
    FOREIGN KEY (animal)
    REFERENCES Animal (idanimal);
 
ALTER TABLE Animal ADD CONSTRAINT FK_Animal_3
    FOREIGN KEY (Fazendaanimal)
    REFERENCES Fazenda (idfazenda);
    
   
   
   
   
   
   
   