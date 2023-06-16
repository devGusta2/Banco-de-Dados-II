USE bdLojaRoupas

--Crie uma View da tabela Vendedor e apresente somente O nome do Vendedor.

CREATE VIEW vwNomeVendedor AS
SELECT nomeVendedor
FROM tbVendedor;

SELECT * FROM vwNomeVendedor

--Crie uma view que apresente o nome do Cliente sua idade e seu ID. 

CREATE VIEW vwDadosCliente AS
SELECT nomeCliente, idadeCliente, codCliente
FROM tbCliente;

SELECT * FROM vwDadosCliente

--Crie uma view que apresente o nome do produto ao lado do seu fabricante.

CREATE VIEW vwProdutoFabricante AS
SELECT p.nomeProduto, f.nomeFabricante
FROM tbProduto p
INNER JOIN tbFabricante f ON p.codFabricante = f.codFabricante;

SELECT * FROM vwProdutoFabricante

--Elabore uma view que exiba: nome do produto, preço do produto e data de entrada do produto(entrada no estoque da loja).

CREATE VIEW vwDetalhesProduto AS
SELECT nomeProduto, precoProduto, dataEntradaProduto
FROM tbProduto;

SELECT * FROM vwDetalhesProduto

--Elabore uma view que exiba a id do cliente, nome do cliente, data da Venda, total da venda.

CREATE VIEW vwDetalhesVenda AS
SELECT v.codCliente, c.nomeCliente, v.dataVenda, v.totalVendas
FROM tbVenda v
INNER JOIN tbCliente c ON v.codCliente = c.codCliente;

SELECT * FROM vwDetalhesVenda

--Crie uma View que possa apresentar o Id de uma Venda, total da venda e o nome do vendedor.

CREATE VIEW vwDetalhesVendaVendedor AS
SELECT v.codVenda, v.totalVendas, vd.nomeVendedor
FROM tbVenda v
INNER JOIN tbVendedor vd ON v.codVendedor = vd.codVendedor;

SELECT * FROM vwDetalhesVendaVendedor

