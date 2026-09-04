-- 1. Criação do Banco de Dados
CREATE DATABASE IF NOT EXISTS tech_store;
USE tech_store;

-- 2. Limpeza de tabelas pré-existentes
DROP TABLE IF EXISTS itens_venda;
DROP TABLE IF EXISTS vendas;
DROP TABLE IF EXISTS produtos;
DROP TABLE IF EXISTS categorias;
DROP TABLE IF EXISTS clientes;

-- 3. Criação das Tabelas
CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    categoria_id INT,
    preco_custo DECIMAL(10,2) NOT NULL,
    preco_venda DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    estado CHAR(2) NOT NULL,
    data_cadastro DATE NOT NULL
);

CREATE TABLE vendas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    data_venda DATE NOT NULL,
    canal_venda VARCHAR(30) NOT NULL, -- 'E-commerce', 'Loja Física', 'Marketplace'
    status_entrega VARCHAR(30) NOT NULL, -- 'Entregue', 'Pendente', 'Cancelado'
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE itens_venda (
    id INT AUTO_INCREMENT PRIMARY KEY,
    venda_id INT,
    produto_id INT,
    quantidade INT NOT NULL,
    desconto DECIMAL(5,2) DEFAULT 0.00,
    FOREIGN KEY (venda_id) REFERENCES vendas(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

-- =========================================================
-- INSERÇÃO DOS DADOS (INPUTS)
-- =========================================================

-- Categorias
INSERT INTO categorias (id, nome) VALUES
(1, 'Smartphones'),
(2, 'Notebooks'),
(3, 'Periféricos'),
(4, 'Monitores'),
(5, 'Áudio');

-- Produtos
INSERT INTO produtos (id, nome, categoria_id, preco_custo, preco_venda) VALUES
(1, 'Smartphone Galaxy S23 256GB', 1, 2800.00, 4200.00),
(2, 'iPhone 14 128GB', 1, 3900.00, 5100.00),
(3, 'Notebook Dell Inspiron i15', 2, 2200.00, 3100.00),
(4, 'MacBook Air M2', 2, 6100.00, 8200.00),
(5, 'Mouse Sem Fio Logitech MX Master 3S', 3, 350.00, 580.00),
(6, 'Teclado Mecânico Redragon Kumara', 3, 140.00, 230.00),
(7, 'Monitor Gamer LG 27 UltraGear', 4, 900.00, 1450.00),
(8, 'Monitor Dell 24 IPS P2422H', 4, 750.00, 1100.00),
(9, 'Headset Gamer HyperX Cloud II', 5, 320.00, 520.00),
(10, 'Fone Bluetooth JBL Tune 510BT', 5, 120.00, 210.00);

-- Clientes
INSERT INTO clientes (id, nome, cidade, estado, data_cadastro) VALUES
(1, 'Lucas Oliveira', 'São Paulo', 'SP', '2025-01-10'),
(2, 'Mariana Costa', 'Santo André', 'SP', '2025-01-15'),
(3, 'Carlos Eduardo', 'Rio de Janeiro', 'RJ', '2025-02-01'),
(4, 'Fernanda Lima', 'Belo Horizonte', 'MG', '2025-02-12'),
(5, 'Roberto Souza', 'Mauá', 'SP', '2025-03-05'),
(6, 'Beatriz Rocha', 'Curitiba', 'PR', '2025-03-20'),
(7, 'Gabriel Alves', 'São Caetano do Sul', 'SP', '2025-04-02'),
(8, 'Juliana Mendes', 'Campinas', 'SP', '2025-04-18'),
(9, 'Thiago Martins', 'Niterói', 'RJ', '2025-05-11'),
(10, 'Amanda Ferreira', 'Porto Alegre', 'RS', '2025-05-25');

-- Vendas
INSERT INTO vendas (id, cliente_id, data_venda, canal_venda, status_entrega) VALUES
(101, 1, '2026-01-05', 'E-commerce', 'Entregue'),
(102, 2, '2026-01-12', 'Loja Física', 'Entregue'),
(103, 3, '2026-01-18', 'Marketplace', 'Entregue'),
(104, 4, '2026-01-25', 'E-commerce', 'Cancelado'),
(105, 5, '2026-02-02', 'Loja Física', 'Entregue'),
(106, 6, '2026-02-10', 'E-commerce', 'Entregue'),
(107, 7, '2026-02-14', 'Marketplace', 'Pendente'),
(108, 8, '2026-02-22', 'E-commerce', 'Entregue'),
(109, 1, '2026-03-01', 'Loja Física', 'Entregue'),
(110, 9, '2026-03-08', 'E-commerce', 'Entregue'),
(111, 10, '2026-03-15', 'Marketplace', 'Pendente'),
(112, 3, '2026-03-22', 'E-commerce', 'Entregue'),
(113, 5, '2026-04-03', 'Loja Física', 'Entregue'),
(114, 2, '2026-04-10', 'E-commerce', 'Entregue'),
(115, 4, '2026-04-18', 'E-commerce', 'Pendente');

-- Itens da Venda
INSERT INTO itens_venda (venda_id, produto_id, quantidade, desconto) VALUES
-- Venda 101
(101, 1, 1, 100.00),
(101, 5, 1, 0.00),
-- Venda 102
(102, 3, 1, 50.00),
-- Venda 103
(103, 7, 2, 100.00),
-- Venda 104 (Cancelada)
(104, 2, 1, 0.00),
-- Venda 105
(105, 6, 2, 20.00),
(105, 8, 1, 0.00),
-- Venda 106
(106, 4, 1, 200.00),
-- Venda 107
(107, 9, 1, 0.00),
-- Venda 108
(108, 10, 3, 30.00),
-- Venda 109
(109, 5, 1, 0.00),
(109, 6, 1, 10.00),
-- Venda 110
(110, 1, 1, 0.00),
-- Venda 111
(111, 3, 1, 100.00),
-- Venda 112
(112, 7, 1, 50.00),
(112, 9, 1, 0.00),
-- Venda 113
(113, 8, 2, 100.00),
-- Venda 114
(114, 2, 1, 150.00),
-- Venda 115
(115, 5, 2, 0.00);

 



CREATE VIEW vm_dim_produtos AS
SELECT produtos.id AS produto_id, produtos.nome, produtos.preco_custo, produtos.preco_venda,
categorias.nome as categorias_nome, (produtos.preco_venda-produtos.preco_custo) AS margem_bruta
FROM produtos INNER JOIN categorias
ON categorias.id = produtos.categoria_id;



CREATE VIEW vw_dim_clientes AS 
SELECT clientes.id AS cliente_id, clientes.nome, clientes.cidade, clientes.estado, clientes.data_cadastro
FROM clientes;




CREATE VIEW vw_fato_vendas AS
SELECT itens_venda.id AS itens_id, itens_venda.venda_id,itens_venda.produto_id,itens_venda.quantidade,itens_venda.desconto,
vendas.cliente_id, vendas.data_venda, vendas.canal_venda,vendas.status_entrega, (itens_venda.quantidade*produtos.preco_venda-(itens_venda.desconto)) AS faturamento
FROM itens_venda INNER JOIN vendas
ON vendas.id = itens_venda.venda_id
INNER JOIN produtos
ON produtos.id = itens_venda.produto_id;


