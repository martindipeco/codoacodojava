<%-- 
    Document   : home
    Created on : 8 dic. 2023, 17:06:11
    Author     : W10-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Conferencia Buenos Aires</title>
    <!-- Add Bootstrap CSS link -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Link to the external CSS file -->
    <link rel="stylesheet" type="text/css" href="CSS\styles.css">
    <script src="JS\script.js"></script>
    <script>
        var successParam = '<%= request.getParameter("success") %>';
    </script>
    <script src="JS\messages.js"></script>
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
                <a class="nav-link" href="#myCarousel">La Conferencia</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#oradores">Oradores</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#lugar-fecha">Lugar y Fecha</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#formulario">Quiero ser orador</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#tickets" style="color: #66cc66;">Comprar Tickets</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="FrontController?accion=back_office">Back Office</a> <!-- This link will send a request to the FrontController with the parameter accion set to "back_office" when clicked -- cambiar estilo -->
            </li>
        </ul>
    </div>
</nav>

<!-- Carousel (Image Slider) with Overlay Text -->
<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="2000">
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <div class="carousel-caption">
        <h3>Conferencia Buenos Aires</h3>
        <p>Buenos Aires llega por primera vez a Argentina. Un evento para compartir con nuestra comunidad el conocimiento y la experiencia de los expertos que están creando el futuro de internet. Vení a conocer a miembros del evento, a otros estudiantes de Codo-a-codo y los oradores de primer nivel que tenemos para vos. ¡Te esperamos!</p>
        <!-- New div for buttons -->
        <div class="text-right">
            <a href="#" class="btn btn-outline-secondary mr-2">Quiero ser orador</a>
            <a href="#" class="btn btn-success">Comprar tickets</a>
        </div>
    </div>

    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="imagenes\ba1.jpg" alt="Image 1" class="d-block w-100">
        </div>
        <div class="carousel-item">
            <img src="imagenes\ba2.jpg" alt="Image 2" class="d-block w-100">
        </div>
        <div class="carousel-item">
            <img src="imagenes\ba3.jpg" alt="Image 3" class="d-block w-100">
        </div>
    </div>
    <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>


<!-- Cards -->
<div id="oradores" class="container mt-5">
    <!-- General Title and Subtitle -->
    <p class="text-center">CONOCE A LOS</p>
    <h2 class="text-center">ORADORES</h2>

    <div class="row">
        <div class="col-md-4">
            <div class="card">
                <img src="imagenes\steve.jpg" class="card-img-top" alt="Card 1">
                <div class="card-body">
                    <div class="row">
                         <!-- Non-Interactive Text with Colored Background -->
                         <div class="col-auto">
                            <div class="d-inline-block bg-warning text-black text-center py-1 px-2 mr-2 rounded font-weight-bold">JavaScript</div>
                            <div class="d-inline-block bg-info text-white text-center py-1 px-2 rounded font-weight-bold">React</div>
                        </div>
                    </div>
                    <h5 class="card-title">Steve Jobs</h5>
                    <p class="card-text">Steven Paul Jobs fue un empresario, diseñador industrial, magnate empresarial, propietario de medios e inversor estadounidense. Fue cofundador y presidente ejecutivo de Apple​ y máximo accionista de The Walt Disney Company</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <img src="imagenes\bill.jpg" class="card-img-top" alt="Card 2">
                <div class="card-body">
                    <div class="row">
                        <!-- Non-Interactive Text with Colored Background -->
                        <div class="col-auto">
                           <div class="d-inline-block bg-warning text-black text-center py-1 px-2 mr-2 rounded font-weight-bold">JavaScript</div>
                           <div class="d-inline-block bg-info text-white text-center py-1 px-2 rounded font-weight-bold">React</div>
                        </div>
                    </div>
                    <h5 class="card-title">Bill Gates</h5>
                    <p class="card-text">William Henry Gates III, más conocido como Bill Gates, es un magnate empresarial, desarrollador de software, inversor, autor y filántropo estadounidense. Es cofundador de Microsoft, junto con su difunto amigo de la infancia Paul Allen</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <img src="imagenes\ada.jpeg" class="card-img-top" alt="Card 3">
                <div class="card-body">
                    <div class="row">
                        <!-- Non-Interactive Text with Colored Background -->
                        <div class="col-auto">
                           <div class="d-inline-block bg-secondary text-white text-center py-1 px-2 mr-2 rounded font-weight-bold">Negocios</div>
                           <div class="d-inline-block bg-danger text-white text-center py-1 px-2 rounded font-weight-bold">StartUps</div>
                        </div>
                    </div>
                    <h5 class="card-title">Ada Lovelace</h5>
                    <p class="card-text">Augusta Ada King, condesa de Lovelace, conocida como Ada Lovelace, fue una matemática y escritora británica, célebre sobre todo por su trabajo acerca de la computadora mecánica de uso general de Charles Babbage</p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- ¿Segundo carousel? -->
