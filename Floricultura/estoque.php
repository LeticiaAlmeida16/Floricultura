<?php
    include 'bd/conecta.php';

    session_start();

    // Verifica se alguma das sessões não está definida
    if (!isset($_SESSION['id_vendedor']) || !isset($_SESSION['cpf']) || !isset($_SESSION['nome']) || !isset($_SESSION['email']) || !isset($_SESSION['tipo'])) {
        // Se alguma não estiver definida, limpa todas as sessões e redireciona
        session_unset();
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
                <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                    <div class="d-flex m-3 me-0">
                        <span class="my-auto text-primary fw-bold">Olá vendedor!</span>
                    </div>
                    <a href="processos/proc-logout.php" class="btn btn-outline-secondary ms-3 my-auto">
                        Voltar
                    </a>
                </div>
            </nav>
        </div>
    </div>
    <!-- Navbar End -->

    <!-- Single Page Header start -->
    <div class="container-fluid page-header py-5">
        <h1 class="text-center text-white display-6">Estoque</h1>
    </div>
    <!-- Single Page Header End -->

    <!-- Fruits Shop Start-->
    <div class="container-fluid fruite py-5">
        <a href='cadastro/insere_flor.php' class='btn border border-secondary rounded-pill px-3 text-primary'>
            <i class='text-primary'></i> Inserir
        </a>
        <div class="container py-5">

            <div class="row g-4">
                <div class="col-lg-12">
                    <div class="row g-4">

                    </div>
                    <div class="row g-4 justify-content-around">
                        <div class="col-lg-9">
                            <div class="row g-4 justify-content-center">

                                <?php
                                $sql = "SELECT * FROM estoque_flores";
                                $consulta = $conexao->query($sql);
                                while ($dados = $consulta->fetch_assoc()) {

                                    echo "<div class='col-12 col-sm-6 col-lg-3'> <!-- Ajuste nas classes Bootstrap --> 
                                            <div class='rounded position-relative fruite-item' style='width: 100%;'>
                                                <div class='fruite-img'>";
                                    echo "<img src='" . $dados['imagem_flor'] . "' class='img-fluid w-100 rounded-top' alt=''>";
                                    echo "</div>";
                                    // echo "<div class='text-white bg-secondary px-3 py-1 rounded position-absolute' style='top: 10px; left: 10px;'>Buquê</div>";
                                    echo "<div class='p-4 border border-secondary border-top-0 rounded-bottom'>
                                            <h4>" . $dados['nome_flor'] . "</h4>";
                                    echo "<div class='d-flex justify-content-between flex-lg-wrap'>
                                            <p class='text-dark fs-5 fw-bold mb-0'> R$" . $dados['preco_flor'] . "</p>";
                                    echo "<a href='cadastro/edita_flor.php?id=" . $dados['id_flor'] . "''
                                            class='btn border border-secondary rounded-pill px-3 text-primary'><i
                                            class='text-primary'></i> Editar</a>
                                            <a onClick='return apagar()' href='processos/proc_apaga_flor.php?id=" . $dados['id_flor'] . "'
                                            class='btn border border-secondary rounded-pill px-3 text-primary'><i
                                            class='text-primary'></i> Apagar</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>";
                                    echo "<style>
                                    .fruite-img img {
                                        width: 100%;
                                        height: 300px;
                                        object-fit: cover;
                                        border-radius: 8px 8px 0 0;
                                    }
                                    </style>";
                                }
                                ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Fruits Shop End-->


    <?php
    include 'footer.php';
    ?>

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
        function apagar() {
            return confirm("Tem certeza que deseja apagar a flor?")
        }
    </script>
</body>

</html>