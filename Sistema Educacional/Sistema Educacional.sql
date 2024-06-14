---------------------------------------Comandos DDL-------------------------------------------------------

-- Criação da tabela alunos
CREATE TABLE alunos (
	cpf varchar(20) PRIMARY KEY,
    nome_aluno varchar(50) not null,
    idade int,
    rua text,
    numero varchar(10),
    bairro varchar(20),
	cidade varchar(20),
	estado varchar(20),
	cep varchar(20),
	pais varchar(20)
);

-- Criação da tabela departamentos
CREATE TABLE departamentos (
	id_depto int PRIMARY KEY,
	nome_depto varchar (20)
);


-- Criação da tabela disciplinas
CREATE TABLE disciplinas (
	id_disciplina int PRIMARY KEY,
    nome_disciplina varchar(50),
    optativa varchar(10)
);

--Criação da tabela contato
CREATE TABLE contatos (
	cpf varchar(20),
	CONSTRAINT fk_alunos FOREIGN KEY(cpf) REFERENCES alunos(cpf),
    numero varchar(20),
    ddd int
);

--Criação da tabela cursos
CREATE TABLE cursos (
	id_curso int PRIMARY KEY,
	nome_curso varchar(50),
	id_depto int, 
	CONSTRAINT fk_departamentos FOREIGN KEY(id_depto) REFERENCES departamentos(id_depto)
	
);

--Criação da tabela matricula
CREATE TABLE matriculas(
	ra varchar(20) PRIMARY KEY,
	cpf varchar(20),
	CONSTRAINT fk_alunos FOREIGN KEY(cpf) REFERENCES alunos(cpf),
	status varchar(20),
	id_curso int, 
	CONSTRAINT fk_cursos FOREIGN KEY(id_curso) REFERENCES cursos(id_curso)
);

--Criação da tabela matricula_disciplina
CREATE TABLE matriculas_disciplinas(
	ra varchar(20),
	CONSTRAINT fk_matriculas FOREIGN KEY(ra) REFERENCES matriculas(ra),
	id_disciplina int,
	CONSTRAINT fk_disciplinas FOREIGN KEY(id_disciplina) REFERENCES disciplinas(id_disciplina)	
);

--Criação da tabela curso_disciplina
CREATE TABLE cursos_disciplinas(
	id_curso int,
	CONSTRAINT fk_cursos FOREIGN KEY(id_curso) REFERENCES cursos(id_curso),
	id_disciplina int,
	CONSTRAINT fk_disciplinas FOREIGN KEY(id_disciplina) REFERENCES disciplinas(id_disciplina)	
);


---------------------------------------Comandos DML-------------------------------------------------------

