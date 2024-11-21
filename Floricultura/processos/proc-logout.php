<?php
session_start();

// Destruir todas as variáveis da sessão
session_unset();

// Destruir a sessão
session_destroy();

// Redirecionar para a página de login
header('Location: ../Login_v1/index.php');
exit();
?>