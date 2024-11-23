<?php
    include 'bd/conecta.php';
    include 'menu.php';
?>

<!-- Hero Start -->
<div class="container-fluid py-5 mb-5 hero-header">
    <div class="container py-5">
        <div class="row g-5 align-items-center">
            <div class="col-md-12 col-lg-7">
                <h4 class="mb-3 text-secondary">Flores 100% Naturais</h4>
                <h1 class=" mb-5 display-3 text-secondary">Flores & Arranjos Exclusivos</h1>
            </div>
        </div>
    </div>
</div>
<!-- Hero End -->

<!-- Features Section Start -->
<div class="container-fluid featurs py-5">
    <div class="container py-5">
        <div class="row g-4">
            <div class="col-md-6 col-lg-3">
                <div class="featurs-item text-center rounded bg-light p-4">
                    <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                        <i class="fas fa-car-side fa-3x text-white"></i>
                    </div>
                    <div class="featurs-content text-center">
                        <h5>Frete Grátis</h5>
                        <p class="mb-0">Para pedidos acima de $300</p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="featurs-item text-center rounded bg-light p-4">
                    <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                        <i class="fas fa-user-shield fa-3x text-white"></i>
                    </div>
                    <div class="featurs-content text-center">
                        <h5>Pagamento Seguro</h5>
                        <p class="mb-0">Pagamento 100% seguro</p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="featurs-item text-center rounded bg-light p-4">
                    <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                        <i class="fas fa-exchange-alt fa-3x text-white"></i>
                    </div>
                    <div class="featurs-content text-center">
                        <h5>Flores saudáveis</h5>
                        <p class="mb-0">Garanta já sua linda flor!</p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="featurs-item text-center rounded bg-light p-4">
                    <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                        <i class="fa fa-phone-alt fa-3x text-white"></i>
                    </div>
                    <div class="featurs-content text-center">
                        <h5>Suporte 24H</h5>
                        <p class="mb-0">Suporte a qualquer hora</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Features Section End -->