--Tabela alunos
INSERT INTO alunos (cpf, nome_aluno, idade, rua, numero, bairro, cidade, estado, cep, pais) VALUES
('123.456.789-10', 'João Silva', 25, 'Rua da Amizade', 123, 'Centro', 'São Paulo', 'SP', '01234-567', 'Brasil'),
('987.654.321-98', 'Maria Santos', 22, 'Avenida da Liberdade', 456, 'Jardins', 'Rio de Janeiro', 'RJ', '04567-890', 'Brasil'),
('456.789.123-00', 'Carlos Oliveira', 30, 'Rua das Flores', 789, 'Barra', 'Salvador', 'BA', '07890-123', 'Brasil'),
('321.654.987-32', 'Ana Pereira', 28, 'Rua do Sol', 234, 'Copacabana', 'Rio de Janeiro', 'RJ', '02345-678', 'Brasil'),
('789.123.456-54', 'Pedro Rodrigues', 24, 'Avenida Principal', 567, 'Centro', 'Porto Alegre', 'RS', '05678-901', 'Brasil'),
('234.567.890-76', 'Camila Oliveira', 27, 'Rua das Palmeiras', 890, 'Vila Nova', 'Curitiba', 'PR', '08901-234', 'Brasil'),
('654.321.987-09', 'Paula Costa', 29, 'Avenida dos Girassóis', 1234, 'Jardim América', 'Goiânia', 'GO', '12345-678', 'Brasil'),
('890.123.456-32', 'Lucas Souza', 26, 'Rua da Paz', 5678, 'Boa Vista', 'Manaus', 'AM', '56789-012', 'Brasil'),
('123.987.456-65', 'Juliana Almeida', 31, 'Rua das Árvores', 9012, 'Ponta Negra', 'Natal', 'RN', '90123-456', 'Brasil'),
('789.654.321-98', 'Fernando Santos', 23, 'Avenida Central', 3456, 'Centro', 'Fortaleza', 'CE', '34567-890', 'Brasil'),
('456.234.567-01', 'Mariana Lima', 26, 'Rua das Estrelas', 7890, 'Jardim Botânico', 'Brasília', 'DF', '78901-234', 'Brasil'),
('321.789.654-34', 'Rafaela Pereira', 28, 'Avenida da Praia', 12345, 'Copacabana', 'Rio de Janeiro', 'RJ', '23456-789', 'Brasil'),
('987.456.123-76', 'Gustavo Silva', 25, 'Rua dos Coqueiros', 6789, 'Barra da Tijuca', 'Rio de Janeiro', 'RJ', '67890-123', 'Brasil'),
('654.890.123-09', 'Diego Oliveira', 30, 'Avenida das Rosas', 23456, 'Jardim São Paulo', 'Recife', 'PE', '23456-789', 'Brasil'),
('234.321.654-32', 'Amanda Santos', 22, 'Rua das Margaridas', 78901, 'Centro', 'Florianópolis', 'SC', '34567-890', 'Brasil'),
('890.987.654-65', 'Marcos Costa', 29, 'Avenida dos Ipês', 12345, 'Alphaville', 'Barueri', 'SP', '45678-901', 'Brasil'),
('123.456.789-98', 'Carolina Souza', 27, 'Rua das Violetas', 67890, 'Bela Vista', 'Campinas', 'SP', '56789-012', 'Brasil'),
('789.123.456-01', 'Bruno Almeida', 24, 'Avenida das Orquídeas', 23456, 'Centro', 'São José dos Campos', 'SP', '12345-678', 'Brasil'),
('456.789.123-34', 'Fernanda Oliveira', 31, 'Rua dos Lírios', 78901, 'Boa Viagem', 'Recife', 'PE', '90123-456', 'Brasil'),
('654.321.987-76', 'Rodrigo Lima', 23, 'Avenida dos Cravos', 1234, 'Jardim das Flores', 'Campinas', 'SP', '67890-123', 'Brasil');


--Tabela contatos
INSERT INTO contatos (cpf, numero, ddd) VALUES
('123.456.789-10', '1122334455', '11'),
('987.654.321-98', '9988776655', '21'),
('456.789.123-00', '3344556677', '71'),
('321.654.987-32', '4455667788', '21'),
('789.123.456-54', '5566778899', '51'),
('234.567.890-76', '6677889900', '41'),
('654.321.987-09', '7788990011', '62'),
('890.123.456-32', '8899001122', '92'),
('123.987.456-65', '9900112233', '84'),
('789.654.321-98', '0011223344', '31'),
('456.234.567-01', '1122334455', '61'),
('321.789.654-34', '9988776655', '21'),
('987.456.123-76', '3344556677', '21'),
('654.890.123-09', '4455667788', '81'),
('234.321.654-32', '5566778899', '48'),
('890.987.654-65', '6677889900', '11'),
('123.456.789-98', '7788990011', '19'),
('789.123.456-01', '8899001122', '12'),
('456.789.123-34', '9900112233', '81'),
('654.321.987-76', '0011223344', '19');


