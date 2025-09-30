-- =====================================================================
-- Script SQL Completo - Sistema de Encomendas
-- Autores:Rodrigp Castro e Grupo  
-- Data de Criação: 29 de Setembro de 2025
-- Dialeto: MySQL
-- =====================================================================

-- =====================================================================
-- SEÇÃO 1: CRIAÇÃO DAS TABELAS (DDL - Data Definition Language)
-- Criação da estrutura do banco de dados conforme o diagrama físico.
-- =====================================================================

-- Tabela: CLIENTE
-- Armazena os dados dos clientes.
CREATE TABLE CLIENTE (
    ID_Cliente INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CPF VARCHAR(14) UNIQUE NOT NULL,
    Nome VARCHAR(150) NOT NULL,
    `E-mail` VARCHAR(100) UNIQUE NOT NULL,
    Telefone VARCHAR(15),
    Endereco VARCHAR(255) NOT NULL
);

-- Tabela: FUNCIONARIO
-- Armazena os dados dos funcionários.
CREATE TABLE FUNCIONARIO (
    ID_Funcionario INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(150) NOT NULL,
    Cargo VARCHAR(50) NOT NULL,
    `E-mail` VARCHAR(100) UNIQUE NOT NULL
);

-- Tabela: PRODUTO
-- Armazena os dados dos produtos.
CREATE TABLE PRODUTO (
    ID_Produto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Nome_Produto VARCHAR(100) UNIQUE NOT NULL,
    Preco_Venda DECIMAL(10, 2) NOT NULL
);

-- Tabela: ENCOMENDA
-- Tabela central que relaciona clientes, funcionários e produtos em uma encomenda.
CREATE TABLE ENCOMENDA (
    ID_Encomenda INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Data_Pedido DATE NOT NULL,
    Data_Entrega_Prevista DATE,
    Status_Encomenda VARCHAR(30) NOT NULL DEFAULT 'Pendente',
    Valor_Total DECIMAL(10, 2) NOT NULL,
    id_cliente INT UNSIGNED,
    id_funcionario INT UNSIGNED,
    id_produto INT UNSIGNED,

    -- Definição das chaves estrangeiras (Foreign Keys)
    CONSTRAINT fk_encomenda_cliente FOREIGN KEY (id_cliente) REFERENCES CLIENTE(ID_Cliente),
    CONSTRAINT fk_encomenda_funcionario FOREIGN KEY (id_funcionario) REFERENCES FUNCIONARIO(ID_Funcionario),
    CONSTRAINT fk_encomenda_produto FOREIGN KEY (id_produto) REFERENCES PRODUTO(ID_Produto)
);


-- =====================================================================
-- SEÇÃO 2: INSERÇÃO DE DADOS (DML - Data Manipulation Language)
-- População das tabelas com dados de exemplo para testes e consultas.
-- =====================================================================

-- Inserindo dados na tabela CLIENTE
INSERT INTO CLIENTE (CPF, Nome, `E-mail`, Telefone, Endereco) VALUES
('111.222.333-44', 'Ana Beatriz Costa', 'ana.costa@email.com', '(11) 98765-4321', 'Rua das Flores, 123, São Paulo - SP'),
('555.666.777-88', 'Ricardo Almeida', 'ricardo.a@email.com', '(21) 91234-5678', 'Avenida Central, 456, Rio de Janeiro - RJ'),
('999.888.777-66', 'Carla Mendes', 'carla.mendes@email.com', '(31) 95555-4444', 'Praça da Liberdade, 789, Belo Horizonte - MG');

-- Inserindo dados na tabela FUNCIONARIO
INSERT INTO FUNCIONARIO (Nome, Cargo, `E-mail`) VALUES
('João Silva', 'Vendedor', 'joao.silva@empresa.com'),
('Mariana Oliveira', 'Gerente de Vendas', 'mariana.o@empresa.com');

-- Inserindo dados na tabela PRODUTO
INSERT INTO PRODUTO (Nome_Produto, Preco_Venda) VALUES
('Teclado Mecânico RGB', 350.00),
('Mouse Gamer Sem Fio', 180.50),
('Monitor Ultrawide 29"', 1250.00),
('Headset Gamer 7.1', 280.75);

