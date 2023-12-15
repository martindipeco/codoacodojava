/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package misClases;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author W10-PC
 */
public class Conexion {
    
    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/";
    private static final String DB = "basegrupoi";
    private static final String USER = "root";
    private static final String PASSWORD = "root";
    
    private static Connection connection;
    
    //constructor privado
    private Conexion(){};
    
    public static Connection getConexion(){
        if (connection == null)
        {
            try
            {
                Class.forName(DRIVER);
                connection = DriverManager.getConnection(URL+DB, USER, PASSWORD);
                System.out.println("Conexión OK");
            }
            catch(ClassNotFoundException ex)
            {
                System.out.println("Error al cargar los drivers");
            }
            catch(SQLException ex)
            {
                System.out.println("Error al conectar a la base de datos");
                ex.printStackTrace();  // Print the exception details for debugging
            }
        }
        return connection;
    }
    
}
