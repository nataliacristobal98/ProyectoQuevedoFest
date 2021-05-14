package Clases;

import java.util.Date;
import java.util.List;

/**
 * La clase <code>Fan</code> que especifica las características de estos
 * @author Natalia Cristobal
 * @version 1.0
 * @since 1.0
 */

public class Fan {
    //Atributos
    int IDfan;
    String nombre;
    Date fechaInscripcion;
    String estatus;
    private Fanclub fanclub;
    private List<Proyecto> proyectos;

    //Constructor
    public Fan(int IDfan, String nombre, Date fechaInscripcion, String estatus, Fanclub fanclub) {
        this.IDfan = IDfan;
        this.nombre = nombre;
        this.fechaInscripcion = fechaInscripcion;
        this.estatus = estatus;
        this.fanclub = fanclub;
    }

    //Getters y Setters
    public int getIDfan() {
        return IDfan;
    }
    public String getNombre() {
        return nombre;
    }
    public Date getFechaInscripcion() {
        return fechaInscripcion;
    }
    public String getEstatus() {
        return estatus;
    }
    public void setEstatus(String estatus) {
        this.estatus = estatus;
    }
    public Fanclub getFanclub() {
        return fanclub;
    }

    //Métodos

}
