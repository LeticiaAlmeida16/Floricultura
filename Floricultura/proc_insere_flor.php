<?php

    require('../banco_de_dados/conecta.php');

    $nome = $_POST['nome_flor'];
    $quantidade = $_POST['quantidade_flor'];
    $preco = $_POST['preco_flor'];

    $consulta = "INSERT INTO estoque_flores (nome_flor, quantidade_flor, preco_flor) 
    VALUES ('$nome', '$quantidade', '$preco')";

    $conexao -> query($consulta);

    header('Location: prod_vendedor.php');

?>