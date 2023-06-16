CREATE DATABASE bdLojaRoupas

--DROP DATABASE bdLojaRoupas

USE bdLojaRoupas

CREATE TABLE tbVendedor (
	codVendedor INT PRIMARY KEY IDENTITY(1,1)
	, nomeVendedor VARCHAR(40)
)
CREATE TABLE tbCliente (
	codCliente INT PRIMARY KEY IDENTITY(1,1)
	, nomeCliente VARCHAR(40)
	, idadeCliente SMALLINT
)
CREATE TABLE tbFabricante (
	codFabricante INT PRIMARY KEY IDENTITY(1,1)
	, nomeFabricante VARCHAR(40)
)
CREATE TABLE tbVenda (
	codVenda INT PRIMARY KEY IDENTITY(1,1)
	, dataVenda VARCHAR(30)
	, totalVendas MONEY
	, codCliente INT FOREIGN KEY REFERENCES tbCliente (codCliente)
	, codVendedor INT FOREIGN KEY REFERENCES tbVendedor (codVendedor)
)
CREATE TABLE tbProduto(
	codProduto INT PRIMARY KEY IDENTITY(1,1)
	,nomeProduto VARCHAR(40)
	,precoProduto MONEY
	,dataEntradaProduto VARCHAR(30)
	,idFuncionario SMALLINT
	,codFabricante INT FOREIGN KEY REFERENCES tbFabricante (codFabricante)
)
CREATE TABLE tbItensVenda (
	codItensVenda INT PRIMARY KEY IDENTITY(1,1)
	, quantidadeItens SMALLINT
	, subTotalItens SMALLINT
	, codVenda INT FOREIGN KEY REFERENCES tbVenda (codVenda)
	, codProduto INT FOREIGN KEY REFERENCES tbProduto (codProduto)
)
