--1.1
SELECT pnome, fone FROM fornecedor

--1.2
SELECT prnome FROM projeto
WHERE prcod IN 
(SELECT PRCOD FROM FORNECIMENTO WHERE FCOD = 5)

--1.3
SELECT pcod, prnome, quantidade FROM fornecimento, projeto
WHERE quantidade > 10 AND projeto.prnome = 'Renovaveis'

--1.4
SELECT cnome FROM cidade
WHERE ccod IN
(SELECT ccod from fornecedor)

--1.5
SELECT pcod, pnome, cor, preco FROM peca 
WHERE ccod IN
(SELECT ccod From cidade where cnome = 'Caxias do Sul')





