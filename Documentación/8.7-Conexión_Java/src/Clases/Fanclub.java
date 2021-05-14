package Clases;

import java.util.List;

/**
 * La clase <code>Fanclub</code> que especifica las características del fanclub
 * @author Natalia Cristobal
 * @version 1.0
 * @since 1.0
 */

public class Fanclub {
    //Atributos
    int IDfanclub;
    String nombre;
    String paginaWeb;
    private Cantante cantante;
    private List<Fan> fans;

    //Constructor
    public Fanclub(int IDfanclub, String nombre, String paginaWeb, Cantante cantante) {
        this.IDfanclub = IDfanclub;
        this.nombre = nombre;
        this.paginaWeb = paginaWeb;
        this.cantante = cantante;
    }

    //Getters y Setters
    public int getIDfanclub() {
        return IDfanclub;
    }
    public String getNombre() {
        return nombre;
    }
    public String getPaginaWeb() {
        return paginaWeb;
    }
    public void setPaginaWeb(String paginaWeb) {
        this.paginaWeb = paginaWeb;
    }
    public Cantante getCantante() {
        return cantante;
    }

    //Método

}
