Projeto de Banco de Dados - Locadora de Jogos (PostgreSQL)

Este repositório contém a modelagem e implementação de um banco de dados para uma locadora de jogos, desenvolvido em PostgreSQL. Inclui tabelas, chaves primárias e estrangeiras, além de registros de exemplo.

Estrutura do Banco
Tabelas principais

atendente

cpf (PK)

nome

cliente

cpf (PK)

nome

telefone

endereço

email

atendente_cpf (FK → atendente)

jogo

código (PK)

nome

fabricante

número_máximo_jogadores

ano_publicação

número_cópias

atendente_cpf (FK → atendente)

aluguel

id (PK)

data_aluguel

cliente_cpf (FK → cliente)

jogo_código (FK → jogo)

atendente_cpf (FK → atendente)

Exemplo de Dados

Atendentes:

Ana Silva

Bruno Souza

Carlos Lima

Clientes:

Daniela Costa

Eduardo Pereira

Fernanda Rocha

Jogos:

Banco Imobiliário

War

Uno

Aluguéis:

Relacionam clientes com jogos em datas específicas, com registro do atendente responsável.
