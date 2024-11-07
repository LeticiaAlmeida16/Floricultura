-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17-Out-2024 às 15:49
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd_floricultura`
--
CREATE DATABASE IF NOT EXISTS `bd_floricultura` DEFAULT CHARACTER SET latin1 COLLATE utf8_general_ci;
USE `bd_floricultura`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cadastro_adm`
--

CREATE TABLE `cadastro_adm` (
  `telefone_adm` varchar(14) DEFAULT NULL,
  `email_adm` varchar(128) DEFAULT NULL,
  `cpf_adm` varchar(14) NOT NULL,
  `nome_adm` varchar(128) DEFAULT NULL,
  `senha_adm` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cadastro_cliente`
--

CREATE TABLE `cadastro_cliente` (
  `cpf_cliente` varchar(14) NOT NULL,
  `telefone_cliente` varchar(14) DEFAULT NULL,
  `nome_cliente` varchar(128) DEFAULT NULL,
  `email_cliente` varchar(128) DEFAULT NULL,
  `senha_cliente` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cadastro_vendedor`
--

CREATE TABLE `cadastro_vendedor` (
  `cpf_vendedor` varchar(14) NOT NULL,
  `telefone_vendedor` varchar(14) DEFAULT NULL,
  `nome_vendedor` varchar(128) DEFAULT NULL,
  `email_vendedor` varchar(128) DEFAULT NULL,
  `senha_vendedor` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `desconto`
--

CREATE TABLE `desconto` (
  `id_desconto` int(11) NOT NULL,
  `valor_desconto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `desconto_flor`
--

CREATE TABLE `desconto_flor` (
  `fk_desconto_id_desconto` int(11) DEFAULT NULL,
  `fk_estoque_flores_id_flor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoque_flores`
--

CREATE TABLE `estoque_flores` (
  `id_flor` int(11) NOT NULL,
  `nome_flor` varchar(128) DEFAULT NULL,
  `quantidade_flor` int(11) DEFAULT NULL,
  `preco_flor` float DEFAULT NULL,
  `imagem_flor` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `fk_cadastro_cliente_cpf_cliente` varchar(14) DEFAULT NULL,
  `fk_estoque_flores_id_flor` int(11) DEFAULT NULL,
  `fk_cadastro_vendedor_cpf_vendedor` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=utf8_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cadastro_adm`
--
ALTER TABLE `cadastro_adm`
  ADD PRIMARY KEY (`cpf_adm`);

--
-- Índices para tabela `cadastro_cliente`
--
ALTER TABLE `cadastro_cliente`
  ADD PRIMARY KEY (`cpf_cliente`);

--
-- Índices para tabela `cadastro_vendedor`
--
ALTER TABLE `cadastro_vendedor`
  ADD PRIMARY KEY (`cpf_vendedor`);

--
-- Índices para tabela `desconto`
--
ALTER TABLE `desconto`
  ADD PRIMARY KEY (`id_desconto`);

--
-- Índices para tabela `desconto_flor`
--
ALTER TABLE `desconto_flor`
  ADD KEY `FK_desconto_flor_1` (`fk_desconto_id_desconto`),
  ADD KEY `FK_desconto_flor_2` (`fk_estoque_flores_id_flor`);

--
-- Índices para tabela `estoque_flores`
--
ALTER TABLE `estoque_flores`
  ADD PRIMARY KEY (`id_flor`);

--
-- Índices para tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD KEY `FK_pedidos_1` (`fk_cadastro_cliente_cpf_cliente`),
  ADD KEY `FK_pedidos_2` (`fk_estoque_flores_id_flor`),
  ADD KEY `FK_pedidos_3` (`fk_cadastro_vendedor_cpf_vendedor`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `desconto_flor`
--
ALTER TABLE `desconto_flor`
  ADD CONSTRAINT `FK_desconto_flor_1` FOREIGN KEY (`fk_desconto_id_desconto`) REFERENCES `desconto` (`id_desconto`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_desconto_flor_2` FOREIGN KEY (`fk_estoque_flores_id_flor`) REFERENCES `estoque_flores` (`id_flor`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `FK_pedidos_1` FOREIGN KEY (`fk_cadastro_cliente_cpf_cliente`) REFERENCES `cadastro_cliente` (`cpf_cliente`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_pedidos_2` FOREIGN KEY (`fk_estoque_flores_id_flor`) REFERENCES `estoque_flores` (`id_flor`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_pedidos_3` FOREIGN KEY (`fk_cadastro_vendedor_cpf_vendedor`) REFERENCES `cadastro_vendedor` (`cpf_vendedor`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor, imagem_flor) VALUES (1, 'Rosa', 10, 2.50, 'img/rosa.jfif');
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor, imagem_flor) VALUES (2, 'Margarida', 15, 1.80, 'img/margarida.jfif');
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor, imagem_flor) VALUES (3, 'Girassol', 20, 3.00, 'img/girassol.jfif');
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor, imagem_flor) VALUES (4, 'Tulipa', 12, 2.20, 'img/tulipa.jfif');
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor, imagem_flor) VALUES (5, 'Lírio', 25, 4.00, 'img/lirio.jfif');
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor, imagem_flor) VALUES (6, 'Orquídea', 8, 5.50, 'img/orquidea.jfif');
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor, imagem_flor) VALUES (7, 'Cravo', 30, 2.00, 'img/cravo.jfif');
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor, imagem_flor) VALUES (8, 'Hibisco', 5, 3.50, 'img/hibisco.jfif');
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor, imagem_flor) VALUES (9, 'Jasmim', 18, 1.70, 'img/jasmim.jfif');
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor, imagem_flor) VALUES (10, 'Peônia', 10, 6.00, 'img/peonia.jfif');
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor, imagem_flor) VALUES (11, 'Dália', 22, 2.80, 'img/dalia.jfif');
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor, imagem_flor) VALUES (12, 'Magnólia', 7, 3.20, 'img/magnolia.jfif');
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor, imagem_flor) VALUES (13, 'Gerânio', 14, 1.90, 'img/geranio.jfif');
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor, imagem_flor) VALUES (14, 'Flor de Lótus', 6, 4.50, 'img/flor_de_lotus.jfif');
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor, imagem_flor) VALUES (15, 'Azaléia', 9, 3.00, 'img/azaleia.jfif');
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor, imagem_flor) VALUES (16, 'Camélia', 11, 2.40, 'img/camelia.jfif');
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor, imagem_flor) VALUES (17, 'Calêndula', 21, 1.50, 'img/calendula.jfif');
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor, imagem_flor) VALUES (18, 'Crisântemo', 13, 2.60, 'img/crisantemo.jfif');
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor, imagem_flor) VALUES (19, 'Flor de Maio', 19, 3.10, 'img/flor_de_maio.jfif');
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor, imagem_flor) VALUES (20, 'Flor de Cerejeira', 17, 4.00, 'img/flor_de_cerejeira.jfif');
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor, imagem_flor) VALUES (21, 'Flor de Azevinho', 4, 1.20, 'img/flor_de_azevinho.jfif');
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor, imagem_flor) VALUES (22, 'Flor de Jasmim', 16, 2.30, 'img/flor_de_jasmim.jfif');
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor, imagem_flor) VALUES (23, 'Flor de Cacto', 2, 2.00, 'img/flor_de_cacto.jfif');
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor, imagem_flor) VALUES (24, 'Flor de Anêmona', 3, 3.00, 'img/flor_de_anemona.jfif');
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor, imagem_flor) VALUES (25, 'Flor de Fuchsia', 9, 4.20, 'img/flor_de_fuchsia.jfif');
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor, imagem_flor) VALUES (26, 'Flor de Lantana', 12, 2.90, 'img/flor_de_lantana.jfif');
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor, imagem_flor) VALUES (27, 'Flor de Violeta', 8, 1.80, 'img/flor_de_violeta.jfif');
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor, imagem_flor) VALUES (28, 'Flor de Lavanda', 15, 2.70, 'img/flor_de_lavanda.jfif');
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor, imagem_flor) VALUES (29, 'Flor de Estrelítzia', 11, 3.60, 'img/flor_de_estrelitiza.jfif');
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor, imagem_flor) VALUES (30, 'Flor de Miosótis', 7, 1.90, 'img/flor_de_miosotis.jfif');
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (31, 'Flor de Gérbera', 20, 2.80);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (32, 'Flor de Alstroemeria', 18, 3.20);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (33, 'Flor de Dente de Leão', 14, 2.00);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (34, 'Flor de Narciso', 19, 2.90);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (35, 'Flor de Heliotrópio', 22, 3.50);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (36, 'Flor de Fúcsia', 3, 4.00);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (37, 'Flor de Lobélia', 4, 2.10);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (38, 'Flor de Cosmos', 5, 3.00);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (39, 'Flor de Sálvia', 6, 2.50);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (40, 'Flor de Bico-de-lacre', 10, 3.10);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (41, 'Flor de Petúnia', 11, 1.80);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (42, 'Flor de Gerbera', 12, 2.60);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (43, 'Flor de Xaxim', 8, 3.50);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (44, 'Flor de Camélia', 14, 2.40);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (45, 'Flor de Aster', 16, 1.90);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (46, 'Flor de Lírio-do-vale', 9, 4.50);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (47, 'Flor de Flor-de-lis', 10, 3.00);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (48, 'Flor de Figueira', 7, 2.70);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (49, 'Flor de Palma', 20, 1.80);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (50, 'Flor de Alecrim', 15, 2.40);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (51, 'Flor de Cebola', 13, 1.50);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (52, 'Flor de Suculenta', 11, 4.20);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (53, 'Flor de Begônia', 22, 3.00);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (54, 'Flor de Angélica', 9, 2.90);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (55, 'Flor de Zínia', 10, 1.80);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (56, 'Flor de Antúrio', 12, 4.00);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (57, 'Flor de Limoeiro', 3, 2.20);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (58, 'Flor de Capuchinha', 4, 3.10);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (59, 'Flor de Amor-perfeito', 5, 1.50);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (60, 'Flor de Calêndula', 6, 2.60);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (61, 'Flor de Nepenta', 2, 4.10);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (62, 'Flor de Dama-da-noite', 7, 3.00);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (63, 'Flor de Laranjeira', 10, 2.80);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (64, 'Flor de Açafrão', 15, 4.50);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (65, 'Flor de Malva', 11, 2.00);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (66, 'Flor de Peperômia', 9, 1.90);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (67, 'Flor de Acalifa', 12, 3.20);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (68, 'Flor de Amaryllis', 20, 5.00);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (69, 'Flor de Trevo', 8, 2.30);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (70, 'Flor de Coração-sangue', 16, 2.50);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (71, 'Flor de Sinfonia', 18, 3.00);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (72, 'Flor de Flor-de-maio', 13, 2.70);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (73, 'Flor de Crotalária', 19, 1.80);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (74, 'Flor de Escabiose', 21, 2.60);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (75, 'Flor de Cravina', 17, 2.90);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (76, 'Flor de Gardênia', 14, 4.00);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (77, 'Flor de Suculenta Verde', 12, 3.50);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (78, 'Flor de Pothos', 8, 1.80);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (79, 'Flor de Pansy', 15, 2.90);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (80, 'Flor de Trapoeraba', 10, 3.00);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (81, 'Flor de Falsa-azaleia', 4, 2.20);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (82, 'Flor de Flor-de-páscoa', 3, 2.60);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (83, 'Flor de Favo-de-mel', 6, 1.90);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (84, 'Flor de Heracleum', 2, 3.10);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (85, 'Flor de Papoila', 5, 2.40);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (86, 'Flor de Fritillária', 7, 4.50);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (87, 'Flor de Talinum', 13, 2.90);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (88, 'Flor de Rosinha', 9, 1.80);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (89, 'Flor de Salvia', 12, 3.30);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (90, 'Flor de Clívia', 10, 2.70);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (91, 'Flor de Pérgula', 15, 4.00);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (92, 'Flor de Espatódia', 11, 3.50);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (93, 'Flor de Calathea', 8, 1.90);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (94, 'Flor de Alocásia', 6, 4.10);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (95, 'Flor de Guzmânia', 7, 2.30);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (96, 'Flor de Canteiro', 10, 3.20);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (97, 'Flor de Crássula', 14, 2.50);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (98, 'Flor de Talinão', 11, 3.00);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (99, 'Flor de Monstera', 9, 4.50);
INSERT INTO estoque_flores (id_flor, nome_flor, quantidade_flor, preco_flor) VALUES (100, 'Flor de Tigridia', 12, 3.60);

INSERT INTO cadastro_vendedor (cpf_vendedor, telefone_vendedor, nome_vendedor, email_vendedor, senha_vendedor) VALUES ('458.256.156-09', '(11)91567-2033', 'Pigmeu Garcia', 'pigmeu.garcia@email.com', 'senha123');
INSERT INTO cadastro_vendedor (cpf_vendedor, telefone_vendedor, nome_vendedor, email_vendedor, senha_vendedor) VALUES ('124.701.218-69', '(11)91912-2207', 'França Bardella', 'franca.bardella@email.com', 'senha456');
INSERT INTO cadastro_vendedor (cpf_vendedor, telefone_vendedor, nome_vendedor, email_vendedor, senha_vendedor) VALUES ('427.566.812-13', '(11)99971-2510', 'Filha do Hoender Rodrigues', 'hoender.rodrigues@email.com', 'senha789');
INSERT INTO cadastro_vendedor (cpf_vendedor, telefone_vendedor, nome_vendedor, email_vendedor, senha_vendedor) VALUES ('462.903.475-96', '(11)95623-0789', 'Bolivia Gama', 'bolivia.gama@email.com', 'senha321');

INSERT INTO cadastro_adm (telefone_adm, email_adm, cpf_adm, nome_adm, senha_adm) VALUES ('(11)95243-9006', 'chefe.aumeidan@email.com', '529.160.128-00', 'Chefe Aumeidan', 'senhaAdmChefe');

INSERT INTO desconto (id_desconto, valor_desconto) VALUES (1, 5);
INSERT INTO desconto (id_desconto, valor_desconto) VALUES (2, 10);
INSERT INTO desconto (id_desconto, valor_desconto) VALUES (3, 15);
INSERT INTO desconto (id_desconto, valor_desconto) VALUES (4, 20);
INSERT INTO desconto (id_desconto, valor_desconto) VALUES (5, 25);
INSERT INTO desconto (id_desconto, valor_desconto) VALUES (6, 30);
INSERT INTO desconto (id_desconto, valor_desconto) VALUES (7, 35);
INSERT INTO desconto (id_desconto, valor_desconto) VALUES (8, 40);
INSERT INTO desconto (id_desconto, valor_desconto) VALUES (9, 45);
INSERT INTO desconto (id_desconto, valor_desconto) VALUES (10, 50);
INSERT INTO desconto (id_desconto, valor_desconto) VALUES (11, 55);
INSERT INTO desconto (id_desconto, valor_desconto) VALUES (12, 60);
INSERT INTO desconto (id_desconto, valor_desconto) VALUES (13, 65);
INSERT INTO desconto (id_desconto, valor_desconto) VALUES (14, 70);
INSERT INTO desconto (id_desconto, valor_desconto) VALUES (15, 75);
INSERT INTO desconto (id_desconto, valor_desconto) VALUES (16, 80);
INSERT INTO desconto (id_desconto, valor_desconto) VALUES (17, 85);
INSERT INTO desconto (id_desconto, valor_desconto) VALUES (18, 90);
INSERT INTO desconto (id_desconto, valor_desconto) VALUES (19, 95);
INSERT INTO desconto (id_desconto, valor_desconto) VALUES (20, 100);