--Tabela matriculas
INSERT INTO matriculas (ra, cpf, status, id_curso) VALUES
('2024001', '123.456.789-10', 'cursando', 10),
('2024002', '987.654.321-98', 'formado', 20),
('2024003', '456.789.123-00', 'cursando', 30),
('2024004', '321.654.987-32', 'matrícula trancada', 70),
('2024005', '789.123.456-54', 'cursando', 40),
('2024006', '234.567.890-76', 'formado', 50),
('2024007', '654.321.987-09', 'cursando', 60),
('2024008', '890.123.456-32', 'matrícula trancada', 10),
('2024009', '123.987.456-65', 'cursando', 70),
('2024010', '789.654.321-98', 'cursando', 80),
('2024011', '456.234.567-01', 'cursando', 40),
('2024012', '321.789.654-34', 'formado', 20),
('2024013', '987.456.123-76', 'cursando', 70),
('2024014', '654.890.123-09', 'matrícula trancada',50),
('2024015', '234.321.654-32', 'cursando', 10),
('2024016', '890.987.654-65', 'cursando', 30),
('2024017', '123.456.789-98', 'formado', 60),
('2024018', '789.123.456-01', 'cursando', 80),
('2024019', '456.789.123-34', 'cursando', 20),
('2024020', '654.321.987-76', 'matrícula trancada', 50);

--Tabela cursos
INSERT INTO cursos (id_curso, nome_curso, id_depto) VALUES
(10, 'Medicina', 01),
(20, 'Enfermagem', 01),
(30, 'Ciência da Computação', 02),
(40, 'Engenharia de Software', 02),
(50, 'Engenharia Civil', 03),
(60, 'Engenharia Elétrica', 03),
(70, 'Psicologia', 04),
(80, 'História', 04);


--Tabela departamentos
INSERT INTO departamentos (id_depto, nome_depto) VALUES 
  (01, 'Saúde'),
  (02, 'Tecnologia'),
  (03, 'Engenharia'),
  (04, 'Humanas');
  
--Tabela disciplinas
  INSERT INTO disciplinas (id_disciplina, nome_disciplina, optativa) VALUES 
  (121, 'Fisiologia Humana', 'Sim'), 
  (122, 'Microbiologia', 'Não'),
  (123, 'Desenvolvimento de Software', 'Sim'),
  (124, 'Inteligência Artificial', 'Não'),
  (125, 'Mecânica dos Fluidos', 'Sim'),
  (126, 'Termodinâmica', 'Não'),
  (127, 'Antropologia Cultural', 'Sim'),
  (128, 'Economia Política', 'Não'),
  (129,'Fisiologia do Exercício','Sim'),     
  (130, 'Bioquímica Clínica', 'Não'),           
  (131, 'Web Design', 'Sim'),                   
  (132, 'Banco de Dados Avançado', 'Não'),       
  (133, 'Engenharia de Controle', 'Sim'),       
  (134, 'Eletromagnetismo', 'Não'),              
  (135, 'História Medieval', 'Sim'),             
  (136, 'Filosofia da Ciência', 'Não'),        
  (137, 'Fisioterapia Esportiva', 'Sim'),         
  (138, 'Farmacologia', 'Não'),                  
  (139, 'Desenvolvimento de Jogos', 'Sim'),      
  (140, 'Segurança da Informação', 'Não');
  

--Tabela matriculas_disciplinas
INSERT INTO matriculas_disciplinas (ra, id_disciplina) VALUES
('2024001', 121),
('2024002', 122),
('2024003', 123),
('2024004', 124),
('2024005', 125),
('2024006', 126),
('2024007', 127),
('2024008', 128),
('2024009', 129),
('2024010', 130),
('2024011', 131),
('2024012', 132),
('2024013', 133),
('2024014', 134),
('2024015', 135),
('2024016', 136),
('2024017', 137),
('2024018', 138),
('2024019', 139),
('2024020', 140);

--Tabela cursos_disciplinas
INSERT INTO cursos_disciplinas (id_curso,id_disciplina) VALUES
(10,121),
(20,121),
(10,122),
(20,122),
(30,123),
(40,123),
(30,124),
(40,124),
(50,125),
(60,125),
(50,126),
(60,126),
(70,127),
(80,127),
(70,128),
(80,128),
(10,129),
(20,129),
(10,130),
(20,130),
(30,131),
(40,131),
(30,132),
(40,132),
(50,133),
(60,133),
(50,134),
(60,134),
(70,135),
(80,135),
(70,136),
(80,136),
(10,137),
(20,137),
(10,138),
(20,138),
(30,139),
(40,139),
(30,140),
(40,140);

