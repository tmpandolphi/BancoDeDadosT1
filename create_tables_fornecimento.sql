CREATE TABLE fornecedor
	(pcod INTEGER PRIMARY KEY,
	pnome VARCHAR(40) NOT NULL,
	status INTEGER, 
	cidade VARCHAR(30));


CREATE TABLE peca (
	pcod INTEGER PRIMARY KEY,
	pnome VARCHAR(20) NOT NULL,
	cor VARCHAR(10),
	preco FLOAT NOT NULL,
	cidade VARCHAR(30));

CREATE TABLE instituicao (
	icod INTEGER PRIMARY KEY, 
	nome VARCHAR(30) NOT NULL);

CREATE TABLE projeto (
	prcod INTEGER PRIMARY KEY,
	icod INTEGER REFERENCES instituicao(icod),
	prnome VARCHAR(30) NOT NULL,
	cidade VARCHAR(30));

CREATE TABLE fornecimento (
	fcod INTEGER REFERENCES fornecedor(pcod),
	pcod INTEGER REFERENCES peca(pcod),
	prcod INTEGER REFERENCES projeto(prcod),
	quantidade INTEGER NOT NULL,
	PRIMARY KEY (fcod, pcod, prcod));

--EXERCICIO DOIS

CREATE TABLE cidade (
  ccod INTEGER PRIMARY KEY, 
  cnome VARCHAR(20),
  uf VARCHAR(2));

ALTER TABLE fornecedor 
  ADD COLUMN ccod INTEGER REFERENCES cidade(ccod)

ALTER TABLE projeto 
  DROP COLUMN icod

ALTER TABLE projeto 
  DROP COLUMN cidade
ALTER TABLE projeto 
  ADD COLUMN ccod INTEGER REFERENCES cidade(ccod)

DROP TABLE instituicao

ALTER TABLE FORNECEDOR
 	DROP COLUMN cidade

ALTER TABLE fornecedor
	ADD COLUMN fone INTEGER

ALTER TABLE peca
	ADD COLUMN ccod integer references cidade(ccod)

--EXERCICIO TRES

INSERT INTO cidade (ccod, cnome, uf) VALUES
	(2, 'Caxias Sul', 'RS'), 
	(3, 'Porto Alegre', 'RS'), 
	(5, 'Farroupilha', 'RS'), 
	(6, 'Garibaldi', 'RS'), 
	(7, 'Pelotas', 'RS'), 
	(10, 'Santa Maria', 'RS'), 
	(30, 'Girua', 'RS');

INSERT INTO fornecedor (pcod, pnome, status, ccod, fone) VALUES
	(5, 'Carlos Menezes', 0, 2, '53534444'), 
	(18, 'Mariana Vaz', 3, 2, '53531144'), 
	(60, 'Pedro Antunes', 2, 2, '53531212');
	
INSERT INTO peca (pcod, pnome, cor, preco, ccod) VALUES
	(1, 'camiseta', 'azul', 10, 2), 
	(2, 'camiseta', 'vermelha', 10, 2), 
	(3, 'camiseta', 'branca', 10, 2), 
	(4, 'camiseta', 'verde', 10, 2), 
	(5, 'camiseta', 'preta', 10, 2), 
	(10, 'sacola um', 'azul', 20, 5), 
	(11, 'sacola dois', 'preta', 20, 5);

INSERT INTO projeto (prcod, prnome, ccod) VALUES
	(50, 'Remontaveis', 3), 
	(60, 'Sucata', 2), 
	(70, 'Renovaveis', 30), 
	(80, 'Inovacao', 10);

INSERT INTO fornecimento (fcod, pcod, prcod, quantidade) VALUES
	(5, 1, 70, 100), 
	(5, 2, 70, 100), 
	(5, 3, 70, 80), 
	(5, 4, 70, 50), 
	(5, 5, 70, 150), 
	(60, 10, 50, 100),
	(60, 11, 50, 100);

--EXERCICIO QUATRO

UPDATE cidade 
  SET cnome = 'Caxias do Sul' WHERE cnome = 'Caxias Sul'

UPDATE fornecedor 
  SET pnome = 'Carlos Antonio Menezes' WHERE pnome = 'Carlos Menezes'

UPDATE fornecedor 
  SET status = 0 WHERE pnome = 'Mariana Vaz'

UPDATE projeto 
  SET prnome = 'Pecas remontaveis ' WHERE prnome = 'Remontaveis'





