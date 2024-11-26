<?php
    include 'bd/conecta.php';

    session_start();

    // Verifica se alguma das sessões não está definida
    if((!isset($_SESSION['id_vendedor']) == true) && (!isset($_SESSION['cpf']) == true) && (!isset($_SESSION['nome']) == true) && (!isset($_SESSION['email']) == true) && (!isset($_SESSION['tipo']) == true)){
        unset($_SESSION['id_vendedor']);
        unset($_SESSION['cpf']);        
        unset($_SESSION['nome']);        
        unset($_SESSION['email']);        
        unset($_SESSION['tipo']);        
        header('Location: login/index.php');
    }
?>

<!DOCTYPE html>
<html lang="PT-BR">

<head>
    <meta charset="utf-8">
    <title>Luxe Blooms</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
        rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link rel="icon" type="image/png" href="imgs/flor.png" />


    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>

<!-- Navbar start -->
        <div class="container-fluid fixed-top">
            <div class="container px-0">
                <nav class="navbar navbar-light bg-white navbar-expand-xl">
                    <a href="index.php" class="navbar-brand">
                        <h1 class="text-primary display-6">Luxe Blooms</h1>
                    </a>
                    <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>
                    <div class="d-flex ms-auto">
                        <?php
                        echo "<span class='my-auto text-primary fw-bold'>Bem-vindo(a), " . htmlspecialchars($_SESSION['nome']) . "!
                            <a href='processos/proc-logout.php' class='btn btn-outline-secondary ms-2'>Logout</a>
                        </span>";
                        ?>
                    </div>
                </nav>
            </div>
        </div>
<!-- Navbar End -->

    <!-- Single Page Header start -->
    <div class="container-fluid page-header py-5">
        <h1 class="text-center text-white display-6">Controle</h1>
    </div>
    <!-- Single Page Header End -->

    <!-- Fruits Shop Start-->
    <div class="container-fluid fruite py-5">

        <div class="container py-5">
            <div class="row g-4">
                <div class="col-lg-12">
                    <div class="row g-4">
                        <h3>Vendedores</h3>
                    </div>
                    <div class=" g-4">
                        <a href='cadastro/insere_vendedor.php' class='btn border border-secondary rounded-pill text-primary'>
                            <i class='text-primary'></i> Inserir Novo Vendedor
                        </a>
                    </div>
                    <br>
                    <br>
                    <div class="row g-4 justify-content-around">
                        <div class="col-lg-9">
                            <div class="table  row g-4 justify-content-center">
                                <table class="table-sm table-borderless table-hover" id="datatablesSimple">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Nome</th>
                                                <th>E-mail</th>
                                                <th>Telefone</th>
                                                <th>CPF</th>
                                                <th>Opções</th>
                                            </tr>
                                        </thead>
        
                                        <tbody>

                                            <?php

                                                $sql = "SELECT * FROM cadastro_vendedor";
                                                $consulta = $conexao->query($sql);

                                                //fetch_assoc() associa os registros com seus vetores, pelos indices
                                                
                                                while($dados = $consulta->fetch_assoc()){
                                                    echo "<tr>";

                                                    //pega pelo indice dele
                                                    echo "<td>".$dados['id_vendedor']."</td>";
                                                    echo "<td>".$dados['nome_vendedor']."</td>";
                                                    echo "<td>".$dados['email_vendedor']."</td>";
                                                    echo "<td>".$dados['telefone_vendedor']."</td>";
                                                    echo "<td>".$dados['cpf_vendedor']."</td>";
                                                    // ? diz q vai pegar mais uma informacao, no caso o id vai mostrar na barra
                                                    echo "<td>
                                                        <a class='btn btn-sm btn-outline-primary px-3  rounded-pill' href='../processos/proc_edita_vendedor.php?id=".$dados['id_vendedor']."'  >ATUALIZAR</a>        
                                                        <br>
                                                        <a class='btn btn-sm btn-outline-danger px-3  rounded-pill' onClick='return apagarvendedor()' href='../processos/apaga_vendedor.php?id=".$dados['id_vendedor']."'>APAGAR</a>
                                                    </td>";

                                                    echo "</tr>";
                                                }

                                            ?>
                                            
                                        </tbody>
                                </table>

                            </div>
                        </div>
                    </div>

                    <br>
                    <br>

                    <div class="row g-4">
                        <h3>Clientes</h3>
                    </div>
                    <div class="row g-4 justify-content-around">
                        <div class="col-lg-9">
                            <div class="table row g-4 justify-content-center">
                            <table class="table-sm table-borderless table-hover" id="datatablesSimple">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Nome</th>
                                                <th>E-mail</th>
                                                <th>Telefone</th>
                                                <th>CPF</th>
                                                <th>Opções</th>
                                            </tr>
                                        </thead>
        
                                        <tbody>

                                            <?php

                                                $sql = "SELECT * FROM cadastro_cliente";
                                                $consulta = $conexao->query($sql);

                                                //fetch_assoc() associa os registros com seus vetores, pelos indices
                                                
                                                while($dados = $consulta->fetch_assoc()){
                                                    echo "<tr>";

                                                    //pega pelo indice dele
                                                    echo "<td>".$dados['id_cliente']."</td>";
                                                    echo "<td>".$dados['nome_cliente']."</td>";
                                                    echo "<td>".$dados['email_cliente']."</td>";
                                                    echo "<td>".$dados['telefone_cliente']."</td>";
                                                    echo "<td>".$dados['cpf_cliente']."</td>";
                                                    // ? diz q vai pegar mais uma informacao, no caso o id vai mostrar na barra
                                                    echo "<td>
                                                        <a class='btn btn-sm btn-outline-primary px-3  rounded-pill' href='atualiza_cliente.php?id=".$dados['id_cliente']."'  >ATUALIZAR</a>        
                                                        <br>
                                                        <a class='btn btn-sm btn-outline-danger px-3  rounded-pill' onClick='return apagarcliente()' href='processa_delete_cliente.php?id=".$dados['id_cliente']."'>APAGAR</a>
                                                    </td>";

                                                    echo "</tr>";
                                                }

                                            ?>
                                            
                                        </tbody>
                                </table>
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Fruits Shop End-->

    <!-- Back to Top -->
    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/lightbox/js/lightbox.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
    <script>
        //funcao para mensagem de seguranca
        function apagarCliente() {
            return confirm("Tem certeza que deseja apagar a flor?")
        }

        function apagarVendedor() {
            return confirm("Tem certeza que deseja apagar a flor?")
        }
    </script>
</body>

</html>