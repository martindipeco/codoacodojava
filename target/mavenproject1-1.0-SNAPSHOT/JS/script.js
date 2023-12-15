document.addEventListener("DOMContentLoaded", function () {
    var cantidadTicketsInput = document.getElementById("amount");
    var totalInput = document.getElementById("total");
    var botonResumen = document.getElementById("summary");
    var botonBorrar = document.getElementById("delete");
    var categoriaSelect = document.getElementById("category");
    
    

    botonResumen.addEventListener("click", function () {
        
        var cantidadTickets = parseInt(cantidadTicketsInput.value);
        if (cantidadTickets > 0 &&  !isNaN(cantidadTickets))
        {
            var precio = 200; 
            var descuento; 
            var categoria = categoriaSelect.value;
            switch (categoria)
            {
                case "estudiante":
                    descuento = 0.2;
                    break;
                case "trainee":
                    descuento = 0.5;
                    break;
                case "junior":
                    descuento = 0.85;
                    break;
                default:
                    descuento = 1; 
            }
            var total = cantidadTickets * precio * descuento;
            totalInput.value = total;
        } 
        else {
            alert("Por favor, ingresa una cantidad correcta.");
        }
    });

    botonBorrar.addEventListener("click", function(){
        cantidadTicketsInput.value = '';
        totalInput.value = '';
        categoriaSelect.value = "sinDescuento";
    });
});

