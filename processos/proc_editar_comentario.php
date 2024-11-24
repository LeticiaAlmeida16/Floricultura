<?php
include '../bd/conecta.php';
session_start();

if (isset($_POST['id_comentario'], $_POST['conteudo'], $_POST['nota'])) {
    $id_comentario = intval($_POST['id_comentario']);
    $conteudo = htmlspecialchars($_POST['conteudo'], ENT_QUOTES);
    $nota = intval($_POST['nota']);

    $query = "UPDATE comentarios SET conteudo = ?, nota = ? WHERE id_comentario = ? AND id_cliente = ?";
    $stmt = mysqli_prepare($conexao, $query);
    mysqli_stmt_bind_param($stmt, 'siii', $conteudo, $nota, $id_comentario, $_SESSION['id_cliente']);
    mysqli_stmt_execute($stmt);

    if (mysqli_stmt_affected_rows($stmt) > 0) {
        header('Location: ../index.php?msg=Comentário atualizado com sucesso');
    } else {
        header('Location: ../index.php?msg=Falha ao atualizar comentário');
    }
}
?>
