

CREATE DATABASE Teste1HARMOCOMQUE;
USE Teste1HARMOCOMQUE;
-- ----------------------------------------------------------

CREATE TABLE TB_STATUS(
IDSTATUS TINYINT PRIMARY KEY AUTO_INCREMENT,
NOME VARCHAR(20) NOT NULL
);

INSERT INTO TB_STATUS(NOME) VALUES('ATIVO');
INSERT INTO TB_STATUS(NOME) VALUES('DESATIVADO');


CREATE TABLE TB_USUARIO(
IDUSUARIO INT PRIMARY KEY AUTO_INCREMENT,
NOME VARCHAR(60) NOT NULL,
EMAIL VARCHAR(120) NOT NULL,
SENHA VARCHAR(240) NOT NULL,
IMAGEM VARCHAR(60),
DTCADASTRO DATETIME NOT NULL,
FK_STATUS TINYINT DEFAULT 1
);

INSERT INTO TB_USUARIO (NOME, EMAIL, SENHA, DTCADASTRO, FK_STATUS) VALUES('MIKHAIL', 'ANAOMSB@HOTMAIL.COM', 'JNDISAUD', NOW(), 1);
SELECT TB_USUARIO.NOME, TB_USUARIO.EMAIL, TB_USUARIO.SENHA, TB_USUARIO.DTCADASTRO, TB_STATUS.NOME AS STATUS FROM TB_USUARIO
INNER JOIN TB_STATUS ON TB_STATUS.IDSTATUS = TB_USUARIO.FK_STATUS;

ALTER TABLE TB_USUARIO ADD CONSTRAINT FK_USUARIO_STATUS
FOREIGN KEY (FK_STATUS) REFERENCES TB_STATUS(IDSTATUS);

CREATE TABLE TB_ESTILO(
EDESTILO SMALLINT PRIMARY KEY AUTO_INCREMENT,
NOME VARCHAR(50) NOT NULL
);

CREATE TABLE TB_CERVEJA(
IDCERVEJA INT PRIMARY KEY AUTO_INCREMENT,
NOME VARCHAR(60) NOT NULL,
FK_ESTILO INT,
ABV FLOAT(3,2),
IBU TINYINT,
CONTEUDO TINYINT,
DESCRICAO VARCHAR(1000),
VISUAL VARCHAR(50),
OLFATIVO VARCHAR(60),
GUSTATIVO VARCHAR(60),
TEMPERATURA VARCHAR(5),
IMAGEM VARCHAR(60),
FK_STATUS TINYINT
);

ALTER TABLE TB_CERVEJA ADD CONSTRAINT FK_CERVEJA_ESTILO
FOREIGN KEY (FK_ESTILO) REFERENCES TB_ESTILO(IDESTILO);

ALTER TABLE TB_CERVEJA ADD CONSTRAINT FK_CERVEJA_STATUS
FOREIGN KEY (FK_STATUS) REFERENCES TB_STATUS(IDSTATUS);

CREATE TABLE TB_HARMONIZACAO(
IDHARMONIZACAO INT PRIMARY KEY AUTO_INCREMENT,
NOME VARCHAR(60) NOT NULL
);


CREATE TABLE TB_CERVEJA_HARMONIZACAO(
ID_CERVEJA INT PRIMARY KEY,
ID_HARMONIZACAO INT PRIMARY KEY
);

CREATE TABLE TB_CERVEJARIA(
IDCERVEJARIA INT PRIMARY KEY AUTO_INCREMENT,
NOME VARCHAR(60) NOT NULL,
CIDADE VARCHAR(60),
ESTADO VARCHAR(60),
SITE VARCHAR(120),
IMAGEM VARCHAR(60),
FK_STATUS TINYINT
);

ALTER TABLE TB_CERVEJARIA_CERVEJA 
ADD CONSTRAINT FK_CERVEJARIA
FOREIGN KEY (ID_CERVEJARIA) REFERENCES TB_CERVEJARIA(IDCERVEJARIA);

ALTER TABLE TB_CERVEJARIA_CERVEJA 
ADD CONSTRAINT FK_CERVEJA
FOREIGN KEY (ID_CERVEJA) REFERENCES TB_CERVEJA(IDCERVEJA);

CREATE TABLE TB_VINHO(
IDVINHO INT PRIMARY KEY AUTO_INCREMENT,
NOME VARCHAR(60) NOT NULL,
CONTEUDO TINYINT,
FK_TIPO TINYINT,
REGIAO VARCHAR(30),
FK_VINICOLA INT,
UVAS VARCHAR(20),
AMADURECIMENTO VARCHAR(250),
GUARDA TINYINT,
VISUAL VARCHAR(60),
OLFATIVO VARCHAR(150),
GUSTATIVO VARCHAR(150),
TEMPERATURA TINYINT,
DESCRICAO VARCHAR(1000),
IMAGEM VARCHAR(60),
FK_STATUS TINYINT
);

CREATE TABLE TB_TIPO_VINHO(
IDTIPO TINYINT PRIMARY KEY AUTO_INCREMENT,
NOME VARCHAR(40) NOT NULL
);

ALTER TABLE TB_VINHO
ADD CONSTRAINT FK_TIPO_VINHO
FOREIGN KEY (FK_TIPO) REFERENCES TB_TIPO_VINHO(IDTIPO);

