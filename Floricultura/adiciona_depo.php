<?php
    include 'bd/conecta.php';
    session_start();
    include 'menu.php';
?>

<div class="container-fluid page-header py-5">
    <h1 class="text-center text-white display-6">Depoimentos</h1>
</div>
<!-- Modal para adicionar comentário -->
<div class="modal fade" id="addCommentModal" tabindex="-1" aria-labelledby="addCommentModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="processos/proc_adicionar_coment.php" method="post">
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
<div class="container-fluid py-5">
    <div class="container">
        <div class="text-center">
            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addCommentModal">Adicionar Comentário</button>
        </div>
        <br>
        <br>
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