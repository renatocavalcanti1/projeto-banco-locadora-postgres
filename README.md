# Projeto de Banco de Dados de Aluguel de Jogos

Este projeto é um banco de dados PostgreSQL para gerenciar o **aluguel de jogos**, clientes e atendentes de uma locadora. Ele possui quatro tabelas principais: `aluguel`, `cliente`, `atendente` e `jogo`.

---

## Estrutura das Tabelas

### 1. Tabela `atendente`

Armazena informações sobre os atendentes da locadora.

| Coluna | Tipo | Descrição |
|--------|------|-----------|
| cpf | `CHAR(11)` | CPF do atendente (PK) |
| nome | `VARCHAR(100)` | Nome do atendente |

**Exemplo de registros:**

| cpf | nome |
|-----|------|
| 11111111111 | Ana Silva |
| 22222222222 | Bruno Souza |
| 33333333333 | Carlos Lima |

---

### 2. Tabela `cliente`

Armazena informações sobre os clientes da locadora.

| Coluna | Tipo | Descrição |
|--------|------|-----------|
| cpf | `CHAR(11)` | CPF do cliente (PK) |
| nome | `VARCHAR(100)` | Nome do cliente |
| telefone | `VARCHAR(20)` | Telefone do cliente |
| endereço | `TEXT` | Endereço do cliente |
| email | `VARCHAR(100)` | Email do cliente |
| atendente_cpf | `CHAR(11)` | CPF do atendente responsável (FK para `atendente.cpf`) |

**Exemplo de registros:**

| cpf | nome | telefone | endereço | email | atendente_cpf |
|-----|------|----------|----------|-------|---------------|
| 44444444444 | Daniela Costa | (11) 99999-0001 | Rua A, 123 | daniela@email.com | 11111111111 |
| 55555555555 | Eduardo Pereira | (21) 98888-1111 | Rua B, 456 | eduardo@email.com | 22222222222 |
| 66666666666 | Fernanda Rocha | (31) 97777-2222 | Rua C, 789 | fernanda@email.com | 33333333333 |

---

### 3. Tabela `jogo`

Armazena informações sobre os jogos disponíveis para aluguel.

| Coluna | Tipo | Descrição |
|--------|------|-----------|
| código | `INTEGER` | Código do jogo (PK) |
| nome | `VARCHAR(100)` | Nome do jogo |
| fabricante | `VARCHAR(100)` | Fabricante do jogo |
| número_máximo_jogadores | `INTEGER` | Máximo de jogadores |
| ano_publicação | `INTEGER` | Ano de publicação |
| número_cópias | `INTEGER` | Quantidade de cópias disponíveis |
| atendente_cpf | `CHAR(11)` | CPF do atendente responsável (FK para `atendente.cpf`) |

**Exemplo de registros:**

| código | nome | fabricante | número_máximo_jogadores | ano_publicação | número_cópias | atendente_cpf |
|--------|------|------------|------------------------|----------------|---------------|---------------|
| 1 | Banco Imobiliário | Estrela | 6 | 1935 | 5 | 11111111111 |
| 2 | War | Grow | 4 | 1972 | 3 | 22222222222 |
| 3 | Uno | Mattel | 10 | 1971 | 7 | 33333333333 |

---

### 4. Tabela `aluguel`

Registra cada aluguel realizado pelos clientes.

| Coluna | Tipo | Descrição |
|--------|------|-----------|
| id | `INTEGER` | ID do aluguel (PK) |
| data_aluguel | `DATE` | Data do aluguel |
| cliente_cpf | `CHAR(11)` | CPF do cliente (FK para `cliente.cpf`) |
| jogo_código | `INTEGER` | Código do jogo alugado (FK para `jogo.código`) |
| atendente_cpf | `CHAR(11)` | CPF do atendente que realizou o aluguel (FK para `atendente.cpf`) |

**Exemplo de registros:**

| id | data_aluguel | cliente_cpf | jogo_código | atendente_cpf |
|----|--------------|------------|------------|---------------|
| 1 | 2025-09-01 | 44444444444 | 1 | 11111111111 |
| 2 | 2025-09-02 | 55555555555 | 2 | 22222222222 |
| 3 | 2025-09-03 | 66666666666 | 3 | 33333333333 |

---

## Relacionamentos

- `cliente.atendente_cpf` → `atendente.cpf`
- `jogo.atendente_cpf` → `atendente.cpf`
- `aluguel.cliente_cpf` → `cliente.cpf`
- `aluguel.jogo_código` → `jogo.código`
- `aluguel.atendente_cpf` → `atendente.cpf`

---

## Como usar

1. Crie o banco de dados no PostgreSQL.
2. Execute o script SQL para criar as tabelas e inserir os dados de exemplo.
3. Use consultas SQL para consultar aluguéis, clientes, jogos e atendentes.
