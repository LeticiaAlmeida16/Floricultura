<?php

    require('../bd/conecta.php');

    $nome = $_POST['nome'];
    $email = $_POST['email'];
    $telefone = $_POST['telefone'];
    $cpf = $_POST['cpf'];
    $senha = $_POST['senha'];
    $senha_cripto = md5($_POST['senha']);
    

    $consulta = "INSERT INTO cadastro_vendedor (cpf_vendedor, telefone_vendedor, nome_vendedor, email_vendedor, senha_vendedor) 
    VALUES ('$cpf', '$telefone', '$nome', '$email', '$senha_cripto')";

    $conexao -> query($consulta);

    header('Location: ../adm.php');

?>