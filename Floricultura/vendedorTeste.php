<?php
    include 'C:\xampp\htdocs\Floricultura/banco_de_dados/conecta.php';
    include 'menu.php';
?>

<div style="padding-top: 80px;">
    <h2>Bem vindo Vendedor!</h2>
</div>


<!-- NÃO MEXER NO CÓDIGO ABAIXO -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        setTimeout(function () {
            const spinner = document.getElementById("spinner");
            if (spinner) {
                spinner.classList.remove("show");
            }
        }, 500);
    });
</script>
</body>
</html>