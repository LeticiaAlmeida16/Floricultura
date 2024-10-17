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
CREATE DATABASE IF NOT EXISTS `bd_floricultura` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bd_floricultura`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cadastro_adm`
--

CREATE TABLE `cadastro_adm` (
  `telefone_adm` int(11) DEFAULT NULL,
  `email_adm` varchar(128) DEFAULT NULL,
  `cpf_adm` int(11) NOT NULL,
  `nome_adm` varchar(128) DEFAULT NULL,
  `senha_adm` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cadastro_cliente`
--

CREATE TABLE `cadastro_cliente` (
  `cpf_cliente` int(11) NOT NULL,
  `telefone_cliente` int(11) DEFAULT NULL,
  `nome_cliente` varchar(128) DEFAULT NULL,
  `email_cliente` varchar(128) DEFAULT NULL,
  `senha_cliente` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cadastro_vendedor`
--

CREATE TABLE `cadastro_vendedor` (
  `cpf_vendedor` int(11) NOT NULL,
  `telefone_vendedor` int(11) DEFAULT NULL,
  `nome_vendedor` varchar(128) DEFAULT NULL,
  `email_vendedor` varchar(128) DEFAULT NULL,
  `senha_vededor` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `desconto`
--

CREATE TABLE `desconto` (
  `id_desconto` int(11) NOT NULL,
  `valor_desconto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `desconto_flor`
--

CREATE TABLE `desconto_flor` (
  `fk_desconto_id_desconto` int(11) DEFAULT NULL,
  `fk_estoque_flores_id_flor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoque_flores`
--

CREATE TABLE `estoque_flores` (
  `id_flor` int(11) NOT NULL,
  `nome_flor` varchar(128) DEFAULT NULL,
  `quantidade_flor` int(11) DEFAULT NULL,
  `preco_flor` float DEFAULT NULL,
  `imagem_flor` varchar(340) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `fk_cadastro_cliente_cpf_cliente` int(11) DEFAULT NULL,
  `fk_estoque_flores_id_flor` int(11) DEFAULT NULL,
  `fk_cadastro_vendedor_cpf_vendedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
