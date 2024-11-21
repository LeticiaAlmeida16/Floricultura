<?php

    require('../bd/conecta.php');

    $nome = $_POST['nome_flor'];
    $quantidade = $_POST['quantidade_flor'];
    $preco = $_POST['preco_flor'];
    $imgflor = "imgs/Flores/logo.png";

    $consulta = "INSERT INTO estoque_flores (nome_flor, quantidade_flor, preco_flor, imagem_flor) 
    VALUES ('$nome', '$quantidade', '$preco', '$imgflor')";

    $conexao -> query($consulta);

    header('Location: ../estoque.php');

?>