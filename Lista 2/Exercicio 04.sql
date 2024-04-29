CREATE TABLE paciente (
    cpf VARCHAR(50) PRIMARY KEY,
    nome_paciente VARCHAR(50),
    data_nascimento VARCHAR(50)
);

-- Exibir dados da tabela paciente
SELECT * FROM paciente;

-- Criação da tabela médico
CREATE TABLE medico (
    CRM VARCHAR(50) PRIMARY KEY,
    nome_medico VARCHAR(50),
    especialidade VARCHAR(50)
);

-- Exibir dados da tabela médico
SELECT * FROM medico;

-- Criação da tabela consulta
CREATE TABLE consulta (
    id_consultorio SERIAL PRIMARY KEY,
    id_paciente VARCHAR(50),
    CRM VARCHAR(50),
    data_consulta VARCHAR(50),
    CONSTRAINT fk_paciente FOREIGN KEY(id_paciente) REFERENCES paciente(cpf),
    CONSTRAINT fk_medico FOREIGN KEY(CRM) REFERENCES medico(CRM)
);

-- Exibir dados da tabela consulta
SELECT * FROM consulta;

-- Inserção de valores na tabela paciente
INSERT INTO paciente VALUES 
('11122233344', 'Rafaela Silva', '02/03/1990'),
('22233344455', 'Fernanda Oliveira', '10/08/1985'),
('33344455566', 'Gustavo Souza', '20/05/1978'),
('44455566677', 'Patrícia Santos', '15/11/1992'),
('55566677788', 'Roberto Pereira', '28/07/1983'),
('66677788899', 'Isabela Almeida', '03/04/1976'),
('77788899900', 'Larissa Costa', '22/09/1989'),
('88899900011', 'Henrique Fernandes', '09/12/1974'),
('99900011122', 'Daniela Rodrigues', '05/06/1996'),
('00011122233', 'Marcela Lima', '18/10/1980');

-- Inserção de valores na tabela médico
INSERT INTO medico VALUES 
('11111', 'Dr. Rafael', 'Cirurgião Geral'),
('22222', 'Dra. Fernanda', 'Oncologista'),
('33333', 'Dr. Gustavo', 'Urologista'),
('44444', 'Dra. Patrícia', 'Pneumologista'),
('55555', 'Dr. Roberto', 'Nefrologista'),
('66666', 'Dra. Isabela', 'Nutricionista'),
('77777', 'Dr. Larissa', 'Fisioterapeuta'),
('88888', 'Dra. Henrique', 'Otorrinolaringologista'),
('99999', 'Dr. Daniela', 'Radiologista'),
('00000', 'Dra. Marcela', 'Reumatologista');

-- Inserção de valores na tabela consulta
INSERT INTO consulta VALUES 
('11', '11122233344', '33333', '2024-03-30'),
('22', '22233344455', '55555', '2024-03-31'),
('33', '33344455566', '11111', '2024-04-01'),
('44', '44455566677', '44444', '2024-04-02'),
('55', '55566677788', '22222', '2024-04-03'),
('66', '66677788899', '00000', '2024-04-04'),
('77', '77788899900', '77777', '2024-04-05'),
('88', '88899900011', '99999', '2024-04-06'),
('99', '99900011122', '88888', '2024-04-07'),
('00', '00011122233', '66666', '2024-04-08');


-- Letra A (Listar todos os pacientes de um médico específico.)
SELECT paciente.nome_paciente, medico.nome_medico
FROM medico 
INNER JOIN consulta ON medico.crm = consulta.crm 
INNER JOIN paciente ON consulta.id_paciente = paciente.cpf 
WHERE medico.nome_medico = 'Dra. Isabela';

-- Letra B (Encontrar todos os médicos de um paciente específico.)
SELECT medico.nome_medico ,paciente.nome_paciente
FROM consulta
INNER JOIN medico ON medico.crm = consulta.crm 
INNER JOIN paciente ON consulta.id_paciente = paciente.cpf 
WHERE paciente.nome_paciente = 'Larissa Costa';

-- Letra C (Contar o número médio de pacientes por médico.)
SELECT AVG(numero_pacientes) AS media_pacientes_por_medico
FROM (
    SELECT CRM, COUNT(id_paciente) AS numero_pacientes
    FROM consulta
    GROUP BY CRM
) AS subquery;


