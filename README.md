# Desafio MySQL — Views, Permissões e Triggers

## Objetivo

Desenvolver conhecimentos práticos em SQL e MySQL por meio da criação de views para apresentação de dados, controle de permissões de acesso e triggers para automatização de operações e registro de alterações.

## Tecnologias utilizadas

- MySQL
- MySQL Workbench
- SQL

## Estrutura do projeto

| Arquivo | Descrição |
|---|---|
| `01_views_permissoes_company.sql` | Criação de views para consultas de empregados, departamentos, projetos, gerentes e dependentes, além da configuração de permissões de acesso. |
| `02_triggers_ecommerce.sql` | Criação de triggers para preservar dados antes da exclusão de clientes e registrar inserções e atualizações salariais de colaboradores. |

## Conceitos praticados

- Criação e utilização de views com `CREATE VIEW`.
- Consultas com `JOIN` e `LEFT JOIN`.
- Agregações com `COUNT` e agrupamentos com `GROUP BY`.
- Controle de acesso por meio de usuários e privilégios com `CREATE USER` e `GRANT`.
- Criação de triggers com `CREATE TRIGGER`.
- Utilização de `OLD` e `NEW` para acessar valores de registros.
- Auditoria de exclusões e alterações salariais.
- Testes de execução e validação dos resultados no MySQL Workbench.

## Descrição das atividades

### Parte 1 — Views e permissões

Criação de visões para apresentar:

- Quantidade de empregados por departamento e localidade.
- Departamentos e seus gerentes.
- Projetos com maior número de empregados.
- Projetos, departamentos e gerentes.
- Empregados com dependentes e indicação de atuação como gerente.

Também são praticados conceitos de permissões de acesso às views de acordo com o perfil de cada usuário.

### Parte 2 — Triggers para e-commerce

Implementação de gatilhos para:

- Preservar os dados de clientes antes da exclusão, utilizando `BEFORE DELETE`.
- Registrar a inserção de colaboradores.
- Registrar alterações salariais antes da atualização, utilizando `BEFORE UPDATE`.

Foram utilizadas tabelas auxiliares para armazenar o histórico de exclusões e as informações de auditoria salarial.

## Como executar

1. Instale o MySQL Server e o MySQL Workbench.
2. Abra os arquivos SQL no MySQL Workbench.
3. Confira se os bancos de dados e as tabelas necessários existem.
4. Execute o script de views e permissões no banco `azure_company`.
5. Execute o script de triggers no banco `ecommerce`.
6. Verifique a criação das views e triggers e execute as consultas de teste.

**Atenção:** os scripts podem criar objetos e inserir dados de exemplo. Revise seu conteúdo antes de executá-los novamente em bancos que já contenham dados. Ajuste usuários, senhas e permissões conforme o ambiente.

## Aprendizados

O projeto permitiu praticar a organização e apresentação de dados por meio de views, o controle de acesso a objetos do banco de dados e a automatização de operações com triggers.

## Status

Projeto de estudo prático em MySQL.