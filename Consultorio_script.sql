CREATE DATABASE CONSULTORIO;
USE CONSULTORIO;


-- Criando as tabelas
DROP TABLE IF EXISTS MEDICO;
CREATE TABLE MEDICO(
    NOME_MEDICO VARCHAR(30) NOT NULL,
    CRM_MEDICO VARCHAR(6) UNIQUE NOT NULL,
    ESPECIALIDADE ENUM('Geral', 'Onco', 'Imuno', 'Orto', 'Endo', 'Psi', 'Neuro', 'Cardio'), 
    TELEFONE_MEDICO VARCHAR(10) NOT NULL
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
    INMEDICO INT
);

/*
DROP TABLE MEDICO;
DROP TABLE PACIENTE;
DROP TABLE CONSULTA;
*/

SHOW TABLES;


-- ALTER TABLES
-- ADDING PK

ALTER TABLE MEDICO ADD COLUMN IDMEDICO  INT FIRST;
ALTER TABLE MEDICO ADD PRIMARY KEY(IDMEDICO);

ALTER TABLE PACIENTE ADD COLUMN IDPACIENTE  INT FIRST;
ALTER TABLE PACIENTE ADD PRIMARY KEY(IDPACIENTE);

ALTER TABLE CONSULTA ADD COLUMN IDCONSULTA  INT FIRST;
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
| NOME_MEDICO     | varchar(30)                                                       | NO   |     | NULL    |       |
| CRM_MEDICO      | varchar(6)                                                        | NO   | UNI | NULL    |       |
| ESPECIALIDADE   | enum('Geral','Onco','Imuno','Orto','Endo','Psi','Neuro','Cardio') | YES  |     | NULL    |       |
| TELEFONE_MEDICO | varchar(10)                                                       | NO   |     | NULL    |       |
+-----------------+-------------------------------------------------------------------+------+-----+---------+-------+
5 rows in set (0.00 sec)



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




