package Clases;

import java.util.List;

/**
 * La clase <code>Campo_trabajo</code> que especifica los tipos de campo
 * @author Natalia Cristobal
 * @version 1.0
 * @since 1.0
 */

public class Campo_trabajo {
    //Atributos
    String campo;
    private List<Celebridad> celebridades;

    //Constructor
    public Campo_trabajo(String campo) {
        this.campo = campo;
    }

    //Getters y Setters
    public String getCampo() {
        return campo;
    }

    //Métodos
}
