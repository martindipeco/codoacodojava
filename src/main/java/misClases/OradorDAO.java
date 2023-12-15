/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package misClases;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author W10-PC
 */
public class OradorDAO {
    
    private Connection con = null;
    
    public OradorDAO(){
        con = Conexion.getConexion();
    }
    
    //métodos CRUD
    //crear un orador sin id
    public void agregarOrador(Orador orador)
    {
        String sql = "INSERT INTO orador(nombre, tema, mail, activo) VALUES (?, ?, ?, true)"; //podria agregar id_orador y un ? más
        
        try {
            PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            
            ps.setString(1, orador.getNombre());
            ps.setString(2, orador.getTema());
            ps.setString(3, orador.getMail());
            
            ps.executeUpdate();
            
            ResultSet rs = ps.getGeneratedKeys();
            
            //estoy insertando una sola entrada
            if(rs.next())
            {
                orador.setId_orador(rs.getInt(1)); //indexa a partir de 1. el index 1 es el primero y el único en este caso
                System.out.println("Orador agregado exitosamente");
            }
            ps.close();//cierro el statement para liberar memoria
        } 
        
        catch (SQLException ex) {
            Logger.getLogger(OradorDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error al acceder a la tabla orador");
        }
    }
    
    //devuelve todos los registros
    public List<Orador> buscarTodos()
    {
        List<Orador> oradorLista = new ArrayList<>();
        
        String sql = "SELECT * FROM orador";
        
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next())
            {
                //voy generando un objeto orador, y al final lo agrego a la lista
                Orador orador = new Orador();
                orador.setId_orador(rs.getInt("id_orador"));
                orador.setNombre(rs.getString("nombre"));
                orador.setTema(rs.getString("tema"));
                orador.setMail(rs.getString("mail")); //se podría usar el mail que se pasa por parámetro
                orador.setActivo(rs.getBoolean("activo"));
                
                oradorLista.add(orador);
            }
            ps.close();//cierro el statement para liberar memoria
        } 
        
        catch (SQLException ex) {
            Logger.getLogger(OradorDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error al acceder a la tabla orador");
        }
        return oradorLista;
    }
    
    //buscar por ID
    public Orador buscarPorID(int id){
        Orador orador = null;
        
        String sql = "SELECT id_orador, nombre, mail, tema, activo FROM orador WHERE id_orador = ?";
        
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            
            ps.setInt(1, id);
            
            ResultSet rs = ps.executeQuery();
            //debería devolver solo uno
            //si fuera una lista, usar while
            if(rs.next())
            {
                //genero un objeto orador "materializando" (?) los datos de la tabla
                orador = new Orador();
                orador.setId_orador(rs.getInt("id_orador")); //se podría usar el id que se pasa por parámetro
                orador.setNombre(rs.getString("nombre"));
                orador.setTema(rs.getString("tema"));
                orador.setMail(rs.getString("mail")); 
                orador.setActivo(rs.getBoolean("activo"));
            }
            else
            {
                System.out.println("No se encontró orador registrado con Id: " + id);
            }
            ps.close();//cierro el statement para liberar memoria
        } 
        
        catch (SQLException ex) {
            Logger.getLogger(OradorDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error al acceder a la tabla orador");
        }
        return orador;
    }
    
    //buscar por mail
    public Orador buscarPorMail(String mail){
        Orador orador = null;
        
        String sql = "SELECT id_orador, nombre, mail, tema, activo FROM orador WHERE mail = ?";
        
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            
            ps.setString(1, mail);
            
            ResultSet rs = ps.executeQuery();
            //debería devolver solo uno
            //si fuera una lista, usar while
            if(rs.next())
            {
                //genero un objeto orador "materializando" (?) los datos de la tabla
                orador = new Orador();
                orador.setId_orador(rs.getInt("id_orador"));
                orador.setNombre(rs.getString("nombre"));
                orador.setTema(rs.getString("tema"));
                orador.setMail(rs.getString("mail")); //se podría usar el mail que se pasa por parámetro
                orador.setActivo(rs.getBoolean("activo"));
            }
            else
            {
                System.out.println("No se encontró orador registrado con mail " + mail);
            }
            ps.close();//cierro el statement para liberar memoria
        } 
        
        catch (SQLException ex) {
            Logger.getLogger(OradorDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error al acceder a la tabla orador");
        }
        return orador;
    }
    
    //TODO: buscar por nombre y / o apellido y que devuelva una lista
    
    //UPDATE para editar datos de nombre y / o apellido y/ o mail
    public void editaOrador(Orador orador)
    {
        String sql = "UPDATE orador SET nombre = ?, tema = ?, mail = ?, activo = ? WHERE id_orador = ?";
        
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            
            ps.setString(1, orador.getNombre());
            ps.setString(2, orador.getTema());
            ps.setString(3, orador.getMail());
            ps.setBoolean(4, orador.isActivo());
            ps.setInt(5, orador.getId_orador());
            
            //si ejecuto el update exitosamente, debo generar 1 respuesta
            int exito = ps.executeUpdate();
            
            if(exito == 1)
            {
                System.out.println("Se modificó el orador exitosamente");
            }
            else
            {
                System.out.println("No se pudo actualizar la tabla");
            }
            ps.close();//cierro el statement para liberar memoria
        } 
        
        catch (SQLException ex) {
            Logger.getLogger(OradorDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error al acceder a la tabla orador");
        }
    }
    
    //borrado lógico seteando activo a false
    //se podría hacer pasando solamente el id_orador
    public void setearInactivo(Orador orador)
    {
        String sql = "UPDATE orador SET activo = false WHERE id_orador = ?";
        
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            
            ps.setInt(1, orador.getId_orador());
            
            //si ejecuto el update exitosamente, debo generar 1 respuesta
            int exito = ps.executeUpdate();
            
            if(exito == 1)
            {
                System.out.println("El orador pasó a inactivo");
            }
            else
            {
                System.out.println("No se pudo actualizar la tabla");
            }
            ps.close();//cierro el statement para liberar memoria
        } 
        
        catch (SQLException ex) {
            Logger.getLogger(OradorDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("No se pudo acceder a la tabla orador");
        }
    }
    
    //borrado lógico por id_orador
    public void setearInactivoPorID(int id)
    {
        String sql = "UPDATE orador SET activo = false WHERE id_orador = ?";
        
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            
            ps.setInt(1, id);
            
            //si ejecuto el update exitosamente, debo generar 1 respuesta
            int exito = ps.executeUpdate();
            
            if(exito == 1)
            {
                System.out.println("El orador pasó a inactivo");
            }
            else
            {
                System.out.println("No se pudo actualizar la tabla");
            }
            ps.close();//cierro el statement para liberar memoria
        } 
        
        catch (SQLException ex) {
            Logger.getLogger(OradorDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("No se pudo acceder a la tabla orador");
        }
    }
    
    //borrado físico - danger!
    public void destruirOradorPorID(int id)
    {
        String sql = "DELETE from orador WHERE id_orador = ?";
        
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            
            ps.setInt(1, id);
            
            //si ejecuto el update exitosamente, debo generar 1 respuesta
            int exito = ps.executeUpdate();
            
            if(exito == 1)
            {
                System.out.println("El orador fue borrado del registro");
            }
            else
            {
                System.out.println("No se pudo actualizar la tabla");
            }
            ps.close();//cierro el statement para liberar memoria
        } 
        
        catch (SQLException ex) {
            Logger.getLogger(OradorDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("No se pudo acceder a la tabla orador");
        }
    }
}
