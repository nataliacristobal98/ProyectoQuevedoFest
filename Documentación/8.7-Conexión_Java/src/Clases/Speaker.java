package Clases;

import java.util.Date;

/**
 * La clase <code>Speaker</code> que especifica las características de los artistas speakers
 * @author Natalia Cristobal
 * @version 1.0
 * @since 1.0
 */

public class Speaker extends Artistas{
    //Atributos
    int IDspeaker;
    String temaCharla;

    //Constructor
    public Speaker(int IDartista, String nombre, String agencia, Date fechaTurno, Cartel cartel, Agenda agenda, int IDspeaker, String temaCharla) {
        super(IDartista, nombre, agencia, fechaTurno, cartel, agenda);
        this.IDspeaker = IDspeaker;
        this.temaCharla = temaCharla;
    }

    //Getters y Setters
    public int getIDspeaker() {
        return IDspeaker;
    }
    public String getTemaCharla() {
        return temaCharla;
    }
    public void setTemaCharla(String temaCharla) {
        this.temaCharla = temaCharla;
    }

    //Métodos
}
