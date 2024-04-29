CREATE TABLE Funcionarios(
	id_func serial PRIMARY KEY,
	nome_func varchar(100),
	data_admissao date
)

SELECT * FROM Funcionarios

CREATE TABLE projetos(
	id_projeto serial PRIMARY KEY,
	nome_projeto varchar (250),
	descricao text
);

SELECT * FROM projetos

CREATE TABLE funcionarios_projetos(
	id_func int,
	CONSTRAINT fk_func FOREIGN KEY(id_func) REFERENCES funcionarios (id_func),
	id_projeto int,
	CONSTRAINT fk_projeto FOREIGN KEY(id_projeto) REFERENCES projetos (id_projeto)
)
SELECT * FROM funcionarios_projetos

INSERT INTO Funcionarios VALUES (1,'Maria Helena', '19/01/2023');
INSERT INTO Funcionarios VALUES (2,'João Lima', '24/02/2023');
INSERT INTO Funcionarios VALUES (3,'Gabriel Lima', '10/04/2023');
INSERT INTO Funcionarios VALUES (4,'Murillo Lima', '25/06/2023');
INSERT INTO Funcionarios VALUES (5,'Luana Anhaia', '02/07/2023');
INSERT INTO Funcionarios VALUES (6,'Lucas Henrique', '02/07/2023');
INSERT INTO Funcionarios VALUES (7,'Eliseu Rosario','05/07/2023');
INSERT INTO Funcionarios VALUES (8,'Roseli Machado', '05/07/2023');
INSERT INTO Funcionarios VALUES (9,'Jeremias Pereira', '10/07/2023');
INSERT INTO Funcionarios VALUES (10,'Miguel Reis', '10/07/2023');
INSERT INTO projetos VALUES (1,'Museu do Amanha', 'museu de ciencias');
INSERT INTO projetos VALUES (2,'Escadaria Selaron','escada feita de azulejos');
INSERT INTO projetos VALUES (3,'Maracana','estadio de futebol');
INSERT INTO projetos VALUES (4,'Pao de Acucar', 'conjunto de morros');
INSERT INTO projetos VALUES (5,'Estatua da Liberdade', 'simbolo de liberdade');
INSERT INTO projetos VALUES (6,'Cristo Redentor', 'estatua de Jesus Cristo');
INSERT INTO projetos VALUES (7,'Grande muralha da china', 'muralha');
INSERT INTO projetos VALUES (8,'Coliseu', 'monumento historico');
INSERT INTO projetos VALUES (9,'Torre de Pisa', 'sinos da catedral');
INSERT INTO projetos VALUES (10,'Torre Eiffel', 'Simbolo de Paris e Franca');
INSERT INTO funcionarios_projetos VALUES (1,1);
INSERT INTO funcionarios_projetos VALUES (2,2);
INSERT INTO funcionarios_projetos VALUES (3,3);
INSERT INTO funcionarios_projetos VALUES (4,4);
INSERT INTO funcionarios_projetos VALUES (5,5);
INSERT INTO funcionarios_projetos VALUES (6,6);
INSERT INTO funcionarios_projetos VALUES (7,7);
INSERT INTO funcionarios_projetos VALUES (8,8);
INSERT INTO funcionarios_projetos VALUES (9,9);
INSERT INTO funcionarios_projetos VALUES (10,10);

SELECT * FROM funcionarios

SELECT * FROM projetos

SELECT * FROM funcionarios_projetos

--Letra A (Listar todos os funcionarios associados a um projeto especifico)
SELECT funcionarios.nome_func, projetos.nome_projeto FROM (projetos NATURAL INNER JOIN funcionarios_projetos)
INNER JOIN funcionarios USING (id_func)
WHERE projetos.nome_projeto = 'Maracana'

-- Letra B (Encontrar todos os projetos em que um funcionario especifico esta envolvido)
SELECT projetos.nome_projeto, funcionarios.nome_func FROM (funcionarios NATURAL INNER JOIN funcionarios_projetos)
INNER JOIN projetos USING (id_projeto)
WHERE funcionarios.nome_func = 'Gabriel Lima'


-- Letra C (Calcular a média de funcionários por projeto.)
SELECT SUM(subquery.numero_funcionarios) / COUNT(DISTINCT subquery.id_projeto) AS media_funcionarios_por_projeto
FROM (
    SELECT projetos.id_projeto, COUNT(funcionarios.id_func) AS numero_funcionarios
    FROM projetos
    INNER JOIN funcionarios_projetos ON projetos.id_projeto = funcionarios_projetos.id_projeto
    INNER JOIN funcionarios ON funcionarios_projetos.id_func = funcionarios.id_func
    GROUP BY projetos.id_projeto
) AS subquery;


