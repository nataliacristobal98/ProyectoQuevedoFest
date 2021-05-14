package Clases;

import java.util.List;

/**
 * La clase <code>Vestuario</code> que especifica las características de los encargados de vestuario
 * @author Natalia Cristobal
 * @version 1.0
 * @since 1.0
 */

public class Vestuario {
    //Atributos
    int IDvestuario;
    String contacto;
    String nombre;
    String redSocial;
    String marcaRopa;
    private List<Cantante> cantantes;

    //Constructor
    public Vestuario(int IDvestuario, String contacto, String nombre, String redSocial, String marcaRopa) {
        this.IDvestuario = IDvestuario;
        this.contacto = contacto;
        this.nombre = nombre;
        this.redSocial = redSocial;
        this.marcaRopa = marcaRopa;
    }

    //Getters y Setters
    public int getIDvestuario() {
        return IDvestuario;
    }
    public String getContacto() {
        return contacto;
    }
    public void setContacto(String contacto) {
        this.contacto = contacto;
    }
    public String getNombre() {
        return nombre;
    }
    public String getRedSocial() {
        return redSocial;
    }
    public void setRedSocial(String redSocial) {
        this.redSocial = redSocial;
    }
    public String getMarcaRopa() {
        return marcaRopa;
    }
    public void setMarcaRopa(String marcaRopa) {
        this.marcaRopa = marcaRopa;
    }

    //Métodos
}
