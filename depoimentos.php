<?php
// Inclui o arquivo de conexão com o banco de dados
include 'bd/conecta.php';
// Inicia a sessão
session_start();
// Inclui o menu no topo da página
include 'menu.php'; 
// Armazena o ID do cliente logado (se disponível) para uso posterior
$id_cliente_logado = $_SESSION['id_cliente'];
?>

<!-- Cabeçalho da página com título -->
<div class="container-fluid page-header py-5">
    <h1 class="text-center text-white display-6">Depoimentos</h1>
</div>

<!-- Modal para adicionar um novo comentário -->
<div class="modal fade" id="addCommentModal" tabindex="-1" aria-labelledby="addCommentModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="processos/proc_adicionar_coment.php" method="post">
                <!-- Cabeçalho do modal -->
                <div class="modal-header">
                    <h5 class="modal-title" id="addCommentModalLabel">Adicionar Comentário</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fechar"></button>
                </div>
                <!-- Corpo do modal com campos para adicionar o comentário -->
                <div class="modal-body">
                    <!-- Campo de texto para o comentário -->
                    <div class="mb-3">
                        <label for="conteudo" class="form-label">Comentário</label>
                        <textarea name="conteudo" class="form-control" id="conteudo" rows="3" maxlength="520" required></textarea>
                    </div>
                    <!-- Campo para selecionar a nota -->
                    <div class="mb-3">
                        <label for="nota" class="form-label">Nota (0 a 10)</label>
                        <input type="number" class="form-control" id="nota" name="nota" min="0" max="10" required>
                    </div>
                </div>
                <!-- Rodapé do modal com botões de ação -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-primary">Adicionar Comentário</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal para editar um comentário existente -->
<div class="modal fade" id="editCommentModal" tabindex="-1" aria-labelledby="editCommentModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="processos/proc_editar_coment.php" method="post">
                <!-- Campo oculto para armazenar o ID do comentário a ser editado -->
                <input type="hidden" name="id_comentario" id="id_comentario">
                <!-- Cabeçalho do modal -->
                <div class="modal-header">
                    <h5 class="modal-title" id="editCommentModalLabel">Editar Comentário</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fechar"></button>
                </div>
                <!-- Corpo do modal com campos para edição -->
                <div class="modal-body">
                    <!-- Campo de texto para o comentário -->
                    <div class="mb-3">
                        <label for="conteudo" class="form-label">Comentário</label>
                        <textarea name="conteudo" class="form-control" id="conteudo" rows="3" maxlength="520" required></textarea>
                    </div>
                    <!-- Campo para editar a nota -->
                    <div class="mb-3">
                        <label for="nota" class="form-label">Nota (0 a 10)</label>
                        <input type="number" class="form-control" id="nota" name="nota" min="0" max="10" required>
                    </div>
                </div>
                <!-- Rodapé do modal com botões de ação -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-primary">Atualizar Comentário</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Seção de comentários -->
<div class="container-fluid py-5">
    <div class="container">
        <?php if (isset($_SESSION['nome'])): ?>
            <!-- Botão para abrir o modal de adicionar comentário, disponível apenas para usuários logados -->
            <div class="text-center">
                <button class="btn btn-outline-secondary ms-3 my-auto" data-bs-toggle="modal" data-bs-target="#addCommentModal">
                    Adicionar Comentário
                </button>
            </div>
        <?php else: ?>
            <!-- Mensagem para usuários não logados -->
            <div class="text-center">
                <a href="login/index.php" class="btn btn-outline-secondary ms-3 my-auto">Faça o login para comentar!</a>
            </div>
        <?php endif; ?>

        <br><br>
        <h4 class="text-dark text-center mb-4">Comentários dos Clientes</h4>
        <div class="row">
            <?php
            // Consulta para buscar os comentários no banco de dados
            $query = "SELECT c.id_comentario, c.conteudo, c.nota, cl.nome_cliente, cl.tipo, cl.id_cliente AS id_cliente_comentario
                      FROM comentarios c
                      JOIN cadastro_cliente cl ON c.id_cliente = cl.id_cliente";
            $result = mysqli_query($conexao, $query);

            // Verifica se há comentários para exibir
            if (mysqli_num_rows($result) > 0) {
                // Loop para exibir cada comentário
                while ($row = mysqli_fetch_assoc($result)) {
                    echo '<div class="col-md-4 mb-3">';
                    echo '<div class="bg-white p-4 rounded shadow">';
                    
                    // Exibe o nome do cliente, o conteúdo do comentário e a nota
                    echo '<p class="mb-0 text-dark"><strong>' . htmlspecialchars($row['nome_cliente']) . '</strong></p>';
                    echo '<p class="mb-0 text-dark">' . htmlspecialchars($row['conteudo']) . '</p>';
                    echo '<p class="mb-0 text-muted">Nota: ' . htmlspecialchars($row['nota']) . '</p>';
                    
                    // Verifica se o comentário pertence ao cliente logado
                    if ($row['id_cliente_comentario'] == $id_cliente_logado) {
                        echo '<div class="mt-3">';
                        // Botão para abrir o modal de edição
                        echo '<button class="btn btn-outline-primary me-3" onclick="openEditModal(' . $row['id_comentario'] . ')">Editar</button>';
                        // Formulário para excluir o comentário
                        echo '<form action="processos/proc_deletar_comentario.php" method="POST" style="display:inline;">';
                        echo '<input type="hidden" name="id_comentario" value="' . $row['id_comentario'] . '">';
                        echo '<button type="submit" class="btn btn-outline-danger">Excluir</button>';
                        echo '</form>';
                        echo '</div>';
                    }

                    echo '</div>';
                    echo '</div>';
                }
            } else {
                // Mensagem caso não existam comentários
                echo '<p class="text-center text-muted">Nenhum comentário disponível.</p>';
            }
            ?>
        </div>
    </div>
</div>

<?php
// Inclui o rodapé da página
include 'footer.php';
?>