-- Inserindo dados na tabela ENCOMENDA
-- Note que o Valor_Total corresponde ao Preco_Venda do produto, conforme o modelo.
INSERT INTO ENCOMENDA (Data_Pedido, Data_Entrega_Prevista, Status_Encomenda, Valor_Total, id_cliente, id_funcionario, id_produto) VALUES
-- Ana (ID 1) comprou um Teclado (ID 1) com o vendedor João (ID 1)
('2025-09-20', '2025-09-30', 'Enviado', 350.00, 1, 1, 1),
-- Ricardo (ID 2) comprou um Monitor (ID 3) com o vendedor João (ID 1)
('2025-09-22', '2025-10-02', 'Em Processamento', 1250.00, 2, 1, 3),
-- Carla (ID 3) comprou um Mouse (ID 2) com a gerente Mariana (ID 2)
('2025-09-25', '2025-10-05', 'Pendente', 180.50, 3, 2, 2),
-- Ana (ID 1) fez uma segunda compra, um Headset (ID 4), com a gerente Mariana (ID 2)
('2025-09-28', '2025-10-08', 'Pendente', 280.75, 1, 2, 4);


-- =====================================================================
-- SEÇÃO 3: SCRIPTS DE CONSULTA (SELECT)
-- Exemplos de consultas para extrair informações do banco de dados.
-- =====================================================================

-- Consulta 1: Listar todos os produtos e seus preços
SELECT Nome_Produto, Preco_Venda FROM PRODUTO ORDER BY Preco_Venda DESC;

-- Consulta 2: Encontrar todas as encomendas com status 'Pendente'
SELECT * FROM ENCOMENDA WHERE Status_Encomenda = 'Pendente';

-- Consulta 3: Consulta complexa (JOIN) para exibir um relatório de encomendas
-- Mostra o nome do cliente, do funcionário e do produto para cada encomenda.
SELECT
    E.ID_Encomenda,
    E.Data_Pedido,
    C.Nome AS Nome_Cliente,
    F.Nome AS Nome_Funcionario,
    P.Nome_Produto,
    E.Valor_Total,
    E.Status_Encomenda
FROM
    ENCOMENDA AS E
JOIN
    CLIENTE AS C ON E.id_cliente = C.ID_Cliente
JOIN
    FUNCIONARIO AS F ON E.id_funcionario = F.ID_Funcionario
JOIN
    PRODUTO AS P ON E.id_produto = P.ID_Produto
ORDER BY
    E.Data_Pedido;

-- Consulta 4: Consulta com agregação (COUNT e GROUP BY)
-- Contar quantas encomendas cada cliente já fez.
SELECT
    C.Nome,
    COUNT(E.ID_Encomenda) AS Total_de_Encomendas
FROM
    CLIENTE AS C
LEFT JOIN
    ENCOMENDA AS E ON C.ID_Cliente = E.id_cliente
GROUP BY
    C.ID_Cliente, C.Nome
ORDER BY
    Total_de_Encomendas DESC;

-- Consulta 5: Consulta com agregação (SUM e GROUP BY)
-- Calcular o valor total vendido por cada funcionário.
SELECT
    F.Nome,
    F.Cargo,
    SUM(E.Valor_Total) AS Total_Vendido
FROM
    FUNCIONARIO AS F
JOIN
    ENCOMENDA AS E ON F.ID_Funcionario = E.id_funcionario
GROUP BY
    F.ID_Funcionario, F.Nome, F.Cargo
ORDER BY
    Total_Vendido DESC;


-- =====================================================================
-- SEÇÃO 4: SCRIPTS DE ATUALIZAÇÃO (UPDATE)
-- Exemplos de como modificar dados existentes nas tabelas.
-- =====================================================================

-- Update 1: Atualizar o status de uma encomenda para 'Entregue'
-- Supondo que a encomenda 1 foi entregue com sucesso.
UPDATE ENCOMENDA
SET Status_Encomenda = 'Entregue'
WHERE ID_Encomenda = 1;

-- Verificando a alteração
SELECT * FROM ENCOMENDA WHERE ID_Encomenda = 1;

-- Update 2: Aplicar um aumento de 10% no preço de todos os produtos da categoria 'Gamer'
-- (Neste caso, aplicaremos a produtos que contenham 'Gamer' no nome)
UPDATE PRODUTO
SET Preco_Venda = Preco_Venda * 1.10
WHERE Nome_Produto LIKE '%Gamer%';

-- Verificando a alteração nos preços
SELECT Nome_Produto, Preco_Venda FROM PRODUTO WHERE Nome_Produto LIKE '%Gamer%';