<div id="lugar-fecha" class="container mt-5">
    <div class="row">
        <!-- Image on the left half of the screen -->
        <div class="col-md-6">
            <img src="imagenes/honolulu.jpg" alt="Fixed Image" class="img-fluid">
        </div>

        <!-- Text on the right half with grey background -->
        <div class="col-md-6 custom-bg-grey text-white p-4">
            <h2>Bs. As. Octubre</h2>
            <p>Buenos Aires es la capital de Argentina. Su costa en nada se parece a esta paradisíaca playa de Honolulu</p>
            <a href="#" class="btn btn-outline-secondary mr-2">Conocé más</a>
        </div>
    </div>
</div>


<!-- Contact Form -->
<div id="formulario" class="container mt-5 mb-5">
    <p class="text-center">CONVIERTETE EN</p>
    <h2 class="text-center">ORADOR</h2>
    <p class="text-center">Convertite en orador para dar una <a href="#">charla ignite</a> Contanos de qué querés hablar!</p>
    <div class="row justify-content-center">
        <div class="col-md-6">
            <form action="FrontController" method="post"> <!-- Specify the servlet and method -->
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="nombre"></label>
                        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="mail"></label>
                        <input type="email" class="form-control" id="mail" name="mail" placeholder="Email">
                    </div>
                </div>
                <div class="form-group">
                    <label for="tema"></label>
                    <textarea class="form-control" rows="4" id="tema" name="tema" placeholder="¿Sobre qué querés hablar?"></textarea>
                </div>
                <!-- hidden field that indicates the action to be performed -->
                <input type="hidden" name="identifica-form" value="form-inscripcion">
                <!-- Submit button with full-width and custom class -->
                <button type="submit" class="btn btn-light-green btn-block" id="enviar-orador">Enviar</button>
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

<!-- Separador -->
<hr>
<!-- Comprar Tickets -->
<div id="tickets" class="container mt-5 mb-5">
    <p class="text-center">QUIERO COMPRAR</p>
    <h2 class="text-center">TICKETS</h2>
    <br>
    <div class="row">
        <div class="col-md-4">
            <div class="card recuadro-azul">
                <div class="card-body text-center">
                    <h2>Estudiantes</h2>
                    <p>Tienen un descuento del</p>
                    <h2>80 %</h2>
                    <p>*presentar documentación</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card recuadro-verde">
                <div class="card-body text-center">
                    <h2>Trainees</h2>
                    <p>Tienen un descuento del</p>
                    <h2>50 %</h2>
                    <p>*presentar documentación</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card recuadro-naranja">
                <div class="card-body text-center">
                    <h2>Juniors</h2>
                    <p>Tienen un descuento del</p>
                    <h2>15 %</h2>
                    <p>*presentar documentación</p>
                </div>
            </div>
        </div>
    </div>
    <br>
    <p class="text-center">VENTA</p>
    <h2 class="text-center">VALOR DE TICKET: $200</h2>
    <div class="row justify-content-center">
        <div class="col-md-6">
            <form>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="name"></label>
                        <input type="text" class="form-control" id="name" placeholder="Nombre">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="surname"></label>
                        <input type="text" class="form-control" id="surname" placeholder="Apellido">
                    </div>
                </div>
                <div classs="form-group">
                    <label for="email"></label>
                    <input type="email" class="form-control mb-4" id="email" placeholder="Email">
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="amount">Cantidad</label>
                        <input type="number" class="form-control" id="amount" placeholder="Ingrese cantidad" min="1" max="100" step="1">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="category">Categoría</label>
                        <select class="form-control" id="category">
                            <option value="sinDescuento">Sin descuento</option>
                            <option value="estudiante">Estudiante</option>
                            <option value="trainee">Trainee</option>
                            <option value="junior">Junior</option>
                        </select>
                    </div>
                </div>
                <div classs="form-group bg-primary">
                    <label for="total">Total a Pagar: $</label>
                    <input type="number" class="form-control mb-4" id="total" placeholder="" readonly>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <button type="button" class="btn btn-danger btn-block" id="delete">Borrar</button>
                    </div>
                    <div class="form-group col-md-6">
                        <button type="button" class="btn btn-warning btn-block" id="summary">Resumen</button>
                    </div>
                </div>
                <!-- Submit button with full-width and custom class -->
                <button type="submit" class="btn btn-light-green btn-block" id="comprar-tickets">Comprar</button>
            </form>
        </div>
    </div>
</div>

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
