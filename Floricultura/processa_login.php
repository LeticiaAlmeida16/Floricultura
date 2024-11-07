<?php

    // Inicia a sessão para armazenar dados temporários do usuário
    session_start();

    // Importa o arquivo de conexão com o banco de dados
    require('../banco_de_dados/conecta.php');

    // Recebe os dados enviados pelo formulário de login
    $email = $_POST['email'];
    $senha = $_POST['senha'];

    // Consulta SQL para verificar se o usuário é um vendedor
    $consulta_vendedor = "SELECT * FROM cadastro_vendedor WHERE email_vendedor = '$email' AND senha_vendedor = '$senha'";
    $resultado_vendedor = $conexao->query($consulta_vendedor);
    $isVendedor = $resultado_vendedor->num_rows === 1; // Retorna verdadeiro se o usuário é um vendedor

    // Consulta SQL para verificar se o usuário é um cliente (caso não seja um vendedor)
    $consulta_cliente = "SELECT * FROM cadastro_cliente WHERE email_cliente = '$email' AND senha_cliente = '$senha'";
    $resultado_cliente = $conexao->query($consulta_cliente);
    $isCliente = $resultado_cliente->num_rows === 1; // Retorna verdadeiro se o usuário é um cliente

    if ($isVendedor) {
        // Usuário é um vendedor
        $dados_vendedor = mysqli_fetch_assoc($resultado_vendedor);
        $_SESSION['id'] = $dados_vendedor['id'];
        $_SESSION['nome'] = $dados_vendedor['nome'];
        $_SESSION['email'] = $dados_vendedor['email'];
        $_SESSION['tipo'] = 'vendedor';

        // Redireciona para o painel do vendedor
        header('Location: vendedorTeste.php');
    } elseif ($isCliente) {
        // Usuário é um cliente
        $dados_cliente = mysqli_fetch_assoc($resultado_cliente);
        $_SESSION['id'] = $dados_cliente['id'];
        $_SESSION['nome'] = $dados_cliente['nome'];
        $_SESSION['email'] = $dados_cliente['email'];
        $_SESSION['tipo'] = 'cliente';

        // Redireciona para a página inicial do cliente
        header('Location: index.php');
    } else {
        // Login falhou, redireciona para a página de login novamente
        header('Location: Login_v1/index.html');
    }
?>