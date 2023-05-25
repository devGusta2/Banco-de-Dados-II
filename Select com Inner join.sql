USE bdEscolaIdiomas1

--Apresentar os nomes dos alunos ao lado do nome dos cursos que eles fazem:
SELECT nomeAluno, nomeCurso
FROM tbAluno
INNER JOIN tbMatricula ON tbAluno.codAluno = tbMatricula.codAluno
INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
INNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCurso;

--Apresentar a quantidade de alunos matriculados por nome do curso:
SELECT nomeCurso, COUNT(*) as quantidadeAlunosMatriculados
FROM tbCurso
INNER JOIN tbTurma ON tbCurso.codCurso = tbTurma.codCurso
INNER JOIN tbMatricula ON tbTurma.codTurma = tbMatricula.codTurma
GROUP BY nomeCurso;

--Apresentar a quantidade de alunos matriculados por nome da turma:
SELECT nomeTurma, COUNT(*) as quantidadeAlunosMatriculados
FROM tbTurma
INNER JOIN tbMatricula ON tbTurma.codTurma = tbMatricula.codTurma
GROUP BY nomeTurma;

--Apresentar a quantidade de alunos que fizeram matr�cula em maio de 2016:
SELECT COUNT(*) as quantidadeAlunosMatriculados
FROM tbMatricula
WHERE MONTH(dataMatricula) = 5 AND YEAR(dataMatricula) = 2016;

--Apresentar o nome dos alunos em ordem alfab�tica ao lado do nome das turmas em que est�o matriculados:
SELECT tbAluno.nomeAluno, tbTurma.nomeTurma
FROM tbAluno
INNER JOIN tbMatricula ON tbAluno.codAluno = tbMatricula.codAluno
INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
ORDER BY tbAluno.nomeAluno;


--Apresentar o nome dos cursos e os hor�rios em que eles s�o oferecidos:
SELECT nomeCurso, horarioTurma
FROM tbCurso
INNER JOIN tbTurma ON tbCurso.codCurso = tbTurma.codCurso;

--Apresentar a quantidade de alunos nascidos por estado
SELECT naturalidadeAluno, COUNT(*) as quantidadeAlunosNascidos
FROM tbAluno
GROUP BY naturalidadeAluno;

--Apresentar o nome dos alunos ao lado da data de matr�cula no formato dd/mm/aaaa:
SELECT nomeAluno, CONVERT(varchar(10), dataMatricula, 103) as dataMatriculaFormatada
FROM tbAluno
INNER JOIN tbMatricula ON tbAluno.codAluno = tbMatricula.codAluno;

--Apresentar os alunos cujo nome comece com A e que estejam matriculados no curso de ingl�s:
SELECT tbAluno.nomeAluno, tbCurso.nomeCurso
FROM tbAluno
INNER JOIN tbMatricula ON tbAluno.codAluno = tbMatricula.codAluno
INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
INNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCurso
WHERE tbAluno.nomeAluno LIKE 'A%' AND tbCurso.nomeCurso = 'Ingl�s';

--Apresentar a quantidade de matr�culas feitas no ano de 2016:
SELECT COUNT(*) as quantidadeMatriculas
FROM tbMatricula
WHERE YEAR(dataMatricula) = 2016;

