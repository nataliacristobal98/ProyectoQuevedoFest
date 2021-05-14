package Clases;

import java.util.List;

/**
 * La clase <code>Celebridad</code> que especifica las características de los celebrities
 * @author Natalia Cristobal
 * @version 1.0
 * @since 1.0
 */

public class Celebridad {
    //Atributos
    int IDcelebridad;
    String nombre;
    private List<Campo_trabajo> campoTrabajo;

    //Constructor
    public Celebridad(int IDcelebridad, String nombre) {
        this.IDcelebridad = IDcelebridad;
        this.nombre = nombre;
    }

    //Getters y Setters
    public int getIDcelebridad() {
        return IDcelebridad;
    }
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    //Métodos
}
