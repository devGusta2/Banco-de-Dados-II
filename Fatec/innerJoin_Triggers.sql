-- CREATE DATABASE bdVendas
-- USE bdVendas 

CREATE TABLE produto(
	idProduto INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR (30) NOT NULL,
	valor_unitario DECIMAL(10,2),
	dt_validade DATE NOT NULL,
	estoque INT NOT NULL DEFAULT 0,
	PRIMARY KEY (idProduto)
);

CREATE TABLE Venda(
	idVenda INT NOT NULL AUTO_INCREMENT,
	data_venda DATE NOT NULL,
	valor_total DECIMAL (10,2) NOT NULL,
	caixa_registrador INT NOT NULL,
	PRIMARY KEY(idVenda)
);

CREATE TABLE itensVendidos(
	id_itemVendido  INT NOT NULL AUTO_INCREMENT,
	idVenda INT NOT NULL,
	idProduto INT NOT NULL,
	quantidade INT NOT NULL,
	valor_unitario DECIMAL(10,2) NOT NULL,
	PRIMARY KEY (id_itemVendido),
	CONSTRAINT fk_produto FOREIGN KEY(idProduto) REFERENCES produto(idProduto) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_venda FOREIGN KEY(idVenda) REFERENCES venda (idVenda) ON DELETE CASCADE ON UPDATE CASCADE
);



INSERT INTO produto (nome, valor_unitario, dt_validade, estoque)
VALUES 
    ('Camiseta Estilo', 25.99, '2025-12-31', 150),
    ('Tênis Esportivo', 120.00, '2026-06-30', 200),
    ('Bolsa de Couro', 85.50, '2024-11-30', 80),
    ('Fones de Ouvido Bluetooth', 150.00, '2027-05-15', 50),
    ('Cadeira de Escritório', 350.00, '2026-08-20', 30),
    ('Smartwatch Fitness', 220.00, '2024-11-25', 120),
    ('Câmera Fotográfica Digital', 600.00, '2025-03-10', 45),
    ('Cafeteira Elétrica', 199.90, '2027-01-01', 60),
    ('Laptop Gamer', 4500.00, '2026-10-05', 10),
    ('Relógio de Pulso Masculino', 299.99, '2024-12-31', 200);


INSERT INTO Venda (data_venda, valor_total, caixa_registrador)
VALUES 
    ('2024-11-14', 1200.00, 1),
    ('2024-11-15', 950.00, 2),
    ('2024-11-16', 2200.00, 1),
    ('2024-11-17', 530.00, 3),
    ('2024-11-18', 400.00, 2);
    
    
-- Inserindo itens vendidos para a venda com idVenda = 1
INSERT INTO itensVendidos (idVenda, idProduto, quantidade, valor_unitario)
VALUES 
    (1, 1, 2, 25.99),   -- Camiseta Estilo
    (1, 3, 1, 85.50),   -- Bolsa de Couro
    (1, 6, 3, 220.00);  -- Smartwatch Fitness

-- Inserindo itens vendidos para a venda com idVenda = 2
INSERT INTO itensVendidos (idVenda, idProduto, quantidade, valor_unitario)
VALUES 
    (2, 4, 1, 150.00),   -- Fones de Ouvido Bluetooth
    (2, 8, 1, 199.90),   -- Cafeteira Elétrica
    (2, 10, 2, 299.99);  -- Relógio de Pulso Masculino

-- Inserindo itens vendidos para a venda com idVenda = 3
INSERT INTO itensVendidos (idVenda, idProduto, quantidade, valor_unitario)
VALUES 
    (3, 2, 2, 120.00),   -- Tênis Esportivo
    (3, 5, 1, 350.00),   -- Cadeira de Escritório
    (3, 7, 1, 600.00);   -- Câmera Fotográfica Digital

-- Inserindo itens vendidos para a venda com idVenda = 4
INSERT INTO itensVendidos (idVenda, idProduto, quantidade, valor_unitario)
VALUES 
    (4, 1, 3, 25.99),   -- Camiseta Estilo
    (4, 9, 1, 4500.00); -- Laptop Gamer

-- Inserindo itens vendidos para a venda com idVenda = 5
INSERT INTO itensVendidos (idVenda, idProduto, quantidade, valor_unitario)
VALUES 
    (5, 6, 2, 220.00),   -- Smartwatch Fitness
    (5, 10, 1, 299.99);  -- Relógio de Pulso Masculino
    
    
    
    
    
/* DELIMITER $$

CREATE TRIGGER trgInserirItens
AFTER INSERT ON itensVendidos
FOR EACH ROW
BEGIN
    -- Atualiza o estoque do produto após a venda
    UPDATE produto 
    SET estoque = estoque - NEW.quantidade 
    WHERE idProduto = NEW.idProduto;

    -- Atualiza o valor total da venda após a venda do item
    UPDATE venda 
    SET valor_total = valor_total - NEW.quantidade * NEW.valor_unitario
    WHERE idVenda = NEW.idVenda;
END $$
*/




/* SELECT
	itensVendidos.*,
	venda.*,
	produto.*
	FROM 
	itensVendidos
	INNER JOIN venda ON itensVendidos.idVenda = venda.idVenda
	INNER JOIN produto ON itensVendidos.idProduto = produto.idProduto
	ORDER BY 
	venda.data_venda; */
		
/* SELECT produto.nome, venda.data_venda, itensVendidos.quantidade
FROM itensVendidos
INNER JOIN produto ON itensVendidos.idProduto = produto.idProduto
INNER JOIN venda ON itensVendidos.idVenda = venda.idVenda */






SELECT produto.nome, venda.valor_total, itensVendidos.quantidade
	FROM itensVendidos
	INNER JOIN produto ON itensVendidos.idProduto = produto.idProduto
	INNER JOIN venda ON itensVendidos.idVenda = venda.idVenda 
	ORDER BY venda.data_venda
	
