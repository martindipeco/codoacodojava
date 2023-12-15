/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package misClases;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;



/**
 *
 * @author W10-PC
 */
@WebServlet(name = "FrontController", urlPatterns = {"/FrontController"})
public class FrontController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet FrontController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FrontController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        String accion = null;
        OradorDAO oradorDao = new OradorDAO();
        
        RequestDispatcher dispatcher = null;
        accion = request.getParameter("accion");
        
        //se debería convertir en un switch / case
        
        if(accion == null || accion.isEmpty())
        {
            dispatcher = request.getRequestDispatcher("VISTAS/home.jsp");
        }
        else if(accion.equals("comprar")) //puede ser otra String
        {
            dispatcher = request.getRequestDispatcher("VISTAS/comprar.jsp"); //todavía no existe
        }
        
        else if (accion.equals("back_office")) 
        {
            dispatcher = request.getRequestDispatcher("VISTAS/back_office.jsp");
        }
        
        else if (accion.equals("home")) 
        {
            dispatcher = request.getRequestDispatcher("VISTAS/home.jsp");
        }
        
        else if (accion.equals("editar")) 
        {
            int id= Integer.parseInt(request.getParameter("id"));
            //include the id as a request attribute before dispatching to the JSP file
            request.setAttribute("oradorId", id);
            //objectId is the name of the attribute, and id is the value that will be passed to the JSP
            dispatcher = request.getRequestDispatcher("VISTAS/editar.jsp");
        }
        
        else if (accion.equals("eliminar")) 
        {
            int id= Integer.parseInt(request.getParameter("id"));
            oradorDao.setearInactivoPorID(id); 
            //recargo la misma página
            dispatcher = request.getRequestDispatcher("VISTAS/back_office.jsp");
        }

        dispatcher.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        
        String queForm = request.getParameter("identifica-form");
        
        //instancio un oradorDAO para acceder a sus metodos
        OradorDAO oradorDao = new OradorDAO();
        
        if ("form-inscripcion".equals(queForm))
        {
            //toda la lógica del form de inscripción
            String nombre = request.getParameter("nombre");
            String mail = request.getParameter("mail");
            String tema = request.getParameter("tema");

            // Validate and process the data as needed
            Orador orador = new Orador(nombre, mail, tema, true);

            

            //si conseguimos insertar el orador, redirigimos a home de vuelta
            //mostramos cartel de exito 

            oradorDao.agregarOrador(orador);

            //cargamos de vuelta la home, con parámetro para cargar cartel de éxito
            RequestDispatcher dispatcher = null;
            dispatcher = request.getRequestDispatcher("VISTAS/home.jsp?success=true");
            dispatcher.forward(request, response);
        }
        else if("form-edicion".equals(queForm))
        {
            //toda la lógica del form de edición
            int id = Integer.parseInt(request.getParameter("id-ed"));
            String nombre = request.getParameter("nombre-ed");
            String mail = request.getParameter("mail-ed");
            String tema = request.getParameter("tema-ed");
            boolean activo = Boolean.parseBoolean(request.getParameter("activo-ed"));
            
            //instancio un orador con todos sus parametros
            Orador oradorEditado = new Orador(id, nombre, mail, tema, activo);
            
            //utilizo este orador para el metodo editar por id
            oradorDao.editaOrador(oradorEditado);
            
            //cargamos de vuelta el back office, con parámetro para cargar cartel de éxito
            RequestDispatcher dispatcher = null;
            dispatcher = request.getRequestDispatcher("VISTAS/back_office.jsp?success=true");
            dispatcher.forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
