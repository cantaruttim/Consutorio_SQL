CREATE DATABASE CONSULTORIO;
USE CONSULTORIO;


-- Criando as tabelas
DROP TABLE IF EXISTS MEDICO;
CREATE TABLE MEDICO(
    MEDICO VARCHAR(30) NOT NULL,
    SEXO CHAR(1),
    CRM VARCHAR(6) UNIQUE NOT NULL,
    ESPECIALIDADE ENUM('Geral', 'Onco', 'Imuno', 'Orto', 'Endo', 'Psi', 'Neuro', 'Cardio'), 
    TELEFONE_MEDICO VARCHAR(10)
);
    

DROP TABLE IF EXISTS PACIENTE;
CREATE TABLE PACIENTE(
    NOME_PACIENTE VARCHAR(50) NOT NULL,
    SEXO ENUM('M','F') NOT NULL,
    TELEFONE_PACIENTE VARCHAR(10) NOT NULL,
    ENDERECO_PACIENTE VARCHAR(100) NOT NULL
);


DROP TABLE IF EXISTS CONSULTA;
CREATE TABLE CONSULTA(
	IDPACIENTE INT,
    IDMEDICO INT
);

/*
DROP TABLE MEDICO;
DROP TABLE PACIENTE;
DROP TABLE CONSULTA;
*/

SHOW TABLES;


-- ALTER TABLES
-- ADDING PK

ALTER TABLE MEDICO ADD COLUMN IDMEDICO  INT NOT NULL FIRST;
ALTER TABLE MEDICO ADD PRIMARY KEY(IDMEDICO);

ALTER TABLE PACIENTE ADD COLUMN IDPACIENTE  INT NOT NULL FIRST;
ALTER TABLE PACIENTE ADD PRIMARY KEY(IDPACIENTE);

ALTER TABLE CONSULTA ADD COLUMN IDCONSULTA  INT NOT NULL  FIRST;
ALTER TABLE CONSULTA ADD PRIMARY KEY(IDCONSULTA);


DESC MEDICO;
DESC PACIENTE;
DESC CONSULTA;

/*
**** Observe como as tabelas ficaram após realizarmos as alterações das tabelas assim como
adicionamos as colunas idmedico, idpaciente, idconsulta como as primeiras consultas de cada tabela assim como
alteramos o tipo dela para INT e colocamos elas como PRIMARY KEY


mysql> SHOW TABLES;
+-----------------------+
| Tables_in_consultorio |
+-----------------------+
| consulta              |
| medico                |
| paciente              |
+-----------------------+
3 rows in set (0.00 sec)

mysql> DESC MEDICO;
+-----------------+-------------------------------------------------------------------+------+-----+---------+-------+
| Field           | Type                                                              | Null | Key | Default | Extra |
+-----------------+-------------------------------------------------------------------+------+-----+---------+-------+
| IDMEDICO        | int                                                               | NO   | PRI | NULL    |       |
| MEDICO          | varchar(30)                                                       | NO   |     | NULL    |       |
| SEXO            | char(1)                                                           | YES  |     | NULL    |       |
| CRM             | varchar(6)                                                        | NO   | UNI | NULL    |       |
| ESPECIALIDADE   | enum('Geral','Onco','Imuno','Orto','Endo','Psi','Neuro','Cardio') | YES  |     | NULL    |       |
| TELEFONE_MEDICO | varchar(10)                                                       | YES  |     | NULL    |       |
+-----------------+-------------------------------------------------------------------+------+-----+---------+-------+
6 rows in set (0.00 sec)



mysql> DESC PACIENTE;
+-------------------+---------------+------+-----+---------+-------+
| Field             | Type          | Null | Key | Default | Extra |
+-------------------+---------------+------+-----+---------+-------+
| IDPACIENTE        | int           | NO   | PRI | NULL    |       |
| NOME_PACIENTE     | varchar(50)   | NO   |     | NULL    |       |
| SEXO              | enum('M','F') | NO   |     | NULL    |       |
| TELEFONE_PACIENTE | varchar(10)   | NO   |     | NULL    |       |
| ENDERECO_PACIENTE | varchar(100)  | NO   |     | NULL    |       |
+-------------------+---------------+------+-----+---------+-------+
5 rows in set (0.00 sec)


DESC CONSULTA;

+------------+------+------+-----+---------+-------+
| Field      | Type | Null | Key | Default | Extra |
+------------+------+------+-----+---------+-------+
| IDCONSULTA | int  | NO   | PRI | NULL    |       |
| IDPACIENTE | int  | YES  |     | NULL    |       |
| INMEDICO   | int  | YES  |     | NULL    |       |
+------------+------+------+-----+---------+-------+
3 rows in set (0.00 sec)
*/


-- INSERINDO OS VALORES

DESC MEDICO;
-- Todos os valores de Nome,CRM e telefones são ficticios

INSERT INTO MEDICO VALUES(1, 'Bruno Fraga', 'M', '784452', 'Endo', NULL);
INSERT INTO MEDICO VALUES(2, 'Giovanna Lacerda', 'F', '158652', 'Psi', '99586254');
INSERT INTO MEDICO VALUES(3, 'Goberto Arruda', 'M', '123548', 'Geral', '32546598');
INSERT INTO MEDICO VALUES(4, 'Fernanda Gallo', 'F', '258654', 'Geral', NULL);
INSERT INTO MEDICO VALUES(5, 'Bruna Mafra', 'F', '32546', 'Onco', '58426532');
INSERT INTO MEDICO VALUES(6, 'Bruno Fraga', 'M', '784552', 'Endo', '75854582');
INSERT INTO MEDICO VALUES(7, 'Felipe Vascos', 'M', '256357', 'Imuno', '78549652');
INSERT INTO MEDICO VALUES(8, 'Bruna Vieira', 'F', '12548', 'Neuro', '25874563');
INSERT INTO MEDICO VALUES(9, 'Matheus Alves', 'M', '12586', 'Neuro', NULL);
INSERT INTO MEDICO VALUES(10, 'Felipe Gonçlves', 'M', '258365', 'Neuro', NULL);
INSERT INTO MEDICO VALUES(11, 'Gabriella Ferreira Alves', 'F', '125484', 'Orto', '75854582');
INSERT INTO MEDICO VALUES(12, 'Renam Gonçalves', 'M', '225487', 'Orto', '75854582');
INSERT INTO MEDICO VALUES(13, 'Lucas Santos', 'M', '225484', 'Orto', NULL);
INSERT INTO MEDICO VALUES(14, 'Letícia Ferraz', 'F', '234555', 'Psi', '75854582');
INSERT INTO MEDICO VALUES(15, 'Vitória Alves', 'F', '125486', 'Geral', NULL);

-- SELECTS : MEDICO 

-- Retorna o nome do médico, o CRM e sua Especialidade médica.
SELECT IDMEDICO AS "Matrícula",
	   MEDICO AS "MÉDICO",
	   CRM AS "REGISTRO" , 
       ESPECIALIDADE AS "ESPECIALIDADE MÉDICA"
FROM MEDICO;


-- Retorna no momento 8 médicos e 7 médicas
SELECT SEXO, COUNT(*) AS "Quantidade"
FROM MEDICO
GROUP BY 1;


