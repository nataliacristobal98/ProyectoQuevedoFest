package Clases;

/**
 * La clase <code>Diseñador</code> que especifica las características de los diseñadores
 * @author Natalia Cristobal
 * @version 1.0
 * @since 1.0
 */

public class Diseñador {
    //Atributos
    int IDdiseñador;
    String redSocial;
    String nombre;

    //Constructor
    public Diseñador(int IDdiseñador, String redSocial, String nombre) {
        this.IDdiseñador = IDdiseñador;
        this.redSocial = redSocial;
        this.nombre = nombre;
    }

    //Getters y Setters
    public int getIDdiseñador() {
        return IDdiseñador;
    }
    public String getRedSocial() {
        return redSocial;
    }
    public void setRedSocial(String redSocial) {
        this.redSocial = redSocial;
    }
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    //Métodos
}
