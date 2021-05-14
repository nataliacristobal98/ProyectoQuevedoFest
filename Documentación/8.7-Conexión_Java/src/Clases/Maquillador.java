package Clases;

import java.util.List;

/**
 * La clase <code>Maquillador</code> que especifica las características de los maqulladores
 * @author Natalia Cristobal
 * @version 1.0
 * @since 1.0
 */

public class Maquillador {
    //Atributos
    int IDmaquillaje;
    String contacto;
    String nombre;
    String redSocial;
    String especialidad;
    String material;
    private List<Cantante> cantantes;

    //Constructor
    public Maquillador(int IDmaquillaje, String contacto, String nombre, String redSocial, String especialidad, String material) {
        this.IDmaquillaje = IDmaquillaje;
        this.contacto = contacto;
        this.nombre = nombre;
        this.redSocial = redSocial;
        this.especialidad = especialidad;
        this.material = material;
    }

    //Getters y Setters
    public int getIDmaquillaje() {
        return IDmaquillaje;
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
    public String getEspecialidad() {
        return especialidad;
    }
    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }
    public String getMaterial() {
        return material;
    }
    public void setMaterial(String material) {
        this.material = material;
    }

    //Métodos

}
