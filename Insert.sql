USE bdLojaRoupas

SET IDENTITY_INSERT tbVendedor ON

INSERT INTO tbVendedor( codVendedor,nomeVendedor)
VALUES('1','João Santana')
	,('2','Raquel Torres')
	,('3','Rodrigo Garcia')
	,('4','Rafael Moura')

SET IDENTITY_INSERT tbVendedor OFF

SET IDENTITY_INSERT tbFabricante ON

INSERT INTO tbFabricante( codFabricante,nomeFabricante)
VALUES('1','Malwee')
	,('2','Marisol')
	,('3','Cia de Malha')

SET IDENTITY_INSERT tbFabricante OFF

SET IDENTITY_INSERT tbCliente ON

INSERT INTO tbCliente( codCliente,nomeCliente, idadeCliente)
VALUES('1','Johnny Silver','19')
	,('2','Joseph Silva','25')
	,('3','Jolyne Jhonson','18')
	,('4','Lisa Joestar','55')
	,('5','Suzi Quik','35')

SET IDENTITY_INSERT tbCliente OFF


SET IDENTITY_INSERT tbVenda ON

INSERT INTO tbVenda( codVenda,dataVenda, totalVendas, codCliente, codVendedor)
VALUES('1','2022-05-10 00:00:00','139.99','1','2')
	,('2','2022-05-05 00:00:00','130.99','2','1')
	,('3','2022-04-25 00:00:00','200.10','3','2')
	,('4','2022-04-15 00:00:00','89.99','4','1')
	,('5','2022-02-20 00:00:00','99.99','5','2')

SET IDENTITY_INSERT tbVenda OFF

SET IDENTITY_INSERT tbProduto ON

INSERT INTO tbProduto( codProduto,nomeProduto,precoProduto,dataEntradaProduto,idFuncionario,codFabricante)
VALUES('1','Camiseta Preta','20.39','2022-02-21 00:00:00','1','1')
	,('2','Moleton Cinza','75.49','2022-03-15 00:00:00','2','1')
	,('3','Calça Feminina','80.39','2022-04-21 00:00:00','1','1')
	,('4','Camiseta Slim','95.49','2022-05-10 00:00:00','2','2')
	,('5','Vestido Hype','105.99','2022-05-10 00:00:00','1','2')
	,('6','Jaqueta WRM','100.99','2022-04-15 00:00:00','2','2')
	,('7','Pijama Inverno','39.49','2022-04-20 00:00:00','1','3')
	,('8','Roupão Fleece','125.49','2022-04-20 00:00:00','2','3')
	,('9','Macacão Pijama','109.99','2022-04-20 00:00:00','1','3')

SET IDENTITY_INSERT tbProduto OFF

SET IDENTITY_INSERT tbItensVenda ON

INSERT INTO tbItensVenda( codItensVenda,quantidadeItens,subTotalItens,codVenda,codProduto)
VALUES('1','2','205','1','9')
	,('2','2','100','2','7')
	,('3','2','99','3','5')
	,('4','2','149','4','3')
	,('5','2','80','5','1')

SET IDENTITY_INSERT tbItensVenda OFF

