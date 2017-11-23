package clases;

import java.sql.ResultSet;
import java.sql.SQLException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author joshua
 */
public class persona {
    private String usr="";
    private String psw="";
    private String psw2=" ";
    private String boleta="";
    private String nombre="";
    private String apellPat="";
    private String apellMat="";
    private String usuario="";
    private String email="";
    private String rol="";
    private String estado="";
    private String imagen="";

    
    public int id=0;
    
    public persona(String usr, String psw){
        this.usr=usr;
        this.psw=psw;
        
    }
    public persona(){
        
    }
    
    public String inicio() throws SQLException{
        cDatos dat= new cDatos();
        dat.conectar();
        ResultSet msj=dat.ejecuta("call spIniciaSes('"+usr+"','"+psw+"')");
        msj.next();
        String mensaje=msj.getString("mensaje");
        return mensaje;
    }
    public void todo(String id) throws SQLException{
        cDatos dat= new cDatos();
        dat.conectar();
        ResultSet msj=dat.ejecuta("select * from persona p where p.id='"+id+"'");
        msj.next();
        boleta=msj.getString("boleta");
        nombre=msj.getString("nombre");
        apellPat=msj.getString("apellPat");
        apellMat=msj.getString("apellMat");
        usuario=msj.getString("usuario");
        email=msj.getString("email");
        rol=msj.getString("idRol");
        estado=msj.getString("estado");
        imagen=msj.getString("imagen");
        this.id=Integer.parseInt(id);
    }
    
    public String guardaTodo() throws SQLException{
        
        cDatos dat= new cDatos();
        dat.conectar();
        ResultSet msj=dat.ejecuta("call spGuardaPer("+id+", '"+boleta+"', '"+nombre+"', '"+apellPat+"','"+apellMat+"','"+usuario+"', '"+psw+"', '"+email+"', "+rol+","+estado+", '"+psw2+"', '"+imagen+"');");
        msj.next();
        String mensaje=msj.getString(1);
        return mensaje;
    }
    
    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }
    
    public String getBoleta() {
        return boleta;
    }

    public void setBoleta(String boleta) {
        this.boleta = boleta;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellPat() {
        return apellPat;
    }

    public void setApellPat(String apellPat) {
        this.apellPat = apellPat;
    }

    public String getApellMat() {
        return apellMat;
    }

    public void setApellMat(String apellMat) {
        this.apellMat = apellMat;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    public void setRol(String rol) {
        this.rol = rol;
    }
    
    public String getRol() {
        return rol;
    }
    
    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getId() {
        return id;
    }
    
    public String getPsw() {
        return psw;
    }

    public void setPsw(String psw) {
        this.psw = psw;
    }
    
    public String getPsw2() {
        return psw2;
    }

    public void setPsw2(String psw2) {
        this.psw2 = psw2;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
    
    public String nombreComp(){
        
        return nombre+" "+apellPat+" "+apellMat;
    }
}
