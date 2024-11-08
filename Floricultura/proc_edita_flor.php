<?php
    require('../banco_de_dados/conecta.php');

    $id = $_GET['id'];
    $nomenovo = $_POST['nomenovo'];
    $quantidadenova = $_POST['quantidadenova'];
    $preconovo = $_POST['preconovo'];

    //agr vamos criar a string de update e executar
    $consulta = "UPDATE estoque_flores SET nome_flor = '$nomenovo', quantidade_flor = '$quantidadenova', preco_flor = '$preconovo'
    WHERE id_flor = $id";
    $conexao->query($consulta);

    //dps direcionar para a prod_vendedor.php
    header('Location: prod_vendedor.php');
?>