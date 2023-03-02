CREATE SCHEMA lava_jato;

USE lava_jato;

CREATE TABLE cliente(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) NOT NULL,
    telefone CHAR(13) NOT NULL,
    endereco VARCHAR(80) NOT NULL
);

CREATE TABLE carro(
	id INT PRIMARY KEY AUTO_INCREMENT,
    marca VARCHAR(100) NOT NULL,
    placa VARCHAR(10) NOT NULL,
    cor VARCHAR(20) NOT NULL,
    modelo VARCHAR(20) NOT NULL
);

CREATE TABLE tipo_ducha(
	id INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(100) NOT NULL,
    valor DECIMAL(10, 2) NOT NULL
);

CREATE TABLE ducha(
	id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT NOT NULL,
    tipo_ducha_id INT NOT NULL,
    carro_id INT NOT NULL
);

INSERT INTO cliente (id, nome, cpf, telefone, endereco) VALUES
(NULL, 'Juliano Clemente', '84437626087', '6184437626087', 'Rua José Carvalho Cruz'),
(NULL, 'Cauê Guimarães', '55180167000', '6155180167000', 'Quadra Quadra 300 Conjunto 19'),
(NULL, 'Leonardo Sá', '40784258015', '6140784258015', 'Travessa Santa Rita'),
(NULL, 'Arnaldo Pereira', '70391758004', '6170391758004', 'Rua São Pedro');

INSERT INTO carro (id, marca, cor, placa, modelo) VALUES
(NULL, 'VW', 'branco', 'HRL-7371', 'gol'),
(NULL, 'VW', 'preto', 'DGK-3409', 'golf'),
(NULL, 'chevrolet', 'branco', 'JYN-7868', 'onix'),
(NULL, 'toyota', 'cinza', 'HEX-8080', 'hilux');

INSERT INTO tipo_ducha (id, tipo, valor) VALUES
(1, 'Lavagem a seco', '30.00'),
(2, 'Lavagem Americana', '50.00'),
(3, 'Lavagem com polimento', '80.00');

INSERT INTO ducha (id, cliente_id, tipo_ducha_id, carro_id) VALUES
(1, 1, 1, 2),
(2, 2, 2, 1),
(3, 3, 2, 3);

Selects:
2.1
SELECT d.id AS codigo_ducha, c.id AS codigo_cliente, c.nome AS cliente_nome FROM ducha AS d, cliente AS c
WHERE d.cliente_id = c.id;

2.2
SELECT d.id AS codigo_ducha, c.id AS carro_id, c.marca, c.placa, c.cor, c.modelo FROM ducha AS d, carro AS c
WHERE d.carro_id = c.id AND c.marca LIKE 'VW';

2.3
SELECT SUM(td.valor) FROM ducha AS d, tipo_ducha AS td
WHERE d.tipo_ducha_id = td.id AND td.tipo LIKE "lavagem americana";