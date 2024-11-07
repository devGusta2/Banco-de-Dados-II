CREATE DATABASE clinica;
USE clinica;

CREATE TABLE tbMedico(
    idMedico INT PRIMARY KEY AUTO_INCREMENT,
    nomeMedico VARCHAR(50) NOT NULL,
    crm VARCHAR(15) NOT NULL
    
);

CREATE TABLE tbEspecialidade(
    idEspecialidade INT PRIMARY KEY AUTO_INCREMENT,
    nomeEspecialidade VARCHAR(30) NOT NULL
);

CREATE TABLE tbPaciente(
    cpfPaciente CHAR(11) UNIQUE NOT NULL,
    nomePaciente VARCHAR(50)
);

CREATE TABLE tbConvenio(
    idConvenio INT PRIMARY KEY AUTO_INCREMENT,
    nomeConvenio VARCHAR(30),
    titularConvenio VARCHAR(30)
);

CREATE TABLE tbExame(
    idExame INT PRIMARY KEY AUTO_INCREMENT,
    nomeExame VARCHAR(50)
);

-- Criando tabelas de relacionamento --
CREATE TABLE tbConsulta (
    idConsulta INT PRIMARY KEY AUTO_INCREMENT,
    dataConsulta DATE NOT NULL,
    horarioConsulta TIME NOT NULL,
    idMedico INT,
    FOREIGN KEY (idMedico) REFERENCES tbMedico(idMedico),
    cpfPaciente CHAR(11),  -- Usando CHAR(11) para corresponder à chave primária da tabela tbPaciente
    FOREIGN KEY (cpfPaciente) REFERENCES tbPaciente(cpfPaciente)  -- Referenciando a chave primária corretamente
);

CREATE TABLE tbMedicoEspecialidade(
    idMedico INT,
    FOREIGN KEY (idMedico) REFERENCES tbMedico(idMedico),
    idEspecialidade INT,
    FOREIGN KEY (idEspecialidade) REFERENCES tbEspecialidade(idEspecialidade),
    PRIMARY KEY (idMedico, idEspecialidade)
);

CREATE TABLE tbConvenioPaciente(
    idConvenio INT,
    cpfPaciente CHAR(11),  -- Alterado para CHAR(11), correspondendo ao tipo de dado de 'cpfPaciente' em tbPaciente
    FOREIGN KEY (idConvenio) REFERENCES tbConvenio(idConvenio),
    FOREIGN KEY (cpfPaciente) REFERENCES tbPaciente(cpfPaciente),
    PRIMARY KEY (idConvenio, cpfPaciente)  -- Usando chave primária composta
);

-- Tabela de relacionamento muitos-para-muitos entre tbConsulta e tbExame
CREATE TABLE tbConsultaExame(
    idConsulta INT,
    FOREIGN KEY (idConsulta) REFERENCES tbConsulta(idConsulta),
    idExame INT,
    FOREIGN KEY (idExame) REFERENCES tbExame(idExame),
    PRIMARY KEY (idConsulta, idExame)
);



INSERT INTO tbMedico (nomeMedico, crm) 
VALUES 
    ('Eduardo', '23243564675'),
    ('Ana Costa', '12345678901'),
    ('Carlos Silva', '98765432100'),
    ('Mariana Oliveira', '11223344556'),
    ('Jorge Pereira', '33445566778'),
    ('Patrícia Lima', '44556677889'),
    ('Roberta Santos', '55667788990'),
    ('Lucas Ferreira', '66778899001'),
    ('Fernanda Rodrigues', '77889900112'),
    ('Ricardo Almeida', '88990011223'),
    ('Vanessa Costa', '99001122334'),
    ('Rafael Souza', '10111223345'),
    ('Luana Martins', '20222334456'),
    ('Felipe Rocha', '31323344567');






INSERT INTO tbEspecialidade (nomeEspecialidade) 
VALUES 
    ('Cardiologia'),
    ('Dermatologia'),
    ('Neurologia'),
    ('Pediatria'),
    ('Ortopedia'),
    ('Oftalmologia'),
    ('Ginecologia'),
    ('Psiquiatria'),
    ('Otolaringologia'),
    ('Endocrinologia');
    
    
    INSERT INTO tbPaciente (cpfPaciente, nomePaciente) 
VALUES 
    ('12345678901', 'João Silva'),
    ('23456789012', 'Maria Oliveira'),
    ('34567890123', 'Carlos Pereira'),
    ('45678901234', 'Fernanda Costa'),
    ('56789012345', 'Lucas Rocha'),
    ('67890123456', 'Juliana Martins'),
    ('78901234567', 'Ricardo Almeida'),
    ('89012345678', 'Patrícia Santos'),
    ('90123456789', 'Gustavo Ferreira'),
    ('01234567890', 'Amanda Lima');



