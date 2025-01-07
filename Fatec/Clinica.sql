USE clinica

CREATE TABLE tbMedico(
	idMedico INT PRIMARY KEY AUTO_INCREMENT,
	nomeMedico VARCHAR(50) NOT NULL
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

-- criando tabelas de relacionamento--


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
	FOREIGN KEY (idConvenio) REFERENCES tbConvenio(idConvenio),
	idPaciente INT,
	FOREIGN KEY (idPaciente) REFERENCES tbPaciente(idPaciente),
	PRIMARY KEY (idConvenio, idPaciente)
);

-- só vira tabela dos de muitos pra muitos --

CREATE TABLE tbConsultaExame(
	
	idConsulta INT,
	FOREIGN KEY (idConsulta) REFERENCES tbConsulta(idConsulta),
	idExame INT,
	FOREIGN KEY (idExame) REFERENCES tbExame(idExame),
	PRIMARY KEY (idConsulta, idExame)
);