---------------------------------------Comandos DQL-------------------------------------------------------

SELECT * FROM alunos
SELECT * FROM contatos
SELECT * FROM matriculas
SELECT * FROM disciplinas
SELECT * FROM cursos
SELECT * FROM departamentos
SELECT * FROM matriculas_disciplinas
SELECT * FROM cursos_disciplinas
 

--Dado o RA ou o Nome do Aluno, buscar no BD todos os demais dados do aluno.
SELECT * FROM (matriculas INNER JOIN alunos USING (cpf)) INNER JOIN contatos USING (cpf) 
WHERE nome_aluno = 'Ana Pereira';


--Dado o nome de um departamento, exibir o nome de todos os cursos associados a ele.
SELECT cursos.nome_curso FROM cursos
INNER JOIN departamentos ON cursos.id_depto = departamentos.id_depto
WHERE departamentos.nome_depto = 'Tecnologia';


--Dado o nome de uma disciplina, exibir a qual ou quais cursos ela pertence.

SELECT nome_curso FROM cursos_disciplinas 
INNER JOIN cursos ON cursos_disciplinas.id_curso = cursos.id_curso 
INNER JOIN disciplinas ON cursos_disciplinas.id_disciplina = disciplinas.id_disciplina 
WHERE nome_disciplina = 'Fisiologia Humana';


--Dado o CPF de um aluno, exibir quais disciplinas ele está cursando.
SELECT disciplinas.nome_disciplina FROM matriculas 
INNER JOIN matriculas_disciplinas ON matriculas.ra = matriculas_disciplinas.ra 
INNER JOIN disciplinas ON matriculas_disciplinas.id_disciplina = disciplinas.id_disciplina 
WHERE matriculas.cpf = '456.789.123-00';

--Filtrar todos os alunos matriculados em um determinado curso.

SELECT nome_aluno,status FROM (cursos NATURAL INNER JOIN matriculas)
NATURAL INNER JOIN alunos
WHERE nome_curso = 'Engenharia Civil'


--Filtrar todos os alunos matriculados em determinada disciplina.

SELECT alunos.nome_aluno FROM alunos 
INNER JOIN matriculas ON alunos.cpf = matriculas.cpf 
INNER JOIN matriculas_disciplinas ON matriculas.ra = matriculas_disciplinas.ra 
INNER JOIN disciplinas ON matriculas_disciplinas.id_disciplina = disciplinas.id_disciplina 
WHERE disciplinas.nome_disciplina = 'Microbiologia';


--Filtrar alunos formados.
SELECT nome_aluno FROM alunos WHERE cpf IN (SELECT cpf FROM matriculas WHERE status = 'formado');


--Filtrar alunos ativos.
SELECT nome_aluno FROM alunos WHERE cpf IN (SELECT cpf FROM matriculas WHERE status = 'cursando');


--Apresentar a quantidade de alunos ativos por curso.

SELECT cursos.nome_curso, COUNT(alunos.cpf) AS quantidade_alunos_ativos FROM cursos 
INNER JOIN matriculas ON cursos.id_curso = matriculas.id_curso 
INNER JOIN alunos ON matriculas.cpf = alunos.cpf 
WHERE matriculas.status = 'cursando' 
GROUP BY cursos.nome_curso;



--Apresentar a quantidade de alunos ativos por disciplina.
SELECT disciplinas.nome_disciplina, COUNT(alunos.cpf) AS quantidade_alunos_ativos FROM disciplinas 
INNER JOIN matriculas_disciplinas ON disciplinas.id_disciplina = matriculas_disciplinas.id_disciplina 
INNER JOIN matriculas ON matriculas_disciplinas.ra = matriculas.ra 
INNER JOIN alunos ON matriculas.cpf = alunos.cpf 
WHERE matriculas.status = 'cursando' 
GROUP BY disciplinas.nome_disciplina;

  

  