INSERT INTO tbConvenio (nomeConvenio, titularConvenio) 
VALUES 
    ('Unimed', 'João Silva'),
    ('Bradesco Saúde', 'Maria Oliveira'),
    ('SulAmérica', 'Carlos Pereira'),
    ('Amil', 'Fernanda Costa'),
    ('Porto Seguro', 'Lucas Rocha'),
    ('NotreDame Intermédica', 'Juliana Martins'),
    ('Itaú Saúde', 'Ricardo Almeida'),
    ('Hapvida', 'Patrícia Santos'),
    ('Assim Saúde', 'Gustavo Ferreira'),
    ('Cassi', 'Amanda Lima');





INSERT INTO tbExame (nomeExame) 
VALUES 
    ('Exame de Sangue'),
    ('Ressonância Magnética'),
    ('Tomografia Computadorizada'),
    ('Eletrocardiograma'),
    ('Ultrassonografia'),
    ('Raio-X'),
    ('Mamografia'),
    ('Endoscopia'),
    ('Teste de Esforço'),
    ('Exame de Urina');




INSERT INTO tbConsulta (dataConsulta, horarioConsulta, idMedico, cpfPaciente) 
VALUES 
    ('2024-11-10', '09:00:00', 1, '12345678901'),
    ('2024-11-10', '10:00:00', 2, '23456789012'),
    ('2024-11-11', '14:00:00', 3, '34567890123'),
    ('2024-11-12', '15:00:00', 4, '45678901234'),
    ('2024-11-12', '16:00:00', 5, '56789012345'),
    ('2024-11-13', '08:00:00', 6, '67890123456'),
    ('2024-11-13', '11:00:00', 7, '78901234567'),
    ('2024-11-14', '13:00:00', 8, '89012345678'),
    ('2024-11-14', '17:00:00', 9, '90123456789'),
    ('2024-11-15', '08:30:00', 10, '01234567890');



INSERT INTO tbMedicoEspecialidade (idMedico, idEspecialidade) 
VALUES 
    (1, 1),  -- Eduardo (Cardiologia)
    (2, 2),  -- Ana Costa (Dermatologia)
    (3, 3),  -- Carlos Silva (Neurologia)
    (4, 4),  -- Mariana Oliveira (Pediatria)
    (5, 5),  -- Jorge Pereira (Ortopedia)
    (6, 6),  -- Patrícia Lima (Oftalmologia)
    (7, 7),  -- Roberta Santos (Ginecologia)
    (8, 8),  -- Lucas Ferreira (Psiquiatria)
    (9, 9),  -- Fernanda Rodrigues (Otolaringologia)
    (10, 10); -- Ricardo Almeida (Endocrinologia)




INSERT INTO tbConvenioPaciente (idConvenio, cpfPaciente) 
VALUES 
    (1, '12345678901'),  -- João Silva (Unimed)
    (2, '23456789012'),  -- Maria Oliveira (Bradesco Saúde)
    (3, '34567890123'),  -- Carlos Pereira (SulAmérica)
    (4, '45678901234'),  -- Fernanda Costa (Amil)
    (5, '56789012345'),  -- Lucas Rocha (Porto Seguro)
    (6, '67890123456'),  -- Juliana Martins (NotreDame Intermédica)
    (7, '78901234567'),  -- Ricardo Almeida (Itaú Saúde)
    (8, '89012345678'),  -- Patrícia Santos (Hapvida)
    (9, '90123456789'),  -- Gustavo Ferreira (Assim Saúde)
    (10, '01234567890'); -- Amanda Lima (Cassi)




INSERT INTO tbConsultaExame (idConsulta, idExame) 
VALUES 
    (1, 1),  -- Consulta 1 (Exame de Sangue)
    (1, 4),  -- Consulta 1 (Eletrocardiograma)
    (2, 3),  -- Consulta 2 (Ressonância Magnética)
    (3, 2),  -- Consulta 3 (Tomografia Computadorizada)
    (4, 5),  -- Consulta 4 (Ultrassonografia)
    (5, 6),  -- Consulta 5 (Raio-X)
    (6, 7),  -- Consulta 6 (Mamografia)
    (7, 8),  -- Consulta 7 (Endoscopia)
    (8, 9),  -- Consulta 8 (Teste de Esforço)
    (9, 10); -- Consulta 9 (Exame de Urina)
    
    
    
    
    
SELECT tbMedico.nomeMedico, tbPaciente.nomePaciente 
FROM tbMedico
JOIN tbConsulta ON tbMedico.idMedico = tbConsulta.idMedico
JOIN tbPaciente ON tbPaciente.cpfPaciente = tbConsulta.cpfPaciente;

