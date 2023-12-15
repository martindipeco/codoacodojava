<%-- 
    Document   : back_office
    Created on : 9 dic. 2023, 15:55:04
    Author     : W10-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- Importo clases con las que voy a trabajar -->
<%@page import="misClases.Orador"%>
<%@page import="misClases.OradorDAO"%>

<!-- También necesito importar la funcionalidad de lista -->
<%@page import="java.util.List"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Back Office</title>
    <!-- Add Bootstrap CSS link -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Link to the external CSS file -->
    <link rel="stylesheet" type="text/css" href="CSS\styles.css">
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
                <a class="nav-link" href="#">Lugar para futuro link</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="FrontController?accion=home" style="color: #66cc66;">Volver a Home</a>
            </li>
        </ul>
    </div>
</nav>

<!-- Tabla mostrando listado de oradores -->
<div class ="container">
    <h1 class = "text-primary">Panel de Control</h1>
    
    <div class="row">
        <table>
            <thead>
                <th>Id Orador</th>
                <th>Nombre</th>
                <th>Mail</th>
                <th>Tema</th>
                <th>Activo</th>
                <th>Editar</th>
                <th>Eliminar</th>
            </thead>
            
            <!-- Inserto código Java -->
            <%
                List<Orador> oradorLista = null; 
                OradorDAO oradorDao = new OradorDAO();
                oradorLista = oradorDao.buscarTodos();
                //int totalFacturado=0;
                
                for(int i=0; i<oradorLista.size();i++)
                {
                String rutaEditar="FrontController?accion=editar&id="+oradorLista.get(i).getId_orador();
                String rutaEliminar="FrontController?accion=eliminar&id="+oradorLista.get(i).getId_orador();
                
                String esActivo;
                
                if(oradorLista.get(i).isActivo())
                {
                    esActivo = "SI";
                }
                else
                {
                    esActivo = "NO";
                }
                
                //} cierre de llave eliminado momentáneamente para que lo que devuelve el for entre en la tabla
            
            %>
            
            <!-- agrego un "=" después del % para directly outputting the result of a Java expression into the HTML.-->
            <!-- sin el "=" y solo "%" s used for embedding Java code without automatically outputting the result-->
            <tbody>
                <tr>
                    <td><%= oradorLista.get(i).getId_orador() %></td>
                    <td><%= oradorLista.get(i).getNombre() %></td>
                    <td><%= oradorLista.get(i).getMail() %></td>
                    <td><%= oradorLista.get(i).getTema() %></td>
                    <td><%= esActivo %></td>
                    <td class = "text-center"><a href="<%= rutaEditar %>" style="color: green;">E</a></td>
                    <td class = "text-center"><a href="<%= rutaEliminar %>" style="color: red;">X</a></td>
                </tr>
            <!-- recién ahora cierro el for-->    
            <% 
            //totalFacturado+=ticketLista.get(i).totalFacturado();    
            } 
            %>
            <!-- si quisiera agregar total facturado, debo agregar un row, y dejar td en blanco y que en el último td aparezca el totalFacturado-->  
            </tbody>
            
            
        </table>
        
    </div>
</div>

<div class ="container">
    <a class =" btn btn-success col-2 m-2" href="FrontController?accion=home">Volver</a>
</div>


<!-- Bootstrap Modal for Success Message -->
<div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="successModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="successModalLabel">Edición completada</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                La edición fue realizada con éxito.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
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
