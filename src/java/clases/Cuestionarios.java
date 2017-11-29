/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Hot Cakes
 */
public class Cuestionarios {
    private String nombre="";
    private int idProfesor;
    private int idCuest;
    private String pregunta="";
    private String respCorrecta="";
    private String respInc1="";
    private String respInc2="";
    private String respInc3="";
    private String tiempo="";
    
    public Cuestionarios(){}
    
    public String guardaCuest()throws SQLException{
        cDatos dat= new cDatos();
        dat.conectar();
        ResultSet msj=dat.ejecuta("call spGuardaCuestionario("+idProfesor+", '"+nombre+"');");
        msj.next();
        String mensaje=msj.getString(1);
        return mensaje;
    }
    
    public String guardaPreg() throws SQLException{
        cDatos dat= new cDatos();
        dat.conectar();
        ResultSet idCuestionario = dat.ejecuta("select cuestionario.id,cuestionario.nombre from cuestionario inner join persona on cuestionario.idProfesor = persona.id where persona.id = "+idProfesor+" and cuestionario.nombre = '"+nombre+"'; ");
        idCuestionario.next();
        idCuest = idCuestionario.getInt("id");
        ResultSet msj=dat.ejecuta("call spGuardaPreg('0', '"+idCuest+"', '"+pregunta+"', '"+respCorrecta+"', '"+respInc1+"', '"+respInc2+"', '"+respInc3+"', '"+tiempo+"');");
        msj.next();
        String mensaje=msj.getString(1);
        return mensaje;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getIdProfesor() {
        return idProfesor;
    }

    public void setIdProfesor(int idProfesor) {
        this.idProfesor = idProfesor;
    }

    public int getIdCuest() {
        return idCuest;
    }

    public void setIdCuest(int idCuest) {
        this.idCuest = idCuest;
    }

    public String getPregunta() {
        return pregunta;
    }

    public void setPregunta(String pregunta) {
        this.pregunta = pregunta;
    }

    public String getRespCorrecta() {
        return respCorrecta;
    }

    public void setRespCorrecta(String respCorrecta) {
        this.respCorrecta = respCorrecta;
    }

    public String getRespInc1() {
        return respInc1;
    }

    public void setRespInc1(String respInc1) {
        this.respInc1 = respInc1;
    }

    public String getRespInc2() {
        return respInc2;
    }

    public void setRespInc2(String respInc2) {
        this.respInc2 = respInc2;
    }

    public String getRespInc3() {
        return respInc3;
    }

    public void setRespInc3(String respInc3) {
        this.respInc3 = respInc3;
    }

    public String getTiempo() {
        return tiempo;
    }

    public void setTiempo(String tiempo) {
        this.tiempo = tiempo;
    }
    
    
}
