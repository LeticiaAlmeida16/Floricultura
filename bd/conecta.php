<?php
$servidor = "localhost";
$database = "bd_floricultura";
$usuario = "root";
$senha = "";

$conexao = new mysqli($servidor,$usuario,$senha,$database);

$sql= "SET NAMES 'utf8'";
mysqli_query($conexao, $sql);
$sql= 'SET character_set_connection=utf8';
mysqli_query($conexao, $sql);
$sql= 'SET character_set_client=utf8';
mysqli_query($conexao, $sql);
$sql='SET character_set_results=utf8';
mysqli_query($conexao, $sql);

//Teste de conexão
// if(mysqli_connect_errno()){
//     echo "ERRO DE CONEXÃO";
// }
// else{
//     echo "CONECTANDO AO BANCO COM SUCESSO!";
// }

?>