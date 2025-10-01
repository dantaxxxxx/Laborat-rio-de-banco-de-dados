# Projeto de Banco de Dados: Sistema de Encomendas

## 📜 Nosso Projeto

Olá! Este repositório foi criado para o nosso trabalho da disciplina de Laboratório de Banco de Dados (LBD).

O objetivo era criar um sistema simples doceria de loja física única. Para isso, primeiro modelamos as interações entre Clientes, Funcionários, Produtos e Encomendas usando os diagramas que estão no repositório. Depois, escrevemos todos os scripts SQL necessários para criar o banco de dados, inserir dados e fazer consultas.

## ✨ O que o script faz?

Nosso arquivo principal, o `schema_completo.sql`, já inclui tudo o que é preciso para rodar o projeto:

-   **Criação das Tabelas:** Monta toda a estrutura do zero, com as 4 tabelas (`CLIENTE`, `FUNCIONARIO`, `PRODUTO`, `ENCOMENDA`) e seus relacionamentos.
-   **População do Banco:** Insere vários dados de exemplo para que as tabelas não fiquem vazias e seja possível testar as consultas.
-   **Consultas de Exemplo:** Deixamos vários exemplos de `SELECT` para mostrar como extrair informações, como relatórios de vendas e compras por cliente.
-   **Atualizações de Exemplo:** Incluímos também alguns comandos `UPDATE` para mostrar como modificar os dados.

## 🛠️ Ferramentas que Usamos

-   **Linguagem:** SQL
-   **Banco de Dados:** MySQL

## 📂 Organização

Para facilitar a correção, colocamos todo o nosso código em um único arquivo:

-   `📄 schema_completo.sql`: Dentro dele, o código está dividido em seções para cada etapa (criação, inserção, consultas e atualizações).

## 🚀 Como Executar o Projeto

Para testar nosso banco de dados na sua máquina, é só seguir estes passos:

1.  **O que precisa ter:**
    -   Um servidor MySQL ou MariaDB instalado (pode ser via XAMPP, Docker, etc.).
    -   Um programa para gerenciar o banco, como MySQL Workbench ou DBeaver.

2.  **Crie o banco de dados:**
    Primeiro, rode este comando para criar o database:
    ```sql
    CREATE DATABASE sistema_encomendas CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
    ```

3.  **Selecione o banco de dados:**
    ```sql
    USE sistema_encomendas;
    ```

4.  **Execute nosso script:**
    -   **Jeito fácil:** Abra o arquivo `schema_completo.sql`, copie todo o conteúdo, cole no seu programa de banco de dados e mande executar.
    -   **Pelo terminal:** Se preferir, salve o arquivo no seu PC e rode o comando abaixo (lembre de trocar `seu_usuario`):
        ```bash
        mysql -u seu_usuario -p sistema_encomendas < schema_completo.sql
        ```
    E pronto! O banco de dados estará criado e com todos os dados de exemplo.

## 📊 Diagramas do Modelo

Abaixo estão os diagramas que usamos como base para criar o banco de dados.

**Diagrama Conceitual**
_![Diagrama Conceitual](Diagrama%201.jpg)_

**Diagrama Físico**
_![Diagrama Físico](Diagrama%202.jpg)_


## 👨‍💻 Membros do Grupo

-   Rodrigo Castro
-   Luis Gustavo Elias
-   Marcos Miguel
-   Lucas Patrick
-   Lucca Seib
