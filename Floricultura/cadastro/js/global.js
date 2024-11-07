(function ($) {
    'use strict';

    // Máscara de CPF
    function mascaraCPF(campo) {
        let cpf = campo.value;
        
        // Remove caracteres que não sejam números
        cpf = cpf.replace(/\D/g, "");
        
        // Aplica a máscara 000.000.000-00
        cpf = cpf.replace(/^(\d{3})(\d)/, "$1.$2");
        cpf = cpf.replace(/^(\d{3})\.(\d{3})(\d)/, "$1.$2.$3");
        cpf = cpf.replace(/\.(\d{3})(\d)/, ".$1-$2");
        
        // Atualiza o valor do campo com o CPF formatado
        campo.value = cpf;
    }
    
    // Aplica a máscara quando o usuário digita no campo CPF
    document.getElementById('cpf').addEventListener('input', function() {
        mascaraCPF(this);
    });

    /*[ Select 2 Config ] ===========================================================*/
    
    try {
        var selectSimple = $('.js-select-simple');
    
        selectSimple.each(function () {
            var that = $(this);
            var selectBox = that.find('select');
            var selectDropdown = that.find('.select-dropdown');
            selectBox.select2({
                dropdownParent: selectDropdown
            });
        });
    
    } catch (err) {
        console.log(err);
    }
    

})(jQuery);
