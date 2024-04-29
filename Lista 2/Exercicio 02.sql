-- Criação da tabela cursos
CREATE TABLE cursos (
    id_curso VARCHAR(50) PRIMARY KEY,
    nome_curso VARCHAR(50)
);

-- Exibir dados da tabela cursos
SELECT * FROM cursos;

-- Criação da tabela turmas
CREATE TABLE turmas (
    id_turma VARCHAR(50) PRIMARY KEY,
    id_curso VARCHAR(50),
	nome_professor VARCHAR(50),
    CONSTRAINT fk_curso FOREIGN KEY(id_curso) REFERENCES cursos(id_curso)
);

-- Exibir dados da tabela turmas
SELECT * FROM turmas;

-- Criação da tabela alunos

CREATE TABLE alunos (
    id_aluno VARCHAR(50) PRIMARY KEY,
    nome_aluno VARCHAR(50),
	data_nasci date
);
SELECT * FROM alunos;

CREATE TABLE alunos_turmas(
    id_aluno VARCHAR(50),
    CONSTRAINT fk_aluno FOREIGN KEY(id_aluno) REFERENCES alunos(id_aluno),
    id_turma VARCHAR(50),
    CONSTRAINT fk_turma FOREIGN KEY(id_turma) REFERENCES turmas(id_turma)
);

SELECT * FROM alunos_turmas;

INSERT INTO cursos (id_curso, nome_curso) VALUES 
('C001', 'Engenharia Civil'),
('C002', 'Ciência da Computação'),
('C003', 'Administração'),
('C004', 'Psicologia'),
('C005', 'Direito'),
('C006', 'Medicina'),
('C007', 'Economia'),
('C008', 'Design Gráfico'),
('C009', 'Engenharia Elétrica'),
('C010', 'Arquitetura');

INSERT INTO turmas (id_turma, id_curso, nome_professor) VALUES 
('T001', 'C001', 'João da Silva'),
('T002', 'C002', 'Maria Oliveira'),
('T003', 'C003', 'Carlos Souza'),
('T004', 'C004', 'Ana Santos'),
('T005', 'C005', 'Luiza Pereira'),
('T006', 'C006', 'Pedro Almeida'),
('T007', 'C007', 'Juliana Costa'),
('T008', 'C008', 'Mariana Fernandes'),
('T009', 'C009', 'Lucas Rodrigues'),
('T010', 'C010', 'Camila Lima');

INSERT INTO alunos (id_aluno, nome_aluno, data_nasci) VALUES 
('A001', 'Ana Silva', '1998-05-15'),
('A002', 'Carlos Oliveira', '1997-09-20'),
('A003', 'João Souza', '1996-02-10'),
('A004', 'Maria Santos', '1995-07-30'),
('A005', 'Pedro Pereira', '1994-11-25'),
('A006', 'Luiza Almeida', '1993-04-05'),
('A007', 'Juliana Costa', '1992-08-12'),
('A008', 'Mariana Fernandes', '1991-03-18'),
('A009', 'Lucas Rodrigues', '1990-06-22'),
('A010', 'Camila Lima', '1989-10-08');

INSERT INTO alunos_turmas (id_aluno, id_turma) VALUES 
('A001', 'T003'),
('A002', 'T001'),
('A003', 'T002'),
('A004', 'T007'),
('A005', 'T005'),
('A006', 'T009'),
('A007', 'T008'),
('A008', 'T010'),
('A009', 'T004'),
('A010', 'T006');

-- Letra A - Listar todos os alunos matriculados em uma turma especifica

SELECT alunos.nome_aluno, turmas.id_turma FROM (turmas NATURAL INNER JOIN alunos_turmas)
INNER JOIN alunos USING (id_aluno)
WHERE turmas.id_turma = 'T004'

-- Letra B - Encontrar todos os cursos ministrados em uma turma especifica
SELECT cursos.nome_curso, turmas.id_turma FROM cursos 
INNER JOIN turmas ON cursos.id_curso = turmas.id_curso
WHERE turmas.id_turma = 'T005';

-- Letra C - Contar o número de alunos em cada turma.
SELECT 
    cursos.nome_curso, 
    turmas.id_turma,
    (SELECT COUNT(*) FROM alunos_turmas WHERE alunos_turmas.id_turma = turmas.id_turma) AS numero_alunos
FROM cursos 
INNER JOIN turmas ON cursos.id_curso = turmas.id_curso;





