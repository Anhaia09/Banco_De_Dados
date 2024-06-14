--****************************--
--         Preparação         --
--****************************--

-- Adicionar produtos que não foram comprados
INSERT INTO products (productname,brand,category,discount,price) VALUES
('impressora','hp','eletronicos',0.12,489.9),
('luminaria','ge','eletronicos',0.5,46.80),
('drone','dji','eletronico',0.12,9856.0)

SELECT * FROM products
SELECT * FROM clients


-- Cross join 
SELECT * FROM clients, products
SELECT * FROM products, clients
SELECT * FROM clients CROSS JOIN products

-- Inner Join(relaciona por PK/FK)
SELECT firstname, productname FROM clients INNER JOIN products 
ON clients.idclient = products.idclient
WHERE firstname = 'Rodrigo' OR firstname = 'rodrigo'

-- alternativos de Inner Join
SELECT * FROM clients INNER JOIN products USING (idclient)

SELECT * FROM clients NATURAL INNER JOIN products

--selecionando coluna de uma tabela especifica
SELECT clients.firstname, products.productname FROM clients INNER JOIN products USING (idclient)

--mantem intacta a tabela da esquerda
SELECT clients.firstname, products.productname FROM products LEFT JOIN clients USING (idclient)

--mantem intacta a tabela da direita
SELECT clients.firstname, products.productname FROM products RIGHT JOIN clients USING (idclient)

--mostra tudo da tabela
SELECT clients.firstname, products.productname FROM products FULL JOIN clients USING (idclient)


-- Exercicios:

-- 1. Quais clientes compraram produtos da categoria eletrônicos?
SELECT firstname, productname, category FROM clients INNER JOIN products 
ON clients.idclient = products.idclient
WHERE products.category = 'eletronicos'

-- 2. Quais clientes não compraram nenhum produto?
SELECT firstname, productname FROM clients FULL JOIN products 
ON clients.idclient = products.idclient
WHERE productname IS NULL

-- 3. Quais produtos não foram vendidos?
SELECT productname, idclient FROM products
WHERE idclient IS NULL

OU

SELECT products.productname FROM clients RIGHT JOIN products USING (idclient)
WHERE clients.firstname IS NULL


-- 4. Quais produtos Rodrigo comprou?
SELECT firstname,productname FROM clients INNER JOIN products USING (idclient)
WHERE clients.firstname = 'Rodrigo'

-- 5. Quais clientes compraram produtos da marca DELL?
SELECT firstname,productname,brand FROM clients INNER JOIN products USING (idclient)
WHERE products.brand = 'dell'
