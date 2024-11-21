-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 19/11/2024 às 23:00
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

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

CREATE DATABASE IF NOT EXISTS `bd_floricultura` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `bd_floricultura`;

--
-- Estrutura da tabela `cadastro_adm`
--

CREATE TABLE `cadastro_adm` (
  `id_adm` int(11) NOT NULL,
  `telefone_adm` varchar(14) DEFAULT NULL,
  `email_adm` varchar(128) DEFAULT NULL,
  `cpf_adm` varchar(14) NOT NULL,
  `nome_adm` varchar(128) DEFAULT NULL,
  `senha_adm` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- INSERT de dados da tabela `cadastro_adm`
--

INSERT INTO `cadastro_adm` (`id_adm`, `telefone_adm`, `email_adm`, `cpf_adm`, `nome_adm`, `senha_adm`) VALUES
(1, '(11)95243-9006', 'chefe.aumeidan@email.com', '529.160.128-00', 'Chefe Aumeidan', 'senhaAdmChefe');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cadastro_cliente`
--

CREATE TABLE `cadastro_cliente` (
  `id_cliente` int(11) NOT NULL,
  `cpf_cliente` varchar(14) NOT NULL,
  `telefone_cliente` varchar(14) DEFAULT NULL,
  `nome_cliente` varchar(128) DEFAULT NULL,
  `email_cliente` varchar(128) DEFAULT NULL,
  `senha_cliente` varchar(64) DEFAULT NULL,
  `tipo` enum('cliente','vendedor','administrador') NOT NULL DEFAULT 'cliente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- INSERT de dados da tabela `cadastro_cliente`
--

INSERT INTO `cadastro_cliente` (`id_cliente`, `cpf_cliente`, `telefone_cliente`, `nome_cliente`, `email_cliente`, `senha_cliente`, `tipo`) VALUES
(1, '12345678912', '(11)97563-0023', 'Anderson Vanin', 'anderson@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'cliente'),
(2, '21987654321', '(11)98054-2255', 'Ricardo Moraes', 'ricardo@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'cliente');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cadastro_vendedor`
--

CREATE TABLE `cadastro_vendedor` (
  `id_vendedor` int(11) NOT NULL,
  `cpf_vendedor` varchar(14) NOT NULL,
  `telefone_vendedor` varchar(14) DEFAULT NULL,
  `nome_vendedor` varchar(128) DEFAULT NULL,
  `email_vendedor` varchar(128) DEFAULT NULL,
  `senha_vendedor` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- INSERT de dados da tabela `cadastro_vendedor`
--

INSERT INTO `cadastro_vendedor` (`id_vendedor`, `cpf_vendedor`, `telefone_vendedor`, `nome_vendedor`, `email_vendedor`, `senha_vendedor`) VALUES
(1, '124.701.218-69', '(11)91912-2207', 'França Bardella', 'franca.bardella@email.com', '3d7fcc75ff6bfcbc40127078aa3760d5'),
(2, '427.566.812-13', '(11)99971-2510', 'Filha do Hoender Rodrigues', 'hoender.rodrigues@email.com', '2de3dca5a6f506661af5884c103524f4'),
(3, '458.256.156-09', '(11)91567-2033', 'Pigmeu Garcia', 'pigmeu.garcia@email.com', 'e7d80ffeefa212b7c5c55700e4f7193e'),
(4, '462.903.475-96', '(11)95623-0789', 'Bolivia Gama', 'bolivia.gama@email.com', 'd25230d6d94cf861be33a5e922fca98a');

-- --------------------------------------------------------

--
-- Estrutura da tabela `comentarios`
--

CREATE TABLE `comentarios` (
  `id_comentario` int(11) NOT NULL,
  `conteudo` varchar(520) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `nota` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- INSERT de dados da tabela `comentarios`
--

INSERT INTO `comentarios` (`id_comentario`, `conteudo`, `id_cliente`, `nota`) VALUES
(6, 'Belo trabalho! Merece MB', 1, 10),
(7, 'Belas flores', 1, 10);

--
-- Estrutura da tabela `estoque_flores`
--

CREATE TABLE `estoque_flores` (
  `id_flor` int(11) NOT NULL,
  `nome_flor` varchar(128) DEFAULT NULL,
  `quantidade_flor` int(11) DEFAULT NULL,
  `preco_flor` float DEFAULT NULL,
  `imagem_flor` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- INSERT de dados da tabela `estoque_flores`
--

INSERT INTO `estoque_flores` (`id_flor`, `nome_flor`, `quantidade_flor`, `preco_flor`, `imagem_flor`) VALUES
(1, 'Rosa', 10, 2.5, 'imgs/Flores/Rosa.jpg'),
(2, 'Margarida', 15, 1.8, 'imgs/Flores/Margarida.jpg'),
(3, 'Girassol', 20, 3, 'imgs/Flores/Girassol.jpg'),
(4, 'Tulipa', 12, 2.2, 'imgs/Flores/Tulipa.jpg'),
(5, 'Lírio', 25, 4, 'imgs/Flores/Lirio.jpg'),
(6, 'Orquídea', 8, 5.5, 'imgs/Flores/Orquidea.jpg'),
(7, 'Cravo', 30, 2, 'imgs/Flores/Cravo.jpg'),
(8, 'Hibisco', 5, 3.5, 'imgs/Flores/Hibisco.jpg'),
(9, 'Jasmim', 18, 1.7, 'imgs/Flores/Jasmin.jpg'),
(10, 'Peônia', 10, 6, 'imgs/Flores/Peonia.jpg'),
(11, 'Dália', 22, 2.8, 'imgs/Flores/Dalia.jpg'),
(12, 'Magnólia', 7, 3.2, 'imgs/Flores/Magnolia.jpg'),
(13, 'Gerânio', 14, 1.9, 'imgs/Flores/Geranio.jpg'),
(14, 'Flor de Lótus', 6, 4.5, 'imgs/Flores/Lotus.jpg'),
(15, 'Azaléia', 9, 3, 'imgs/Flores/Azaleia.jpg'),
(16, 'Camélia', 11, 2.4, 'imgs/Flores/Camelia.jpg'),
(17, 'Calêndula', 21, 1.5, 'imgs/Flores/Calendula.jpg'),
(18, 'Crisântemo', 13, 2.6, 'imgs/Flores/Crisantemo.jpg'),
(19, 'Flor de Maio', 19, 3.1, 'imgs/Flores/Maio.jpg'),
(20, 'Flor de Cerejeira', 17, 4, 'imgs/Flores/Cerejeira.jpg'),
(21, 'Flor de Azevinho', 4, 1.2, 'imgs/Flores/Azevinho.jpg'),
(22, 'Flor de Gérbera', 16, 2.3, 'imgs/Flores/Gerbera.jpg'),
(23, 'Flor de Cacto', 2, 2, 'imgs/Flores/Cacto.jpg'),
(24, 'Flor de Anêmona', 3, 3, 'imgs/Flores/Anemona.jpg'),
(25, 'Flor de Fuchsia', 9, 4.2, 'imgs/Flores/Fuchsia.jpg'),
(26, 'Flor de Lantana', 12, 2.9, 'imgs/Flores/Lantana.jpg'),
(27, 'Flor de Violeta', 8, 1.8, 'imgs/Flores/Violeta.jpg'),
(28, 'Flor de Lavanda', 15, 2.7, 'imgs/Flores/Lavanda.jpg'),
(29, 'Flor de Estrelítzia', 11, 3.6, 'imgs/Flores/Estrelitzia.jpg'),
(30, 'Flor de Miosótis', 7, 1.9, 'imgs/Flores/Miosotis.jpg'),
(31, 'Flor de Jasmim', 20, 2.8, 'imgs/Flores/Jasmin.jpg'),
(32, 'Flor de Alstroemeria', 18, 3.2, 'imgs/Flores/flor_de_alstroemeria.jpg'),
(33, 'Flor de Dente de Leão', 14, 2, 'imgs/Flores/flor_de_dente_de_leao.jpg'),
(34, 'Flor de Narciso', 19, 2.9, 'imgs/Flores/flor_de_narciso.jpg'),
(35, 'Flor de Heliotrópio', 22, 3.5, 'imgs/Flores/flor_de_heliotropio.jpg'),
(36, 'Flor de Fúcsia', 3, 4, 'imgs/Flores/flor_de_fucsia.jpg'),
(37, 'Flor de Lobélia', 4, 2.1, 'imgs/Flores/flor_de_lobelia.jpg'),
(38, 'Flor de Cosmos', 5, 3, 'imgs/Flores/flor_de_cosmos.jpg'),
(39, 'Flor de Sálvia', 6, 2.5, 'imgs/Flores/flor_de_salvia.jpg'),
(40, 'Flor de Bico-de-lacre', 10, 3.1, 'imgs/Flores/flor_de_bico-de-lacre.jpg'),
(41, 'Flor de Petúnia', 11, 1.8, 'imgs/Flores/flor_de_petunia.jpg'),
(42, 'Flor de Gerbera', 12, 2.6, 'imgs/Flores/Gerbera.jpg'),
(43, 'Flor de Xaxim', 8, 3.5, 'imgs/Flores/flor_de_xaxim.jpg'),
(44, 'Flor de Camélia', 14, 2.4, 'imgs/Flores/Camelia.jpg'),
(45, 'Flor de Aster', 16, 1.9, 'imgs/Flores/flor_de_aster.jpg'),
(46, 'Flor de Lírio-do-vale', 9, 4.5, 'imgs/Flores/flor_de_lirio-do-vale.jpg'),
(47, 'Flor de Flor-de-lis', 10, 3, 'imgs/Flores/flor_de_lis.jpg'),
(48, 'Flor de Figueira', 7, 2.7, 'imgs/Flores/flor_de_figueira.jpg'),
(49, 'Flor de Palma', 20, 1.8, 'imgs/Flores/flor_de_palma.jpg'),
(50, 'Flor de Alecrim', 15, 2.4, 'imgs/Flores/flor_de_alecrim.jpg'),
(51, 'Flor de Cebola', 13, 1.5, 'imgs/Flores/flor_de_cebola.jpg'),
(52, 'Flor de Suculenta', 11, 4.2, 'imgs/Flores/flor_de_suculenta.jpg'),
(53, 'Flor de Begônia', 22, 3, 'imgs/Flores/flor_de_begonia.jpg'),
(54, 'Flor de Angélica', 9, 2.9, 'imgs/Flores/flor_de_angelica.jpg'),
(55, 'Flor de Zínia', 10, 1.8, 'imgs/Flores/flor_de_zinia.jpg'),
(56, 'Flor de Antúrio', 12, 4, 'imgs/Flores/flor_de_anturio.jpg'),
(57, 'Flor de Limoeiro', 3, 2.2, 'imgs/Flores/flor_de_limoeiro.jpg'),
(58, 'Flor de Capuchinha', 4, 3.1, 'imgs/Flores/flor_de_capuchinha.jpg'),
(59, 'Flor de Amor-perfeito', 5, 1.5, 'imgs/Flores/flor_de_amor-perfeito.jpg'),
(60, 'Flor de Calêndula', 6, 2.6, 'imgs/Flores/flor_de_calendula.jpg'),
(61, 'Flor de Nepenta', 2, 4.1, 'imgs/Flores/flor_de_nepenta.jpg'),
(62, 'Flor de Dama-da-noite', 7, 3, 'imgs/Flores/flor_de_dama-da-noite.jpg'),
(63, 'Flor de Laranjeira', 10, 2.8, 'imgs/Flores/flor_de_laranjeira.jpg'),
(64, 'Flor de Açafrão', 15, 4.5, 'imgs/Flores/flor_de_acafrao.jpg'),
(65, 'Flor de Malva', 11, 2, 'imgs/Flores/flor_de_malva.jpg'),
(66, 'Flor de Peperômia', 9, 1.9, 'imgs/Flores/flor_de_peperomia.jpg'),
(67, 'Flor de Acalifa', 12, 3.2, 'imgs/Flores/flor_de_acalifa.jpg'),
(68, 'Flor de Amaryllis', 20, 5, 'imgs/Flores/flor_de_amaryllis.jpg'),
(69, 'Flor de Trevo', 8, 2.3, 'imgs/Flores/flor_de_trevo.jpg'),
(70, 'Flor de Coração-sangue', 16, 2.5, 'imgs/Flores/flor_de_coracao-sangue.jpg'),
(71, 'Flor de Sinfonia', 18, 3, 'imgs/Flores/flor_de_sinfonia.jpg'),
(72, 'Flor de maio espanhola', 13, 2.7, 'imgs/Flores/flor-de-maio.jpg'),
(73, 'Flor de Crotalária', 19, 1.8, 'imgs/Flores/flor_de_crotalaria.jpg'),
(74, 'Flor de Escabiose', 21, 2.6, 'imgs/Flores/flor_de_escabiose.jpg'),
(75, 'Flor de Cravina', 17, 2.9, 'imgs/Flores/flor_de_cravina.jpg'),
(76, 'Flor de Gardênia', 14, 4, 'imgs/Flores/flor_de_gardenia.jpg'),
(77, 'Flor de Suculenta Verde', 12, 3.5, 'imgs/Flores/flor_de_suculenta.jpg'),
(78, 'Flor de Pothos', 8, 1.8, 'imgs/Flores/flor_de_pothos.jpg'),
(79, 'Flor de Pansy', 15, 2.9, 'imgs/Flores/flor_de_pansy.jpg'),
(80, 'Flor de Trapoeraba', 10, 3, 'imgs/Flores/flor_de_trapoeraba.jpg'),
(81, 'Flor de Falsa-azaleia', 4, 2.2, 'imgs/Flores/flor_de_falsa-azaleia.jpg'),
(82, 'Flor de páscoa', 3, 2.6, 'imgs/Flores/flor_de_pascoa.jpg'),
(83, 'Flor de Favo-de-mel', 6, 1.9, 'imgs/Flores/flor_de_favo-de-mel.jpg'),
(84, 'Flor de Heracleum', 2, 3.1, 'imgs/Flores/flor_de_heracleum.jpg'),
(85, 'Flor de Papoila', 5, 2.4, 'imgs/Flores/flor_de_papoila.jpg'),
(86, 'Flor de Fritillária', 7, 4.5, 'imgs/Flores/flor_de_fritillaria.jpg'),
(87, 'Flor de Talinum', 13, 2.9, 'imgs/Flores/flor_de_talinum.jpg'),
(88, 'Flor de Rosinha', 9, 1.8, 'imgs/Flores/flor_de_rosinha.jpg'),
(89, 'Flor de Salvinha', 12, 3.3, 'imgs/Flores/flor_de_salvinha.jpg'),
(90, 'Flor de Clívia', 10, 2.7, 'imgs/Flores/flor_de_clivia.jpg'),
(91, 'Flor de Pérgula', 15, 4, 'imgs/Flores/flor_de_pergula.jpg'),
(92, 'Flor de Espatódia', 11, 3.5, 'imgs/Flores/flor_de_espatodia.jpg'),
(93, 'Flor de Calathea', 8, 1.9, 'imgs/Flores/flor_de_calathea.jpg'),
(94, 'Flor de Alocásia', 6, 4.1, 'imgs/Flores/flor_de_alocasia.jpg'),
(95, 'Flor de Guzmânia', 7, 2.3, 'imgs/Flores/flor_de_guzmania.jpg'),
(96, 'Flor de Canteiro', 10, 3.2, 'imgs/Flores/flor_de_canteiro.jpg'),
(97, 'Flor de Crássula', 14, 2.5, 'imgs/Flores/flor_de_crassula.jpg'),
(98, 'Flor de Talinão', 11, 3, 'imgs/Flores/flor_de_talinao.jpg'),
(99, 'Flor de Monstera', 9, 4.5, 'imgs/Flores/flor_de_monstera.jpg'),
(100, 'Flor de Tigridia', 12, 3.6, 'imgs/Flores/flor_de_tigridia.jpg');

-- --------------------------------------------------------
--
-- Índices da tabela `cadastro_adm`
--
ALTER TABLE `cadastro_adm`
  ADD PRIMARY KEY (`id_adm`);

--
-- Índices da tabela `cadastro_cliente`
--
ALTER TABLE `cadastro_cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices da tabela `cadastro_vendedor`
--
ALTER TABLE `cadastro_vendedor`
  ADD PRIMARY KEY (`id_vendedor`);

--
-- Índices da tabela `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id_comentario`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Índices da tabela `estoque_flores`
--
ALTER TABLE `estoque_flores`
  ADD PRIMARY KEY (`id_flor`);

--
-- AUTO_INCREMENT para tabelas
--

--
-- AUTO_INCREMENT da tabela `cadastro_adm`
--
ALTER TABLE `cadastro_adm`
  MODIFY `id_adm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT da tabela `cadastro_cliente`
--
ALTER TABLE `cadastro_cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT da tabela `cadastro_vendedor`
--
ALTER TABLE `cadastro_vendedor`
  MODIFY `id_vendedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT da tabela `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT da tabela `estoque_flores`
--
ALTER TABLE `estoque_flores`
  MODIFY `id_flor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- Restrições para tabelas
--

--
-- Restrições para tabelas `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cadastro_cliente` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
