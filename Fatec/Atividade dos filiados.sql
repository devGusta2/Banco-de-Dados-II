CREATE DATABASE bdPartidoPTC

USE bdPartidoPTC

SELECT * FROM filiadosPTC


--ex01
SELECT nomeFiliado as "Nomes que possuem antonio" from filiadosPTC
where nomeFiliado like 'antonio%' 

--ex02
SELECT nomeFiliado as "Nomes que possuem como sobrenome sebastião" from filiadosPTC
where nomeFiliado like '%sebastiao' 

--ex03
SELECT nomeFiliado as "Nomes que possuem 'os' no começo" from filiadosPTC
where nomeFiliado like 'os%' 

--ex04
SELECT nomeFiliado AS "Nomes das pessoas que moram em São Felix" FROM filiadosPTC
WHERE nomeMunicipio like '%lix'

--ex05
SELECT nomeFiliado AS "Nomes das pessoas que moram em Inhambupe" FROM filiadosPTC
WHERE nomeMunicipio like '%Inhambupe%'

--ex06
SELECT nomeMunicipio AS "Municipios que começam com o nome SANTA" FROM filiadosPTC
WHERE nomeMunicipio LIKE 'SANTA%'

--ex07
SELECT nomeMunicipio AS "Municipios que começam com o nome 'e'" FROM filiadosPTC
WHERE nomeMunicipio LIKE 'e%'

--ex08
SELECT nomeMunicipio AS "Municipios que contem cruz" FROM filiadosPTC
WHERE nomeMunicipio LIKE '%cruz%'

--ex9
SELECT nomeMunicipio AS "Municipios que contem 'de'" FROM filiadosPTC
WHERE nomeMunicipio LIKE '%de%'

--ex10
SELECT nomeFiliado "Nomes", dataFiliacao AS "Todos os cadastrados de 01/01/1990 e 01/01/2000" FROM filiadosPTC
WHERE dataFiliacao BETWEEN '01/01/1990' AND '01/01/2000'

--ex11
SELECT nomeFiliado "Nomes", dataFiliacao AS "Todos os cadastrados de 02/01/2010 e 01/03/2010" FROM filiadosPTC
WHERE dataFiliacao BETWEEN '02/01/2010' AND '01/03/2010'

--ex12
SELECT nomeFiliado, nomePartido from filiadosPTC
WHERE dataFiliacao between '01/07/2007' and '31/12/2007' 

--ex13
SELECT nomeFiliado, situacaoRegistro from filiadosPTC
WHERE situacaoRegistro = 'REGULAR'

--ex14
SELECT nomeFiliado, zonaEleitoral from filiadosPTC
WHERE zonaEleitoral = 203

--ex15
SELECT nomeFiliado, zonaEleitoral from filiadosPTC
WHERE zonaEleitoral = 180

--ex16
SELECT nomeFiliado, zonaEleitoral from filiadosPTC
WHERE zonaEleitoral = 199

--17 não vai

--ex18
SELECT min (zonaEleitoral) from filiadosPTC

--ex19
UPDATE filiadosPTC
SET siglaPartido='PT' 
WHERE codigoMunicipio = 36471;
SELECT siglaPartido,codigoMunicipio FROM filiadosPTC
WHERE codigoMunicipio = 36471

--ex20
UPDATE filiadosPTC
SET siglaPartido='PMDB'
WHERE codigoMunicipio = 38490;
SELECT siglaPartido, codigoMunicipio from filiadosPTC
WHERE codigoMunicipio = 38490

--ex21
UPDATE filiadosPTC
SET siglaPartido = 'PC'
WHERE nomeMunicipio LIKE 'SANTAN%' AND nomeMunicipio LIKE'%POLIS'
SELECT nomeMunicipio from filiadosPTC
WHERE nomeMunicipio LIKE 'SANTAN%' AND nomeMunicipio LIKE'%POLIS'


--ex22
UPDATE FiliadosPTC
SET siglaPartido = 'PV', nomePartido = 'Partido Verde dos Filiados'
WHERE nomeMunicipio = 's%' and nomeMunicipio  like '%lix'
--o felix noa vai

--23
UPDATE FiliadosPTC
SET siglaPartido = 'PSDB', nomePartido = ' Partido da Social Democracia Brasileira'
WHERE nomeMunicipio = 'ENCRUZILHADA'

--24
UPDATE FiliadosPTC
SET nomeFiliado = 'JORGE LUIS MAGALHÃES DOS SANTOS'
WHERE nomeFiliado = 'JORGE LUIS FERREIRA DOS SANTOS'


--25
UPDATE FiliadosPTC
SET nomeFiliado = 'RENATA XAVIER RODRIGUES'
WHERE nomeFiliado = 'BENTA XAVIER RODRIGUES'

--26
UPDATE FiliadosPTC
SET nomeFiliado = 'NOEL LEITE DA SILVA'
WHERE nomeFiliado = 'NOE LEITE DA SILVA'

--27
UPDATE FiliadosPTC
SET situacaoRegistro = 'REGULAR'
WHERE nomeFiliado = 'JOSIENE ANDRADE DE SOUZA'

--28
UPDATE FiliadosPTC
SET situacaoRegistro = 'REGULAR'
WHERE nomeFiliado = 'ELIEL ALMEIDA SILVA'

--29
UPDATE FiliadosPTC
SET situacaoRegistro = 'DESFILIADO'
WHERE nomeFiliado = 'ALINE DE SOUZA'

--30
ALTER TABLE FiliadosPTC
ADD Sexo CHAR(1);


	

