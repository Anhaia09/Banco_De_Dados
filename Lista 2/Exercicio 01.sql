CREATE TABLE livros(
	id_isbn serial PRIMARY KEY,
	titulo varchar(250),
	editora varchar(100),
	ano_publicacao date 
);

SELECT * FROM livros

CREATE TABLE autores(
	id_autor serial PRIMARY KEY,
	nome_autor varchar (250)	
);

SELECT * FROM autores

CREATE TABLE livros_autores(
	id_isbn int,
	CONSTRAINT fk_isbn FOREIGN KEY(id_isbn) REFERENCES livros (id_isbn),
	id_autor int,
	CONSTRAINT fk_autor FOREIGN KEY(id_autor) REFERENCES autores (id_autor)
)
SELECT * FROM livros_autores

INSERT INTO livros VALUES (1,'o senhor dos aneis', 'Allen & Unwin', '29/07/1954');
INSERT INTO livros VALUES (2,'cem anos de solidao', 'Sudamericana', '30/05/1967');
INSERT INTO livros VALUES (3,'harry potter e a pedra filosofal', 'Bloomsbury Publishing', '26/06/1997');
INSERT INTO livros VALUES (4,'o pequeno principe', 'Reynal & Hitchcock', '06/04/1943');
INSERT INTO livros VALUES (5,'orgulho e preconceito', 'T. Egerton', '28/01/1813');
INSERT INTO livros VALUES (6,'a revolucao dos bichos', 'Secker and Warburg', '17/08/1945');
INSERT INTO livros VALUES (7,'a culpa e das estrelas', 'Dutton Books', '10/01/2012');
INSERT INTO livros VALUES (8,'o Sol e para Todos', 'J.B. Lippincott & Co.', '11/07/1960');
INSERT INTO livros VALUES (9,'harry potter e a camara secretas', 'Bloomsbury Publishing', '02/07/1998');
INSERT INTO livros VALUES (10,'romeu e julieta', 'Stationers Register', '04/09/1597');
INSERT INTO autores VALUES (20,'Marina Silva');
INSERT INTO autores VALUES (41,'Ana Clara');
INSERT INTO autores VALUES (62,'Gustavo Monteiro');
INSERT INTO autores VALUES (81,'Mariana Lopes');
INSERT INTO autores VALUES (74,'Carlos Augusto');
INSERT INTO autores VALUES (63,'Luana Stefany');
INSERT INTO autores VALUES (54,'Leticia Martins');
INSERT INTO autores VALUES (34,'Juliana Paes');
INSERT INTO autores VALUES (93,'Bruno Lima');
INSERT INTO autores VALUES (47,'Gabriel Henrique');
INSERT INTO livros_autores VALUES (1, 20);
INSERT INTO livros_autores VALUES (2, 41);
INSERT INTO livros_autores VALUES (3, 62);
INSERT INTO livros_autores VALUES (4, 81);
INSERT INTO livros_autores VALUES (5, 74);
INSERT INTO livros_autores VALUES (6, 63);
INSERT INTO livros_autores VALUES (7, 54);
INSERT INTO livros_autores VALUES (8, 34);
INSERT INTO livros_autores VALUES (9, 93);
INSERT INTO livros_autores VALUES (10, 47);

-- Letra A - Listar todos os livros e seus autores

SELECT livros.titulo, autores.nome_autor FROM (autores NATURAL INNER JOIN livros_autores)
INNER JOIN livros USING (id_isbn)

-- Letra B - Encontrar todos os livros escritos por um autor especifico 
SELECT livros.titulo, autores.nome_autor FROM (autores NATURAL INNER JOIN livros_autores)
INNER JOIN livros USING (id_isbn)
WHERE autores.nome_autor = 'Juliana Paes'

-- Letra C - Encontrar todos autores que escreveram um livro especifico  
SELECT autores.nome_autor, livros.titulo FROM (autores NATURAL INNER JOIN livros_autores)
INNER JOIN livros USING (id_isbn)
WHERE livros.titulo = 'o pequeno principe'

