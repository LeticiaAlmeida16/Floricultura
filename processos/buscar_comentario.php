<?php
include '../bd/conecta.php';

if (isset($_GET['id'])) {
    $id = intval($_GET['id']);
    $query = "SELECT conteudo, nota FROM comentarios WHERE id_comentario = ?";
    $stmt = mysqli_prepare($conexao, $query);
    mysqli_stmt_bind_param($stmt, 'i', $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    $comment = mysqli_fetch_assoc($result);

    echo json_encode($comment);
} else {
    echo json_encode(['error' => 'ID inválido']);
}
?>
