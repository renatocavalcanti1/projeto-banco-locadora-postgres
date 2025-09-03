# Locadora de Jogos

Este projeto é uma **base de dados para uma locadora de jogos**, contendo informações de atendentes, clientes, jogos e registros de aluguel.  

## Estrutura do Banco de Dados

O banco de dados possui as seguintes tabelas:

- **Atendente**: armazena os dados dos atendentes da locadora.
- **Cliente**: armazena informações dos clientes, incluindo o atendente responsável.
- **Jogo**: contém detalhes dos jogos disponíveis para aluguel, incluindo o atendente que cadastrou o jogo.
- **Aluguel**: registra os aluguéis realizados, relacionando clientes, jogos e atendentes.

## Backup / Arquivo SQL

O arquivo de backup está disponível em:  
**`LocadoraJogos.sql`** (formato plain SQL)  

### Como restaurar

Se estiver usando PostgreSQL, por exemplo:

```bash
-- Crie o banco de dados
createdb locadora_jogos

-- Restaure o backup
psql -d locadora_jogos -f LocadoraJogos.sql
Se estiver usando MySQL:

bash
Copiar código
-- Crie o banco de dados
CREATE DATABASE locadora_jogos;

-- Restaure o backup
mysql -u [usuario] -p locadora_jogos < LocadoraJogos.sql
Observações
Todos os CPFs utilizados são fictícios e servem apenas para testes.

O backup contém registros de exemplo para facilitar testes e desenvolvimento.

Estrutura de pastas sugerida
pgsql
Copiar código
LocadoraJogos/
│
├─ sql/
│  └─ LocadoraJogos.sql
├─ README.md
Desenvolvido como projeto de estudo/teste para gerenciamento de locadora de jogos.
