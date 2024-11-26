<?php
    require('../bd/conecta.php');

    $id = $_GET['id'];
    $nomenovo = $_POST['nomenovo'];
    $telefonenovo = $_POST['telefonenovo'];
    $emailnovo = $_POST['emailnovo'];
    $cpfnovo = $_POST['cpfnovo'];

    //agr vamos criar a string de update e executar
    $consulta = "UPDATE cadastro_vendedor SET nome_vendedor = '$nomenovo', telefone_vendedor = '$telefonenovo', email_vendedor = '$emailnovo', cpf_vendedor = '$cpfnovo'
    WHERE id_vendedor = $id";

    $conexao->query($consulta);

    //dps direcionar para a prod_vendedor.php
    header('Location: ../adm.php');

?>