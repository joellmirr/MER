-- Tabela modelo primaria, pois nao se relaciona com outra tabela
INSERT INTO clientes (id, cpf, nome, email, telefone, endereco)
VALUES
  ('1', '111.111.111-11', 'Joao', 'joao@email.com', '11 11111111', 'Rua A'),
  ('2', '222.222.222-22', 'Maria', 'maria@email.com', '22 22222222', 'Rua B'),
  ('3', '333.333.333-33', 'Pedro', 'pedro@email.com', '33 33333333', 'Av. C'),
  ('4', '444.444.444-44', 'Ana', 'ana@email.com', '44 44444444', 'Av. D'),
  ('5', '555.555.555-55', 'Carlos', 'carlos@email.com', '55 55555555', 'Rua E'),
  ('6', '666.666.666-66', 'Julia', 'julia@email.com', '66 66666666', 'Rua F'),
  ('7', '777.777.777-77', 'Marcos', 'marcos@email.com', '77 77777777', 'Av. G'),
  ('8', '888.888.888-88', 'Cristina', 'cristina@email.com', '88 88888888', 'Av. H');

------------------------------------------------------------------------------------------------------------------------
-- Tabela modelo primaria, pois nao se relaciona com outra tabela
INSERT INTO vendedores (id, cpf, nome, telefone, endereco, salario, comissao)
VALUES
  ('1', '9999999999', 'Fernanda', '99 99999999', 'Rua X', 5000, 0.1),
  ('2', '88888888888', 'Roberto', '88 88888888', 'Rua Y', 5500, 0.15),
  ('3', '77777777777', 'Carla', '77 77777777', 'Av. Z', 4800, 0.12),
  ('4', '66666666666', 'Daniel', '55 55555555', 'Rua W', 5200, 0.1),
  ('5', '55555555555', 'Gisele', '11 11111111’, 'Rua V', 5300, 0.13),
  ('6', '44444444444', 'Rafael', '33 33333333'', 'Av. U 4900, 0.11),
  ('7', '33333333333', 'Lucia', '33 33333333', 'Rua T', 5100, 0.14),
  ('8', '22222222222', 'Eduardo', '11 11111111', 'Rua S', 5400, 0.12);

------------------------------------------------------------------------------------------------------------------------
-- Tabela modelo  secundaria, pois esta realcionada a outra tabela
INSERT INTO pecas (id, descricao, preco, qtd_estoque, armazem)
VALUES
  ('1', 'Motor', 3000, 20, '1'),
  ('2', 'Freio', 500, 50, '2'),
  ('3', 'Farol', 200, 30, '3'),
  ('4', 'Bateria', 150, 40, '4'),
  ('5', 'Pneu', 1000, 25, '1'),
  ('6', 'Radiador', 800, 15, '2'),
  ('7', 'Amortecedor', 700, 35, '3'),
  ('8', 'Filtro de Óleo', 30, 60, '4');

--------------------------------------------------------------------------------------------------------------------------
-- Tabela modelo primaria, pois nao se relaciona com outra tabela
INSERT INTO armazens (id, endereco, telefone, gerente)
VALUES
  ('1', 'Rua A', '33 33333333', 'Carlos'),
  ('2', 'Rua B', '77 77777777, 'Fernanda'),
  ('3', 'Av. C', ‘55 55555555', 'Gustavo'),
  ('4', 'Av. D', '99 99999999', 'Maria');
  ('5', 'Av. E', '33 33333333', 'Mariana');
  ('6', 'Av. F', '55 55555555', 'Bia');
  ('7', 'Av. G', '99 99999999', 'Deniela');
  ('8', 'Av. H', '11 11111111’, 'Ludimila');
  
-----------------------------------------------------------------------------------------------------------------------------
-- Tabela fato, pois pedido acontece com data, hora e local
INSERT INTO pedidos (id, datahora, valor_total, meiopagamento, cliente, vendedor)
VALUES
  ('1', '05/02/2024 10:30:00', 35000, 'Cartão de Crédito', '1', '1'),
  ('2', '06/02/2024 12:45:00', 28000, 'Boleto Bancário', '1', '2'),
  ('3', '07/02/2024 15:20:00', 42000, 'Pix', '1', '3'),
  ('4', '08/02/2024 14:10:00', 50000, 'Dinheiro', '4', '4'),
  ('5', '09/02/2024 11:55:00', 38000, 'Cartão de Débito', '5', '5'),
  ('6', '10/02/2024 13:00:00', 20000, 'Pix', '6', '6'),
  ('7', '15/02/2024 15:00:00', 55000, 'Cartão de Débito', '7', '7'),
  ('8', '22/02/2024 16:00:00', 10000, 'Pix', '8', '8');

------------------------------------------------------------------------------------------------------------------------------
-- Tabela relacao, estabelece relacao entre as tabelas pedidos e pecas
INSERT INTO pedidospecas (id,pedido, peca, qtde)
VALUES
  ('1','1', '2', 2),
  ('2','2', '3', 3),
  ('3','3', '4', 1),
  ('4','5', '6', 2),
  ('5','7', '8', 2),
  ('6','9', '9', 1),
  ('7','4', '1', 3),
  ('8','6', '3', 1),
  ('9','8', '5', 2),
  ('10','1', '6', 1),
  ('11','1', '7', 2),
  ('12','5', '7', 2),
  ('13','6', '2', 1),
  ('14','8', '4', 3),
  ('15','9', '6', 2),
  ('16','3', '8', 2);
  
  /*

3. Crie um novo script com as seguintes consultas:
a) Mostrar o nome, o cpf e o telefone dos clientes por ordem alfabética.
b) Mostrar o nome e o salário dos vendedores, do maior salário para o menor salário.
c) Mostrar apenas as peças cuja quantidade em estoque seja inferior a 10, ordenado pela quantidade, da maior para a menor.
d) Mostrar os pedidos ordenados por data, da mais recente para a mais antiga.
e) Mostrar somente os pedidos pagos com o meio de pagamento cartão de crédito ou cartão de débito, ordenados pelo valor, do maior para o menor.
f) Mostrar somente os pedidos que não foram pagos em pix e que tenham ocorrido no mês de janeiro.
g) Mostrar todos os pedidos de um cliente.
h) Mostrar todas as peças de um pedido.

*/

a-
SELECT nome,cpf,telefone FROM Clientes ORDER BY nome ASC;

b-
SELECT nome,salario FROM Vendedores ORDER BY salario DESC;

c-
SELECT * FROM Pecas WHERE qtdestoque < 10 ORDER BY qtdestoque DESC;

d-
SELECT * FROM Pedidos ORDER BY datahora DESC;

e-
SELECT * FROM Pedidos WHERE meiopagamento IN ('Cartão de Crédito', 'Cartão de Débito') ORDER BY valortotal DESC;

f-
SELECT * FROM Pedidos WHERE NOT (meiopagamento = 'Pix' AND EXTRACT(MONTH FROM datahor) = '01');

g- 
SELECT * FROM Clientes;

h- 
SELECT * FROM Pedidos;