<!-- Fruits Shop Start-->
<div class="container-fluid fruite py-5">
    <div class="container py-5">
        <div class="tab-class text-center">
            <div class="row g-4">
                <div class="col-lg-6 text-start">
                    <h1>Nossos produtos mais vendidos</h1>
                </div>
            </div>
            <div class="tab-content">
                <!-- filtro todos os produtos -->
                <div id="tab-1" class="tab-pane fade show p-0 active">
                    <div class="row g-4">
                        <div class="col-lg-12">

                            <div class="row g-4">
                                <!-- inicio card -->

                                <?php
                                $sql = "SELECT * FROM estoque_flores LIMIT 8";
                                $consulta = $conexao->query($sql);
                                while ($dados = $consulta->fetch_assoc()) {

                                    echo "<div class='col-md-6 col-lg-4 col-xl-3'> 
                                                <div class='rounded position-relative fruite-item'> 
                                                    <div class='fruite-img'>";
                                    echo "<img src='" . $dados['imagem_flor'] . "' class='img-fluid w-100 rounded-top' alt=''>";
                                    echo "</div>";
                                    // echo "<div class='text-white bg-secondary px-3 py-1 rounded position-absolute' style='top: 10px; left: 10px;'>Buquê</div>";
                                    echo "<div class='p-4 border border-secondary border-top-0 rounded-bottom'>
                                                <h4>" . $dados['nome_flor'] . "</h4>";
                                    echo "<div class='d-flex justify-content-between flex-lg-wrap'>
                                                <p class='text-dark fs-5 fw-bold mb-0'> R$" . $dados['preco_flor'] . "</p>";
                                    echo "
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
</div>
<!-- Fruits Shop End-->

<!-- Banner Section Start-->
<div class="container-fluid banner bg-secondary my-5">
    <div class="container py-5">
        <div class="row g-4 align-items-center">
            <div class="col-lg-6">
                <div class="py-4">
                    <h1 class="display-3 text-white">Flores Exóticas Frescas</h1>
                    <p class="fw-normal display-3 text-dark mb-4">na Nossa Loja</p>
                    <p class="mb-4 text-dark">Oferecemos uma ampla variedade de flores frescas, perfeitas para
                        qualquer ocasião, desde casamentos até aniversários.</p>
                    <a href=sobrenos.php
                        class="banner-btn btn border-2 border-white rounded-pill text-dark py-3 px-5">SOBRE NÓS</a>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="position-relative">
                    <img src="imgs/rosasbb.jpg" class="img-fluid w-100 rounded" alt="">
                    <div class="d-flex align-items-center justify-content-center bg-white rounded-circle position-absolute"
                        style="width: 140px; height: 140px; top: 0; left: 0;">
                        <h1 style="font-size: 100px;">1</h1>
                        <div class="d-flex flex-column">
                            <span class="h2 mb-0">R$ 50</span>
                            <span class="h4 text-muted mb-0">buquê</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Banner Section End -->

<!-- Features Start -->
<div class="container-fluid service py-5">
    <div class="container py-5">
        <div class="row g-4 justify-content-center">
            <div class="col-md-6 col-lg-4">
                <a href="#">
                    <div class="service-item bg-primary rounded border border-primary">
                        <img src="imgs/cesta.jpg" class="img-fluid rounded-top w-100" alt="">
                        <div class="px-4 rounded-bottom">
                            <div class="service-content bg-secondary text-center p-4 rounded">
                                <h5 class="text-white">Rosas Frescas</h5>
                                <h3 class="mb-0">20% OFF</h3>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-md-6 col-lg-4">
                <a href="#">
                    <div class="service-item bg-primary rounded border border-primary">
                        <img src="imgs/outubro.jpg" class="img-fluid rounded-top w-100" alt="">
                        <div class="px-4 rounded-bottom">
                            <div class="service-content bg-secondary text-center p-4 rounded">
                                <h5 class="text-white">Flores Coloridas</h5>
                                <h3 class="mb-0">Entrega Grátis</h3>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-md-6 col-lg-4">
                <a href="#">
                    <div class="service-item bg-primary rounded border border-primary">
                        <img src="imgs/25702gg.jpg" class="img-fluid rounded-top w-100" alt="">
                        <div class="px-4 rounded-bottom">
                            <div class="service-content bg-secondary text-center p-4 rounded">
                                <h5 class="text-white">Arranjos Exóticos</h5>
                                <h3 class="mb-0">Desconto de $30</h3>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
</div>
<!-- Features End -->

<?php
// Consulta para pegar os comentários e notas
$sql = "SELECT c.conteudo, c.nota, u.nome_cliente 
            FROM comentarios c 
            JOIN cadastro_cliente u ON c.id_cliente = u.id_cliente";
$result = mysqli_query($conexao, $sql);

// Calcular a média das notas
$totalNotas = 0;
$totalComentarios = 0;

if (mysqli_num_rows($result) > 0) {
    while ($row = mysqli_fetch_assoc($result)) {
        $totalNotas += $row['nota'];
        $totalComentarios++;
    }
    $mediaNotas = $totalComentarios > 0 ? $totalNotas / $totalComentarios : 0;
} else {
    $mediaNotas = 0;
}
?>

<!-- Testimonial Start -->
<div class="container-fluid testimonial py-5">
    <div class="container py-5">
        <div class="testimonial-header text-center">
            <h4 class="text-primary">Nossos Depoimentos</h4>
            <h1 class="display-5 mb-5 text-dark">O que Nossos Clientes Dizem!</h1>
            <h3 class="text-center">Nossa nota geral: <?php echo number_format($mediaNotas, 1); ?> / 10.0</h3> <!-- Exibe a média das notas -->
        </div>
        <div class="owl-carousel testimonial-carousel">
            <?php
            // Reiniciar a consulta para exibir os depoimentos
            mysqli_data_seek($result, 0);
            while ($row = mysqli_fetch_assoc($result)) {
            ?>
                <div class="testimonial-item img-border-radius bg-light rounded p-4">
                    <div class="position-relative">
                        <i class="fa fa-quote-right fa-2x text-secondary position-absolute"
                            style="bottom: 30px; right: 0;"></i>
                        <div class="mb-4 pb-4 border-bottom border-secondary">
                            <p class="mb-0"><?php echo $row['conteudo']; ?></p>
                        </div>
                        <div class="d-flex align-items-center flex-nowrap">
                            <div class="ms-4 d-block">
                                <h4 class="text-dark"><?php echo $row['nome_cliente']; ?></h4>
                                <p class="m-0 pb-3">Cliente</p>
                                <div class="d-flex pe-5">
                                    <?php
                                    // Exibir as estrelas de acordo com a nota
                                    for ($i = 0; $i < 5; $i++) {
                                        if ($i < $row['nota']) {
                                            echo '<i class="fas fa-star text-primary"></i>';
                                        } else {
                                            echo '<i class="fas fa-star"></i>';
                                        }
                                    }
                                    ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <?php } ?>
        </div>
    </div>
</div>
<!-- Testimonial End -->

<?php
include 'footer.php';
?>





<!-- Back to Top -->
<a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
        class="fa fa-arrow-up"></i></a>


<!-- JavaScript Libraries -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/waypoints/waypoints.min.js"></script>
<script src="lib/lightbox/js/lightbox.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Template Javascript -->
<script src="js/main.js"></script>
</body>

</html>