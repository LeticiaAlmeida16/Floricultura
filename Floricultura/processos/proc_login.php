<?php
// Inicia a sessão para armazenar dados temporários do usuário
session_start();

// Importa o arquivo de conexão com o banco de dados
require('../bd/conecta.php');

// Recebe os dados enviados pelo formulário de login
$email = $_POST['email'];
$senha = md5($_POST['senha']);

// Consulta SQL para verificar se o usuário é um vendedor
$consulta_vendedor = "SELECT * FROM cadastro_vendedor WHERE email_vendedor = '$email' AND senha_vendedor = '$senha'";
$resultado_vendedor = $conexao->query($consulta_vendedor);
$isVendedor = $resultado_vendedor->num_rows === 1;

// Consulta SQL para verificar se o usuário é um cliente (caso não seja um vendedor)
$consulta_cliente = "SELECT * FROM cadastro_cliente WHERE email_cliente = '$email' AND senha_cliente = '$senha'";
$resultado_cliente = $conexao->query($consulta_cliente);
$isCliente = $resultado_cliente->num_rows === 1;

if ($isVendedor) {
    $dados_vendedor = mysqli_fetch_assoc($resultado_vendedor);
    $_SESSION['id_vendedor'] = $dados_cliente['id_vendedor'];
    $_SESSION['cpf'] = $dados_vendedor['cpf_vendedor'];
    $_SESSION['nome'] = $dados_vendedor['nome_vendedor'];
    $_SESSION['email'] = $dados_vendedor['email_vendedor'];
    $_SESSION['tipo'] = 'vendedor';
    
    header('Location: ../estoque.php');
    exit();

} elseif ($isCliente) {
    $dados_cliente = mysqli_fetch_assoc($resultado_cliente);
    $_SESSION['id_cliente'] = $dados_cliente['id_cliente'];
    $_SESSION['cpf'] = $dados_cliente['cpf_cliente'];
    $_SESSION['nome'] = $dados_cliente['nome_cliente'];
    $_SESSION['email'] = $dados_cliente['email_cliente'];
    $_SESSION['tipo'] = 'cliente';

    header('Location: ../index.php');
    exit();
} else {
    $_SESSION['error'] = 'Usuário ou senha inválidos.';
    header('Location: ../login/index.php'); // Redireciona de volta para a página de login
    exit();
}
?>
