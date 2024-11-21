<?php

    require('../bd/conecta.php');

    $nome = $_POST['nome'];
    $email = $_POST['email'];
    $telefone = $_POST['telefone'];
    $cpf = $_POST['cpf'];
    $senha = $_POST['senha'];
    $senha_cripto = md5($_POST['senha']);
    

    $consulta = "INSERT INTO cadastro_cliente (cpf_cliente, telefone_cliente, nome_cliente, email_cliente, senha_cliente) 
    VALUES ('$cpf', '$telefone', '$nome', '$email', '$senha_cripto')";

    $conexao -> query($consulta);

    header('Location: ../Login_v1/index.php');

?>