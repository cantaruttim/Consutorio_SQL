CREATE DATABASE CONSULTORIO;
USE CONSULTORIO;


-- Criando as tabelas
DROP TABLE IF EXISTS MEDICO;
CREATE TABLE MEDICO(
	IDMEDICO INT PRIMARY KEY AUTO_INCREMENT,
    MEDICO VARCHAR(30) NOT NULL,
    SEXO CHAR(1),
    CRM VARCHAR(6) UNIQUE NOT NULL,
    ESPECIALIDADE ENUM('Geral', 'Onco', 'Imuno', 'Orto', 'Endo', 'Psi', 'Neuro', 'Cardio'), 
    TELEFONE_MEDICO VARCHAR(10)
);
    

DROP TABLE IF EXISTS PACIENTE;
CREATE TABLE PACIENTE(
	IDPACIENTE INT PRIMARY KEY AUTO_INCREMENT,
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

/*
-- ALTER TABLES
-- ADDING PK

ALTER TABLE MEDICO ADD COLUMN IDMEDICO  INT NOT NULL FIRST;
ALTER TABLE MEDICO ADD PRIMARY KEY(IDMEDICO);

ALTER TABLE PACIENTE ADD COLUMN IDPACIENTE  INT NOT NULL FIRST;
ALTER TABLE PACIENTE ADD PRIMARY KEY(IDPACIENTE);

ALTER TABLE CONSULTA ADD COLUMN IDCONSULTA  INT NOT NULL  FIRST;
ALTER TABLE CONSULTA ADD PRIMARY KEY(IDCONSULTA);

*/

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

INSERT INTO MEDICO VALUES(NULL, 'Bruno Fraga', 'M', '784452', 'Endo', NULL);
INSERT INTO MEDICO VALUES(NULL, 'Giovanna Lacerda', 'F', '158652', 'Psi', '99586254');
INSERT INTO MEDICO VALUES(NULL, 'Goberto Arruda', 'M', '123548', 'Geral', '32546598');
INSERT INTO MEDICO VALUES(NULL, 'Fernanda Gallo', 'F', '258654', 'Geral', NULL);
INSERT INTO MEDICO VALUES(NULL, 'Bruna Mafra', 'F', '32546', 'Onco', '58426532');
INSERT INTO MEDICO VALUES(NULL, 'Bruno Fraga', 'M', '784552', 'Endo', '75854582');
INSERT INTO MEDICO VALUES(NULL, 'Felipe Vascos', 'M', '256357', 'Imuno', '78549652');
INSERT INTO MEDICO VALUES(NULL, 'Bruna Vieira', 'F', '12548', 'Neuro', '25874563');
INSERT INTO MEDICO VALUES(NULL, 'Matheus Alves', 'M', '12586', 'Neuro', NULL);
INSERT INTO MEDICO VALUES(NULL, 'Felipe Gonçlves', 'M', '258365', 'Neuro', NULL);
INSERT INTO MEDICO VALUES(NULL, 'Gabriella Ferreira Alves', 'F', '125484', 'Orto', '75854582');
INSERT INTO MEDICO VALUES(NULL, 'Renam Gonçalves', 'M', '225487', 'Orto', '75854582');
INSERT INTO MEDICO VALUES(NULL, 'Lucas Santos', 'M', '225484', 'Orto', NULL);
INSERT INTO MEDICO VALUES(NULL, 'Letícia Ferraz', 'F', '234555', 'Psi', '75854582');
INSERT INTO MEDICO VALUES(NULL, 'Vitória Alves', 'F', '125486', 'Geral', NULL);

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

-- Retorna a quantidade de médico por sua especialidade em ordem decrescente
SELECT ESPECIALIDADE, COUNT(*) AS "Quantidade"
FROM MEDICO
GROUP BY 1
ORDER BY 1 DESC;



DESC PACIENTE;

-- Inseringo valores na tabela de Pacientes

INSERT INTO PACIENTE VALUES (NULL, 'Carlos Cabral dos Santos', 'M', '12546325', 'Rua alencar das Pitais, São Paulo, SP');
INSERT INTO PACIENTE VALUES (NULL, 'Brunna Braga de Almeeida Wightein', 'F', '32048754', 'Rua Pedro de Toledo 1850, São Paulo, SP');
INSERT INTO PACIENTE VALUES (NULL, 'Victor dos Santos Barbosa', 'M', '25874563', 'Av Antônio Piranga, Diadema, SP');
INSERT INTO PACIENTE VALUES (NULL, ' Wellington Roberto Rodrigo Guilherme', 'M', '85249632', 'Rua Ângelo Dusi, São Bernardo do Campo, SP');
INSERT INTO PACIENTE VALUES (NULL, 'Carlos Cabral dos Santos', 'M', '12546325', 'Rua alencar das Pitais, SSão Bernardo do Campo, SP');
INSERT INTO PACIENTE VALUES (NULL, 'Luiza Vitória da Silva', 'F', '47854578', 'Rua Atílio Locatelli, São Paulo, SP');
INSERT INTO PACIENTE VALUES (NULL, 'Gabriella da Silva Marcondes', 'F', '85754242', 'Rua Michigan, Brookling, SP');
INSERT INTO PACIENTE VALUES (NULL, 'Sérgio Moura de Morais', 'M', '85859954', 'Rua Arizona, Brookling, SP');
INSERT INTO PACIENTE VALUES (NULL, 'João Victor dos Santos', 'M', '32546598', 'Av Hermano Marchetti, Água Branca, SP');
INSERT INTO PACIENTE VALUES (NULL, 'Flávia dos Santos', 'F', '78455321', 'Rua Moxei, Água Branca, SP');
INSERT INTO PACIENTE VALUES (NULL, 'Lilian da Conceição', 'F', '87536951', 'Rua Carlos Belmiro Correia, Imirim, SP');
INSERT INTO PACIENTE VALUES (NULL, 'Pedro Gonzala', 'M', '88524695', 'Rua Carlos Belmiro Correia, Imirim, SP');




-- Retorna a quantidade de pacientes atendidos por sexo
SELECT  SEXO, COUNT(*) AS "Quantidade"
FROM PACIENTE
	GROUP BY SEXO
	ORDER BY 1;

SELECT IDPACIENTE, NOME_PACIENTE, SEXO
FROM PACIENTE;



DESC PACIENTE;

/*
DESC bkp_paciente;
+-------------------+---------------+------+-----+---------+----------------+
| Field             | Type          | Null | Key | Default | Extra          |
+-------------------+---------------+------+-----+---------+----------------+
| IDBKUP            | int           | NO   | PRI | NULL    | auto_increment |
| IDPACIENTE        | int           | YES  |     | NULL    |                |
| NOME_PACIENTE     | varchar(50)   | YES  |     | NULL    |                |
| SEXO              | enum('M','F') | YES  |     | NULL    |                |
| TELEFONE_PACIENTE | varchar(10)   | YES  |     | NULL    |                |
| ENDERECO_PACIENTE | varchar(100)  | YES  |     | NULL    |                |
+-------------------+---------------+------+-----+---------+----------------+
7 rows in set (0.00 sec)
*/

-- CONECTANDO OS DOIS BANCOS CONSULTORIO -> BKP_CONSULTORIO

-- 1) Vamos adicionar um paciente do banco cosultorio na tabela BKP_PACIENTE do banco BKP_CONSULTORIO
USE consultorio;

