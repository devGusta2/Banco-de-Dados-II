USE dbLearnin;

CREATE TABLE tbAluno (
	idAluno INT AUTO_INCREMENT,
	nomeAluno VARCHAR (300),
	emailAluno VARCHAR (150),
	senhaAluno VARCHAR (150),
	PRIMARY KEY (idAluno)
);

CREATE TABLE tbLivro(
	idLivro INT AUTO_INCREMENT,
	nomeLivro VARCHAR (200),
	PRIMARY KEY (idLivro)
);

INSERT INTO tbAluno (nomeAluno, emailAluno, senhaAluno) VALUES 
('Gusta','gu@gmail.com','123'),
('Gelibolu','geli@gmail.com','eurj'),
('Marc','alo2Gmail.com','213412');

ALTER TABLE tbaluno ADD CONSTRAINT UNIQUE emailAluno;

INSERT INTO tblivro (nomeLivro, idAluno) VALUES ('Dom casmurro', 1);

DESCRIBE tbLivro

SELECT * FROM tblivro, tbAluno WHERE tblivro.idAluno = tbaluno.idAluno;

EXPLAIN SELECT * FROM tbaluno WHERE nomeAluno = 'Gusta';

CREATE INDEX ixAluno2 ON tbaluno (nomeAluno);


SHOW INDEXES FROM tbAluno;

SELECT * FROM tbaluno;
SELECT nomeLivro FROM tblivro INNER JOIN tbaluno ON tblivro.idLivro = tbaluno.idAluno;

SELECT nomeAluno FROM tbAluno INNER JOIN tbLivro ON tbAluno.idAluno =  tbLivro.idLivro;















CREATE TABLE logAlunos(
	id
)


DELIMETER //

CREATE TRIGGER dps_inserir_aluno
AFTER INSERT ON tbaluno
FOR EACH ROW /*para cada linha inserida */
BEGIN
INSERT INTO logAlunos(idAluno)
VALUE (NEW.idAluno,'Inseriu');
END//

DELIMETER;


DELIMITER //
	CREATE FUNCTION funcaoTeste(n1 INT,n2 INT)
	RETURNS INT
	BEGIN 
	RETURN n1 + n2;
END//

SELECT funcaoTeste(89, 20) AS resultado;


DELIMITER //

CREATE PROCEDURE testeProcedure2(IN id INT)
BEGIN
SELECT * FROM tbaluno WHERE idAluno = id;

END//

DELIMITER //

DROP PROCEDURE testeProcedure2;


CALL testeProcedure2(2);









