USE ecommerce;

CREATE TABLE IF NOT EXISTS clients_exclusao_log (
    idLog INT AUTO_INCREMENT PRIMARY KEY,
    idClient INT,
    Fname VARCHAR(10),
    Minit CHAR(3),
    Lname VARCHAR(20),
    CPF CHAR(11),
    Address VARCHAR(255),
    data_exclusao DATETIME DEFAULT CURRENT_TIMESTAMP
);

delimiter $$

create trigger before_delete_client
before delete on clients
for each row
begin
	insert into clients_exclusao_log (
		idClient, Fname, Minit, Lname, CPF, Address
    )
    Values(
		old.idClient, old.Fname, old.Minit,
        old.Lname, old.CPF, old.Address
    );
end $$

delimiter ;

CREATE TABLE IF NOT EXISTS colaboradores (
    idColaborador INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    salario DECIMAL(10,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS auditoria_salario (
    idAuditoria INT AUTO_INCREMENT PRIMARY KEY,
    idColaborador INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    salario_anterior DECIMAL(10,2),
    salario_novo DECIMAL(10,2) NOT NULL,
    operacao VARCHAR(20) NOT NULL,
    data_operacao DATETIME DEFAULT CURRENT_TIMESTAMP
);

drop trigger if exists before_insert_colaborador;

delimiter $$

USE ecommerce;

DROP TRIGGER IF EXISTS before_insert_colaborador;

DELIMITER $$

CREATE TRIGGER after_insert_colaborador
AFTER INSERT ON colaboradores
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_salario (
        idColaborador,
        nome,
        salario_anterior,
        salario_novo,
        operacao
    )
    VALUES (
        NEW.idColaborador,
        NEW.nome,
        NULL,
        NEW.salario,
        'INSERT'
    );
END $$

DELIMITER ;

INSERT INTO colaboradores (nome, salario)
VALUES ('Carlos Souza', 3000.00);

UPDATE colaboradores
SET salario = 3500.00
WHERE nome = 'Carlos Souza';

INSERT INTO colaboradores (nome, salario)
VALUES ('Mariana Costa', 4000.00);

select * from clients;

SELECT * FROM auditoria_salario;

SELECT * FROM colaboradores;

SELECT * FROM auditoria_salario;

SHOW TRIGGERS FROM ecommerce;

DELETE FROM clients
WHERE idClient = 9;

SELECT * FROM clients_exclusao_log;
