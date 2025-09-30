# Projeto de Banco de Dados: Sistema de Encomendas

## 📜 Descrição

Este repositório contém os scripts SQL para a criação e população de um banco de dados relacional para um sistema simplificado de gerenciamento de encomendas para o trabalho de LBD. O projeto foi desenvolvido com base em diagramas de entidade-relacionamento (DER) e físico, modelando as interações entre Clientes, Funcionários, Produtos e as Encomendas realizadas.

O objetivo é demonstrar a implementação de um schema de banco de dados, incluindo a definição de tabelas, chaves primárias, chaves estrangeiras, e a manipulação de dados com exemplos práticos.

## ✨ Funcionalidades

-   **Schema de Banco de Dados:** Estrutura completa com 4 tabelas (`CLIENTE`, `FUNCIONARIO`, `PRODUTO`, `ENCOMENDA`) e seus respectivos relacionamentos.
-   **Scripts de População:** Dados de exemplo para todas as tabelas, permitindo a execução de consultas realistas.
-   **Exemplos de Consultas (`SELECT`):** Scripts para extrair informações úteis, como relatórios de encomendas, vendas por funcionário e total de compras por cliente.
-   **Exemplos de Atualização (`UPDATE`):** Scripts que demonstram como modificar registros existentes no banco de dados.

## 🛠️ Tecnologias Utilizadas

-   **Linguagem:** SQL (Structured Query Language)
-   **SGBD (Dialeto):** MySQL

## 📂 Estrutura do Repositório

O repositório contém um único arquivo principal:

-   `📄 schema_completo.sql`: Este arquivo autocontido inclui:
    1.  **DDL (Data Definition Language):** Comandos `CREATE TABLE` para gerar toda a estrutura.
    2.  **DML (Data Manipulation Language):** Comandos `INSERT INTO` para popular o banco.
    3.  **DQL (Data Query Language):** Exemplos de `SELECT` com diferentes níveis de complexidade.
    4.  **DML (Data Manipulation Language):** Exemplos de `UPDATE` para modificar os dados.

## 🚀 Como Utilizar

Para recriar e utilizar este banco de dados em seu ambiente local, siga os passos abaixo:

1.  **Pré-requisitos:**
    -   Ter um servidor de banco de dados MySQL (ou compatível, como MariaDB) instalado. Você pode usar ferramentas como XAMPP, WAMP, Docker, ou uma instalação nativa.
    -   Ter um cliente de banco de dados, como MySQL Workbench, DBeaver, ou acesso à linha de comando (CLI).

2.  **Crie um Banco de Dados:**
    Execute o seguinte comando no seu cliente de banco de dados:
    ```sql
    CREATE DATABASE sistema_encomendas CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
    ```

3.  **Selecione o Banco de Dados:**
    ```sql
    USE sistema_encomendas;
    ```

4.  **Execute o Script:**
    -   **Opção A (Cliente Gráfico):** Copie todo o conteúdo do arquivo `schema_completo.sql` e cole na janela de consulta do seu cliente (MySQL Workbench, DBeaver, etc.). Em seguida, execute o script.
    -   **Opção B (Linha de Comando):** Salve o arquivo `schema_completo.sql` em seu computador e execute o seguinte comando no seu terminal, substituindo `seu_usuario` pelo seu usuário do MySQL:
        ```bash
        mysql -u seu_usuario -p sistema_encomendas < schema_completo.sql
        ```

## 📊 Diagramas do Modelo

**Diagrama Conceitual**
_![Diagrama Conceitual](3273f9de-6cb3-477d-923e-ea3e06636d2b.jpg)_

**Diagrama Físico**
_![Diagrama Físico](1ed12315-7342-48c7-afc5-76a99a77bd51.jpg)_


## 👨‍💻 Autor

Este projeto foi implementado por **[Rodrigo Castro, Luis Gustavo Elias, Marcos Miguel, Lucas Patrick e Lucca Seib]**.
