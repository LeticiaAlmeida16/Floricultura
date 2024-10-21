<?php
$servidor = "localhost";
$database = "bd_floricultura";
$usuario = "root";
$senha = "";

$conexao = new mysqli($servidor,$usuario,$senha,$database);

if(mysqli_connect_errno()){
    echo "ERRO DE CONEXÃO";
}
else{
    echo "CONECTANDO AO BANCO COM SUCESSO!";
}
?>