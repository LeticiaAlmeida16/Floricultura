<?php
include '../bd/conecta.php';
session_start();

if (isset($_POST['id_comentario'])) {
    $id_comentario = intval($_POST['id_comentario']);

    $query = "DELETE FROM comentarios WHERE id_comentario = ? AND id_cliente = ?";
    $stmt = mysqli_prepare($conexao, $query);
    mysqli_stmt_bind_param($stmt, 'ii', $id_comentario, $_SESSION['id_cliente']);
    mysqli_stmt_execute($stmt);

    if (mysqli_stmt_affected_rows($stmt) > 0) {
        header('Location: ../depoimentos.php?msg=Comentário excluído com sucesso');
    } else {
        header('Location: ../depoimentos.php?msg=Falha ao excluir comentário');
    }
}
?>