-- Podemos ver as colunas/registros da tabela BKP_PACIENTE, do Banco BKP_CONSULTORIO.
SELECT * FROM BKP_CONSULTORIO.BKP_PACIENTE ;
-- Vamos adicionar um valor nesse banco

-- Testando a conexão entre os dois bancos
-- Observamos que os dois bancos estão conectados. E já é possível adicionarmos valores no banco BKP_CONSULTORIO
-- 		mesmo estando no banco CONSULTORIO.
INSERT INTO BKP_CONSULTORIO.BKP_PACIENTE VALUES (NULL, 1000, 'TESTE', 'M', '12345678', 'Rua João Luis Durval, SP');
/*
+--------+------------+---------------+------+-------------------+--------------------------+
| IDBKUP | IDPACIENTE | NOME_PACIENTE | SEXO | TELEFONE_PACIENTE | ENDERECO_PACIENTE        |
+--------+------------+---------------+------+-------------------+--------------------------+
|      1 |       1000 | TESTE         | M    | 12345678          | Rua João Luis Durval, SP |
+--------+------------+---------------+------+-------------------+--------------------------+
1 row in set (0.00 sec)
*/

DESC paciente;
DESC bkp_consultorio.bkp_paciente;

DELIMITER ~

CREATE TRIGGER bkp_consult
BEFORE INSERT ON paciente FOR EACH ROW
BEGIN

	INSERT INTO BKP_CONSULTORIO.BKP_PACIENTE VALUES(NULL, NEW.IDPACIENTE, NEW.NOME_PACIENTE, NEW.SEXO, NEW.TELEFONE_PACIENTE, NEW.ENDERECO_PACIENTE);

END
~

-- Confirmando o back_up da tabela Paciente
DELIMITER ~

CREATE TRIGGER bkp_paciente
BEFORE DELETE ON paciente FOR EACH ROW
BEGIN 
	INSERT INTO BKP_CONSULTORIO.BKP_PACIENTE VALUES(NULL, OLD.IDPACIENTE, OLD.NOME_PACIENTE, OLD.SEXO, OLD.TELEFONE_PACIENTE, OLD.ENDERECO_PACIENTE);
END
~






