<?php
session_start();

include '../bd/conecta.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Verificar se o usuário está logado e se é um cliente
    if (isset($_SESSION['id_cliente']) && $_SESSION['tipo'] == 'cliente') {
        $id_cliente = $_SESSION['id_cliente'];
        $conteudo = mysqli_real_escape_string($conexao, $_POST['conteudo']);
        $nota = $_POST['nota'];
        
        // Inserir comentário e nota no banco
        $query = "INSERT INTO comentarios (conteudo, id_cliente, nota) VALUES ('$conteudo', '$id_cliente', '$nota')";
        if (mysqli_query($conexao, $query)) {
            header('Location: ../depoimentos.php'); // Redirecionar para a página de comentários
            exit();
        } else {
            echo "Erro ao adicionar comentário: " . mysqli_error($conexao);
        }
    } else {
        // Mensagem de erro caso o usuário não seja um cliente
        echo "Você precisa estar logado como cliente para comentar.";
    }
}
?>
