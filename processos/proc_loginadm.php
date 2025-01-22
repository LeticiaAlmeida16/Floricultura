<?php

    //cria a sessao 
    session_start();

    //puxa a coneccao
    require('../bd/conecta.php');

    //vem do login.html
    $email = $_POST['email'];
    $senha = $_POST['senha'];


    $consulta = "SELECT * FROM cadastro_adm WHERE email_adm = '$email' AND senha_adm = '$senha'";

    $resultado = $conexao->query($consulta);
    //pega a quantidade de linhas entro da $resultado e atribui a uma variavel
    $registros = $resultado->num_rows;
  
    //pegou o objeto resultado e fez uma associacao de tudo q achou
    $resultado_usuario = mysqli_fetch_assoc($resultado);

    //esse detalha a variavel inteira, mostra valores, tipo; usa pra lista, obejto
    //var_dump($resultado_usuario);

    if($registros == 1){
        //chama a variavel do banco de dados
        $_SESSION['id'] = $resultado_usuario['id_adm'];
        $_SESSION['telefone'] = $resultado_usuario['telefone_adm'];
        $_SESSION['email'] = $resultado_usuario['email_adm'];
        $_SESSION['cpf'] = $resultado_usuario['cpf_adm'];
        $_SESSION['nome'] = $resultado_usuario['nome_adm'];
        $_SESSION['senha'] = $resultado_usuario['senha_adm'];


        header('Location: ../adm.php');
    }
    else{
        header('Location: ../login/loginadm.php');
    }
?>