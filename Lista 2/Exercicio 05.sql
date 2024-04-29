CREATE TABLE departamento (
    id_depto varchar(100) PRIMARY KEY,
    nome_depto varchar(100)
);

SELECT * FROM departamento

CREATE TABLE funcionario (
    id_func serial PRIMARY KEY,
    id_depto varchar(100),
    nome_func varchar(100),
    data_adm date,
    cargo varchar(100),
    CONSTRAINT fk_departamento FOREIGN KEY(id_depto) REFERENCES departamento(id_depto)
);

SELECT * FROM funcionario

INSERT INTO departamento (id_depto, nome_depto) VALUES 
('D001', 'RH'),
('D002', 'Financeiro'),
('D003', 'TI'),
('D004', 'Marketing'),
('D005', 'Operações'),
('D006', 'Vendas'),
('D007', 'Produção'),
('D008', 'Logística'),
('D009', 'Jurídico'),
('D010', 'Administração');

INSERT INTO funcionario (id_func, id_depto, nome_func, data_adm, cargo) VALUES 
(1, 'D004', 'João da Silva', '2022-01-01', 'Gerente'),
(2, 'D006', 'Maria Oliveira', '2022-01-02', 'Analista de vendas'),
(3, 'D008', 'Carlos Souza', '2022-01-03', 'Gerente'),
(4, 'D010', 'Ana Santos', '2022-01-04', 'Assistente Administrativo'),
(5, 'D002', 'Luiza Pereira', '2022-01-05', 'Analista Financeiro'),
(6, 'D005', 'Pedro Almeida', '2022-01-06', 'Gerente'),
(7, 'D001', 'Juliana Costa', '2022-01-07', 'Analista de RH'),
(8, 'D003', 'Marcos Fernandes', '2022-01-08', 'Gerente'),
(9, 'D007', 'Gustavo Rodrigues', '2022-01-09', 'Auxiliar de produção'),
(10,'D008','Mariana Lima', '2022-01-10', 'Gerente');


-- Letra A (Listar todos os funcionários de um departamento específico.)
SELECT funcionario.nome_func, departamento.nome_depto 
FROM departamento 
INNER JOIN funcionario ON departamento.id_depto = funcionario.id_depto 
WHERE departamento.nome_depto = 'TI';

-- Letra B (Encontrar o departamento em que um funcionário específico trabalha.)
SELECT departamento.nome_depto
FROM departamento
INNER JOIN funcionario ON departamento.id_depto = funcionario.id_depto
WHERE funcionario.nome_func = 'João da Silva';

-- Letra C (Calcular o número total de funcionários gerenciados por cada gerente.)
SELECT gerente.nome_func AS nome_gerente, COUNT(funcionario.id_func) AS total_funcionarios
FROM funcionario AS gerente
INNER JOIN funcionario ON gerente.id_depto = funcionario.id_depto
GROUP BY gerente.nome_func;



