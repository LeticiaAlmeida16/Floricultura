<?php
    include 'C:\xampp\htdocs\Floricultura/banco_de_dados/conecta.php';
    include 'menu.php';
?>

<!-- Modal para adicionar comentário -->
<div class="modal fade" id="addCommentModal" tabindex="-1" aria-labelledby="addCommentModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="comentario/adicionar_comentario.php" method="post">
                <div class="modal-header">
                    <h5 class="modal-title" id="addCommentModalLabel">Adicionar Comentário</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fechar"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="conteudo" class="form-label">Comentário</label>
                        <textarea name="conteudo" class="form-control" id="conteudo" rows="3" maxlength="520" required></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-primary">Adicionar Comentário</button>
                </div>
                <div class="mb-3">
                    <label for="nota" class="form-label">Nota (0 a 10)</label>
                    <input type="number" class="form-control" id="nota" name="nota" min="0" max="10" required>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Seção de comentários e botão "Adicionar Comentário" -->
<div class="container-fluid py-5 bg-light">
    <div class="container">
        <div class="text-center my-4">
            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addCommentModal">Adicionar Comentário</button>
        </div>

        <h4 class="text-dark text-center mb-4">Comentários dos Clientes</h4>
        <div class="row">
        <?php
// Obter os comentários com o nome do cliente associado
$query = "SELECT c.conteudo, c.nota, u.nome_cliente, u.tipo FROM comentarios c 
          JOIN cadastro_cliente u ON c.id_cliente = u.id_cliente";
$result = mysqli_query($conexao, $query);

if (mysqli_num_rows($result) > 0) {
    while ($row = mysqli_fetch_assoc($result)) {
        // Exibe o nome do cliente que realmente fez o comentário
        echo '<div class="col-md-4 mb-3">';
        echo '<div class="bg-white p-4 rounded shadow">';
        
        // Verifica o tipo de usuário e exibe o nome
        if ($row['tipo'] == 'cliente') {
            echo '<p class="mb-0 text-dark"><strong>' . htmlspecialchars($row['nome_cliente']) . '</strong></p>';
        } else {
            echo '<p class="mb-0 text-dark"><strong>Usuário não identificado</strong></p>';
        }
        
        echo '<p class="mb-0 text-dark">' . htmlspecialchars($row['conteudo']) . '</p>';
        echo '<p class="mb-0 text-muted">Nota: ' . htmlspecialchars($row['nota']) . '</p>';
        echo '</div>';
        echo '</div>';
    }
} else {
    echo '<p class="text-center text-muted">Nenhum comentário disponível.</p>';
}
?>

        </div>
    </div>
</div>

<?php
    include 'footer.php';
?>


        <!-- Copyright Start -->
        <div class="container-fluid copyright bg-dark py-4">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                        <span class="text-light"><a href="#"><i class="fas fa-copyright text-light me-2"></i>Your Site Name</a>, All right reserved.</span>
                    </div>
                    <div class="col-md-6 my-auto text-center text-md-end text-white">
                        <!--/*** This template is free as long as you keep the below author’s credit link/attribution link/backlink. ***/-->
                        <!--/*** If you'd like to use the template without the below author’s credit link/attribution link/backlink, ***/-->
                        <!--/*** you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". ***/-->
                        Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a> Distributed By <a class="border-bottom" href="https://themewagon.com">ThemeWagon</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Copyright End -->



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
    </body>

</html>