CREATE TABLE TB_VINICOLA(
IDVINICOLA INT PRIMARY KEY AUTO_INCREMENT,
NOME VARCHAR(60) NOT NULL,
REGIAO VARCHAR(60),
SITE VARCHAR(150),
IMAGEM VARCHAR(60),
FK_STATUS TINYINT
);

ALTER TABLE TB_VINHO
ADD CONSTRAINT FK_VINICOLA_VINHO
FOREIGN KEY (FK_VINICOLA) REFERENCES TB_VINICOLA(IDVINICOLA);

ALTER TABLE TB_VINHO
ADD CONSTRAINT FK_VINHO_STATUS
FOREIGN KEY (FK_STATUS) REFERENCES TB_STATUS(IDSTATUS);

ALTER TABLE TB_VINICOLA
ADD CONSTRAINT FK_VINICOLA_STATUS
FOREIGN KEY (FK_STATUS) REFERENCES TB_STATUS(IDSTATUS);

CREATE TABLE TB_VINHO_HARMONIZACAO(
ID_VINHO INT PRIMARY KEY,
ID_HARMONIZACAO INT PRIMARY KEY
);

ALTER TABLE TB_VINHO_HARMONIZACAO
ADD CONSTRAINT FK_VINHO_HARMONIZACAO
FOREIGN KEY (ID_VINHO) REFERENCES TB_VINHO(IDVINHO);

ALTER TABLE TB_VINHO_HARMONIZACAO
ADD CONSTRAINT FK_HARMONIZACAO_VINHO
FOREIGN KEY (ID_HARMONIZACAO) REFERENCES TB_HARMONIZACAO(IDHARMONIZACAO);

CREATE TABLE TB_LIKE_CERVEJA(
ID_CERVEJA INT PRIMARY KEY,
ID_USUARIO INT PRIMARY KEY,
NOTA TINYINT,
COMENTARIO VARCHAR(250),
FK_STATUS TINYINT
);

ALTER TABLE TB_LIKE_CERVEJA
ADD CONSTRAINT CERVEJA_USUARIO_LIKE
FOREIGN KEY (ID_CERVEJA) REFERENCES TB_CERVEJA(IDCERVEJA);

ALTER TABLE TB_LIKE_CERVEJA
ADD CONSTRAINT USUARIO_CERVEJA_LIKE
FOREIGN KEY (ID_USUARIO) REFERENCES TB_USUARIO(IDUSUARIO);

ALTER TABLE TB_LIKE_CERVEJA
ADD CONSTRAINT LIKE_CERVEJA_STATUS
FOREIGN KEY (FK_STATUS) REFERENCES TB_STATUS(IDSTATUS);

CREATE TABLE TB_LIKE_VINHO(
ID_VINHO INT PRIMARY KEY,
ID_USUARIO INT PRIMARY KEY,
NOTA TINYINT,
COMENTARIO VARCHAR(250),
FK_STATUS TINYINT
);

ALTER TABLE TB_LIKE_VINHO
ADD CONSTRAINT VINHO_USUARIO_LIKE
FOREIGN KEY (ID_VINHO) REFERENCES TB_VINHO(IDVINHO);

ALTER TABLE TB_LIKE_VINHO
ADD CONSTRAINT USUARIO_VINHO_LIKE
FOREIGN KEY (ID_USUARIO) REFERENCES TB_USUARIO(IDUSUARIO);

ALTER TABLE TB_LIKE_VINHO
ADD CONSTRAINT LIKE_VINHO_STATUS
FOREIGN KEY (FK_STATUS) REFERENCES TB_STATUS(IDSTATUS);

------------------------------------------------------------------------------------------------

CREATE TABLE TB_MINHA_ADEGA_CER(
ID_CERVEJA INT PRIMARY KEY,
ID_USUARIO INT PRIMARY KEY,
QTD TINYINT NOT NULL,
FK_STATUS TINYINT
);

ALTER TABLE  TB_MINHA_ADEGA_CER
ADD CONSTRAINT MINHA_ADEGA_CERVEJA
FOREIGN KEY (ID_CERVEJA) REFERENCES TB_CERVEJA(IDCERVEJA);

ALTER TABLE TB_MINHA_ADEGA_CER
ADD CONSTRAINT MINHA_ADEGA_USUARIO_CERVEJA
FOREIGN KEY (ID_USUARIO) REFERENCES TB_USUARIO(IDUSUARIO);

ALTER TABLE TB_MINHA_ADEGA_CER
ADD CONSTRAINT MINHA_ADEGA_CERVEJA_STATUS
FOREIGN KEY (FK_STATUS) REFERENCES TB_STATUS(IDSTATUS);

CREATE TABLE TB_MINHA_ADEGA_VIN(
ID_VINHO INT PRIMARY KEY,
ID_USUARIO INT PRIMARY KEY,
QTD TINYINT,
FK_STATUS TINYINT
);

ALTER TABLE TB_MINHA_ADEGA_VIN
ADD CONSTRAINT MINHA_ADEGA_VINHO
FOREIGN KEY (ID_VINHO) REFERENCES TB_VINHO(IDVINHO);

ALTER TABLE TB_MINHA_ADEGA_VIN
ADD CONSTRAINT MINHA_ADEGA_USUARIO_VINHO
FOREIGN KEY (ID_USUARIO) REFERENCES TB_USUARIO(IDUSUARIO);

ALTER TABLE TB_MINHA_ADEGA_VIN
ADD CONSTRAINT MINHA_ADEGA_VINHO_STATUS
FOREIGN KEY (FK_STATUS) REFERENCES TB_STATUS(IDSTATUS);