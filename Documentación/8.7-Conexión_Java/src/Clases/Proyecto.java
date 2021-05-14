package Clases;

/**
 * La clase <code>Proyecto</code> que especifica las características de los proyectos
 * @author Natalia Cristobal
 * @version 1.0
 * @since 1.0
 */

public class Proyecto {
    //Atributos
    int IDproyecto;
    String descripcion;
    String material;
    private Fan fan;

    //Constructor
    public Proyecto(int IDproyecto, String descripcion, String material, Fan fan) {
        this.IDproyecto = IDproyecto;
        this.descripcion = descripcion;
        this.material = material;
        this.fan = fan;
    }

    //Getters y Setters
    public int getIDproyecto() {
        return IDproyecto;
    }
    public String getDescripcion() {
        return descripcion;
    }
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    public String getMaterial() {
        return material;
    }
    public void setMaterial(String material) {
        this.material = material;
    }
    public Fan getFan() {
        return fan;
    }

    //Métodos

}
