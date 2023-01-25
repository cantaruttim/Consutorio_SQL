CREATE DATABASE BKP_CONSULTORIO;
USE BKP_CONSULTORIO;

/*
+-------------------+---------------+------+-----+---------+-------+
| Field             | Type          | Null | Key | Default | Extra |
+-------------------+---------------+------+-----+---------+-------+
| IDPACIENTE        | int           | NO   | PRI | NULL    |       |
| NOME_PACIENTE     | varchar(50)   | NO   |     | NULL    |       |
| SEXO              | enum('M','F') | NO   |     | NULL    |       |
| TELEFONE_PACIENTE | varchar(10)   | NO   |     | NULL    |       |
| ENDERECO_PACIENTE | varchar(100)  | NO   |     | NULL    |       |
+-------------------+---------------+------+-----+---------+-------+

+------------+------+------+-----+---------+-------+
| Field      | Type | Null | Key | Default | Extra |
+------------+------+------+-----+---------+-------+
| IDCONSULTA | int  | NO   | PRI | NULL    |       |
| IDPACIENTE | int  | YES  |     | NULL    |       |
| INMEDICO   | int  | YES  |     | NULL    |       |
+------------+------+------+-----+---------+-------+
3 rows in set (0.00 sec)

*/

USE bkp_consultorio;
DESC BKP_PACIENTE;

DROP TABLE IF EXISTS BKP_PACIENTE;
CREATE TABLE BKP_PACIENTE(
	IDBKUP INT PRIMARY KEY AUTO_INCREMENT,
	IDPACIENTE INT,
    NOME_PACIENTE VARCHAR(50),
    SEXO ENUM('M','F'),
    TELEFONE_PACIENTE VARCHAR(10),
    ENDERECO_PACIENTE VARCHAR(100) 
);

select * from BKP_PACIENTE;

