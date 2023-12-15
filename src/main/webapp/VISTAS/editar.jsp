<%-- 
    Document   : editar
    Created on : 14 dic. 2023, 08:26:29
    Author     : W10-PC
--%>

<%@page import="misClases.OradorDAO"%>
<%@page import="misClases.Orador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edición</title>
    <!-- Add Bootstrap CSS link -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Link to the external CSS file -->
    <link rel="stylesheet" type="text/css" href="CSS\styles.css">
</head>

<body>

<!-- Upper Menu Bar -->
<nav id="upper-menu" class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">
        <img src="imagenes\codoacodo.png" alt="My Logo" style="max-height: 70px;">
        Conferencia Buenos Aires
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="FrontController?accion=back_office">Ir a Back Office</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="FrontController?accion=home" style="color: #66cc66;">Volver a Home</a>
            </li>
        </ul>
    </div>
</nav>

<%
    // Retrieve the id from the request attribute
    int oradorId = (int) request.getAttribute("oradorId");
    
    //instancio un OradorDAO para acceder a sus métodos
    OradorDAO oradorDao = new OradorDAO();
    // ahora instancio el orador existente para editarlo
    Orador oradorEditar = oradorDao.buscarPorID(oradorId);

%>

<!-- Contact Form //EDITAR -->
<div id="formulario-editar" class="container mt-5 mb-5">
    <p class="text-center">EDITAR UN</p>
    <h2 class="text-center">ORADOR</h2>
    <div class="row justify-content-center">
        <div class="col-md-6">
            <form action="FrontController" method="post"> <!-- Specify the servlet and method -->
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="nombre"></label>
                        <input type="text" class="form-control" id="nombre-ed" name="nombre-ed" placeholder="Confirmar: <%= oradorEditar.getNombre() %>">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="mail"></label>
                        <input type="email" class="form-control" id="mail-ed" name="mail-ed" placeholder="Confirmar: <%= oradorEditar.getMail() %>">
                    </div>
                </div>
                <div class="form-group">
                    <label for="tema"></label>
                    <textarea class="form-control" rows="4" id="tema-ed" name="tema-ed" placeholder="Confirmar: <%= oradorEditar.getTema() %>"></textarea>
                </div>
                <!-- campo oculto para el id -->
                <input type="hidden" name="id-ed" value="<%= oradorEditar.getId_orador() %>">
                <!-- campo oculto para el activo -->
                <input type="hidden" name="activo-ed" value="<%= oradorEditar.isActivo() %>">
                
                <!-- hidden field that indicates the action to be performed -->
                <input type="hidden" name="identifica-form" value="form-edicion">
                <!-- Submit button with full-width and custom class -->
                <button type="submit" class="btn btn-light-green btn-block" id="editar-orador">Editar</button>
                <!-- TODO: agregar lógica al botón de submit para exito o error-->
            </form>
        </div>
    </div>
</div>

<!-- Bootstrap Modal for Success Message -->
<div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="successModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="successModalLabel">Solicitud recibida!</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Su inscripción fue realizada con éxito.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>


<a class =" btn btn-success col-2 m-2" href="FrontController?accion=home">Volver</a>
<!-- Footer -->
<footer class="custom-indigo-bg text-white py-3">
    <div class="container">
        <div class="row footer-links">
            <div class="col">
                <a href="#">Preguntas frecuentes</a>
            </div>
            <div class="col">
                <a href="#">Contactanos</a>
            </div>
            <div class="col">
                <a href="#">Prensa</a>
            </div>
            <div class="col">
                <a href="#">Conferencias</a>
            </div>
            <div class="col">
                <a href="#">Términos y Condiciones</a>
            </div>
            <div class="col">
                <a href="#">Privacidad</a>
            </div>
            <div class="col">
                <a href="#">Estudiantes</a>
            </div>
        </div>
    </div>
</footer>

<!-- Add Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
