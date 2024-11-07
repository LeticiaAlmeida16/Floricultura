-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 07/11/2024 às 15:34
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

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

-- --------------------------------------------------------

--
-- Estrutura para tabela `cadastro_adm`
--

CREATE TABLE `cadastro_adm` (
  `telefone_adm` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email_adm` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cpf_adm` varchar(14) NOT NULL,
  `nome_adm` varchar(128) DEFAULT NULL,
  `senha_adm` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `cadastro_adm`
--

INSERT INTO `cadastro_adm` (`telefone_adm`, `email_adm`, `cpf_adm`, `nome_adm`, `senha_adm`) VALUES
('(11)95243-9006', 'chefe.aumeidan@email.com', '529.160.128-00', 'Chefe Aumeidan', 'senhaAdmChefe');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cadastro_cliente`
--

CREATE TABLE `cadastro_cliente` (
  `cpf_cliente` varchar(14) NOT NULL,
  `telefone_cliente` varchar(14) DEFAULT NULL,
  `nome_cliente` varchar(128) DEFAULT NULL,
  `email_cliente` varchar(128) DEFAULT NULL,
  `senha_cliente` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cadastro_vendedor`
--

CREATE TABLE `cadastro_vendedor` (
  `cpf_vendedor` varchar(14) NOT NULL,
  `telefone_vendedor` varchar(14) DEFAULT NULL,
  `nome_vendedor` varchar(128) DEFAULT NULL,
  `email_vendedor` varchar(128) DEFAULT NULL,
  `senha_vendedor` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `cadastro_vendedor`
--

INSERT INTO `cadastro_vendedor` (`cpf_vendedor`, `telefone_vendedor`, `nome_vendedor`, `email_vendedor`, `senha_vendedor`) VALUES
('124.701.218-69', '(11)91912-2207', 'França Bardella', 'franca.bardella@email.com', 'senha456'),
('427.566.812-13', '(11)99971-2510', 'Filha do Hoender Rodrigues', 'hoender.rodrigues@email.com', 'senha789'),
('458.256.156-09', '(11)91567-2033', 'Pigmeu Garcia', 'pigmeu.garcia@email.com', 'senha123'),
('462.903.475-96', '(11)95623-0789', 'Bolivia Gama', 'bolivia.gama@email.com', 'senha321');

-- --------------------------------------------------------

--
-- Estrutura para tabela `desconto`
--

CREATE TABLE `desconto` (
  `id_desconto` int(11) NOT NULL,
  `valor_desconto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `desconto`
--

INSERT INTO `desconto` (`id_desconto`, `valor_desconto`) VALUES
(1, 5),
(2, 10),
(3, 15),
(4, 20),
(5, 25),
(6, 30),
(7, 35),
(8, 40),
(9, 45),
(10, 50),
(11, 55),
(12, 60),
(13, 65),
(14, 70),
(15, 75),
(16, 80),
(17, 85),
(18, 90),
(19, 95),
(20, 100);

-- --------------------------------------------------------

--
-- Estrutura para tabela `desconto_flor`
--

CREATE TABLE `desconto_flor` (
  `fk_desconto_id_desconto` int(11) DEFAULT NULL,
  `fk_estoque_flores_id_flor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `estoque_flores`
--

CREATE TABLE `estoque_flores` (
  `id_flor` int(11) NOT NULL,
  `nome_flor` varchar(128) DEFAULT NULL,
  `quantidade_flor` int(11) DEFAULT NULL,
  `preco_flor` float DEFAULT NULL,
  `imagem_flor` varchar(340) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `estoque_flores`
--

INSERT INTO `estoque_flores` (`id_flor`, `nome_flor`, `quantidade_flor`, `preco_flor`, `imagem_flor`) VALUES
(1, 'Rosa', 10, 2.5, 'imgs/teste.png'),
(2, 'Margarida', 15, 1.8, 'imgs/teste.png'),
(3, 'Girassol', 20, 3, NULL),
(4, 'Tulipa', 12, 2.2, NULL),
(5, 'Lírio', 25, 4, NULL),
(6, 'Orquídea', 8, 5.5, NULL),
(7, 'Cravo', 30, 2, NULL),
(8, 'Hibisco', 5, 3.5, NULL),
(9, 'Jasmim', 18, 1.7, NULL),
(10, 'Peônia', 10, 6, NULL),
(11, 'Dália', 22, 2.8, NULL),
(12, 'Magnólia', 7, 3.2, NULL),
(13, 'Gerânio', 14, 1.9, NULL),
(14, 'Flor de Lótus', 6, 4.5, NULL),
(15, 'Azaléia', 9, 3, NULL),
(16, 'Camélia', 11, 2.4, NULL),
(17, 'Calêndula', 21, 1.5, NULL),
(18, 'Crisântemo', 13, 2.6, NULL),
(19, 'Flor de Maio', 19, 3.1, NULL),
(20, 'Flor de Cerejeira', 17, 4, NULL),
(21, 'Flor de Azevinho', 4, 1.2, NULL),
(22, 'Flor de Jasmim', 16, 2.3, NULL),
(23, 'Flor de Cacto', 2, 2, NULL),
(24, 'Flor de Anêmona', 3, 3, NULL),
(25, 'Flor de Fuchsia', 9, 4.2, NULL),
(26, 'Flor de Lantana', 12, 2.9, NULL),
(27, 'Flor de Violeta', 8, 1.8, NULL),
(28, 'Flor de Lavanda', 15, 2.7, NULL),
(29, 'Flor de Estrelítzia', 11, 3.6, NULL),
(30, 'Flor de Miosótis', 7, 1.9, NULL),
(31, 'Flor de Gérbera', 20, 2.8, NULL),
(32, 'Flor de Alstroemeria', 18, 3.2, NULL),
(33, 'Flor de Dente de Leão', 14, 2, NULL),
(34, 'Flor de Narciso', 19, 2.9, NULL),
(35, 'Flor de Heliotrópio', 22, 3.5, NULL),
(36, 'Flor de Fúcsia', 3, 4, NULL),
(37, 'Flor de Lobélia', 4, 2.1, NULL),
(38, 'Flor de Cosmos', 5, 3, NULL),
(39, 'Flor de Sálvia', 6, 2.5, NULL),
(40, 'Flor de Bico-de-lacre', 10, 3.1, NULL),
(41, 'Flor de Petúnia', 11, 1.8, NULL),
(42, 'Flor de Gerbera', 12, 2.6, NULL),
(43, 'Flor de Xaxim', 8, 3.5, NULL),
(44, 'Flor de Camélia', 14, 2.4, NULL),
(45, 'Flor de Aster', 16, 1.9, NULL),
(46, 'Flor de Lírio-do-vale', 9, 4.5, NULL),
(47, 'Flor de Flor-de-lis', 10, 3, NULL),
(48, 'Flor de Figueira', 7, 2.7, NULL),
(49, 'Flor de Palma', 20, 1.8, NULL),
(50, 'Flor de Alecrim', 15, 2.4, NULL),
(51, 'Flor de Cebola', 13, 1.5, NULL),
(52, 'Flor de Suculenta', 11, 4.2, NULL),
(53, 'Flor de Begônia', 22, 3, NULL),
(54, 'Flor de Angélica', 9, 2.9, NULL),
(55, 'Flor de Zínia', 10, 1.8, NULL),
(56, 'Flor de Antúrio', 12, 4, NULL),
(57, 'Flor de Limoeiro', 3, 2.2, NULL),
(58, 'Flor de Capuchinha', 4, 3.1, NULL),
(59, 'Flor de Amor-perfeito', 5, 1.5, NULL),
(60, 'Flor de Calêndula', 6, 2.6, NULL),
(61, 'Flor de Nepenta', 2, 4.1, NULL),
(62, 'Flor de Dama-da-noite', 7, 3, NULL),
(63, 'Flor de Laranjeira', 10, 2.8, NULL),
(64, 'Flor de Açafrão', 15, 4.5, NULL),
(65, 'Flor de Malva', 11, 2, NULL),
(66, 'Flor de Peperômia', 9, 1.9, NULL),
(67, 'Flor de Acalifa', 12, 3.2, NULL),
(68, 'Flor de Amaryllis', 20, 5, NULL),
(69, 'Flor de Trevo', 8, 2.3, NULL),
(70, 'Flor de Coração-sangue', 16, 2.5, NULL),
(71, 'Flor de Sinfonia', 18, 3, NULL),
(72, 'Flor de Flor-de-maio', 13, 2.7, NULL),
(73, 'Flor de Crotalária', 19, 1.8, NULL),
(74, 'Flor de Escabiose', 21, 2.6, NULL),
(75, 'Flor de Cravina', 17, 2.9, NULL),
(76, 'Flor de Gardênia', 14, 4, NULL),
(77, 'Flor de Suculenta Verde', 12, 3.5, NULL),
(78, 'Flor de Pothos', 8, 1.8, NULL),
(79, 'Flor de Pansy', 15, 2.9, NULL),
(80, 'Flor de Trapoeraba', 10, 3, NULL),
(81, 'Flor de Falsa-azaleia', 4, 2.2, NULL),
(82, 'Flor de Flor-de-páscoa', 3, 2.6, NULL),
(83, 'Flor de Favo-de-mel', 6, 1.9, NULL),
(84, 'Flor de Heracleum', 2, 3.1, NULL),
(85, 'Flor de Papoila', 5, 2.4, NULL),
(86, 'Flor de Fritillária', 7, 4.5, NULL),
(87, 'Flor de Talinum', 13, 2.9, NULL),
(88, 'Flor de Rosinha', 9, 1.8, NULL),
(89, 'Flor de Salvia', 12, 3.3, NULL),
(90, 'Flor de Clívia', 10, 2.7, NULL),
(91, 'Flor de Pérgula', 15, 4, NULL),
(92, 'Flor de Espatódia', 11, 3.5, NULL),
(93, 'Flor de Calathea', 8, 1.9, NULL),
(94, 'Flor de Alocásia', 6, 4.1, NULL),
(95, 'Flor de Guzmânia', 7, 2.3, NULL),
(96, 'Flor de Canteiro', 10, 3.2, NULL),
(97, 'Flor de Crássula', 14, 2.5, NULL),
(98, 'Flor de Talinão', 11, 3, NULL),
(99, 'Flor de Monstera', 9, 4.5, NULL),
(100, 'Flor de Tigridia', 12, 3.6, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `fk_cadastro_cliente_cpf_cliente` varchar(14) DEFAULT NULL,
  `fk_estoque_flores_id_flor` int(11) DEFAULT NULL,
  `fk_cadastro_vendedor_cpf_vendedor` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cadastro_adm`
--
ALTER TABLE `cadastro_adm`
  ADD PRIMARY KEY (`cpf_adm`);

--
-- Índices de tabela `cadastro_cliente`
--
ALTER TABLE `cadastro_cliente`
  ADD PRIMARY KEY (`cpf_cliente`);

--
-- Índices de tabela `cadastro_vendedor`
--
ALTER TABLE `cadastro_vendedor`
  ADD PRIMARY KEY (`cpf_vendedor`);

--
-- Índices de tabela `desconto`
--
ALTER TABLE `desconto`
  ADD PRIMARY KEY (`id_desconto`);

--
-- Índices de tabela `desconto_flor`
--
ALTER TABLE `desconto_flor`
  ADD KEY `FK_desconto_flor_1` (`fk_desconto_id_desconto`),
  ADD KEY `FK_desconto_flor_2` (`fk_estoque_flores_id_flor`);

--
-- Índices de tabela `estoque_flores`
--
ALTER TABLE `estoque_flores`
  ADD PRIMARY KEY (`id_flor`);

--
-- Índices de tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD KEY `FK_pedidos_1` (`fk_cadastro_cliente_cpf_cliente`),
  ADD KEY `FK_pedidos_2` (`fk_estoque_flores_id_flor`),
  ADD KEY `FK_pedidos_3` (`fk_cadastro_vendedor_cpf_vendedor`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `desconto_flor`
--
ALTER TABLE `desconto_flor`
  ADD CONSTRAINT `FK_desconto_flor_1` FOREIGN KEY (`fk_desconto_id_desconto`) REFERENCES `desconto` (`id_desconto`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_desconto_flor_2` FOREIGN KEY (`fk_estoque_flores_id_flor`) REFERENCES `estoque_flores` (`id_flor`) ON DELETE SET NULL;

--
-- Restrições para tabelas `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `FK_pedidos_1` FOREIGN KEY (`fk_cadastro_cliente_cpf_cliente`) REFERENCES `cadastro_cliente` (`cpf_cliente`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_pedidos_2` FOREIGN KEY (`fk_estoque_flores_id_flor`) REFERENCES `estoque_flores` (`id_flor`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_pedidos_3` FOREIGN KEY (`fk_cadastro_vendedor_cpf_vendedor`) REFERENCES `cadastro_vendedor` (`cpf_vendedor`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
