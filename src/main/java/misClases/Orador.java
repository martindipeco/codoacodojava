/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package misClases;

/**
 *
 * @author W10-PC
 */
public class Orador {
    
    private int id_orador;
    private String nombre;
    private String mail;
    private String tema;
    private boolean activo;
    
    //agrego constructor vacío, con todos los atributos menos id, y con todos los atributos
    public Orador(){}

    public Orador(String nombre, String mail, String tema, boolean activo) {
        this.nombre = nombre;
        this.mail = mail;
        this.tema = tema;
        this.activo = activo;
    }

    public Orador(int id_orador, String nombre, String mail, String tema, boolean activo) {
        this.id_orador = id_orador;
        this.nombre = nombre;
        this.mail = mail;
        this.tema = tema;
        this.activo = activo;
    }
            
    //getters y setters
    public int getId_orador() {
        return id_orador;
    }

    public void setId_orador(int id_orador) {
        this.id_orador = id_orador;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTema() {
        return tema;
    }

    public void setTema(String tema) {
        this.tema = tema;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public boolean isActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }

    @Override
    public String toString() {
        return "Orador{" + "id_orador=" + id_orador + ", nombre=" + nombre + ", tema=" + tema + ", mail=" + mail + ", activo=" + activo + '}';
    }
    
    
}
