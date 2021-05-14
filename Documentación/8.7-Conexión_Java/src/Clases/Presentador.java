package Clases;

import java.util.Date;

/**
 * La clase <code>Presentador/code> que especifica las características de los presentadores
 * @author Natalia Cristobal
 * @version 1.0
 * @since 1.0
 */

public class Presentador extends Artistas{
    //Atributos
    int IDpresentador;

    //Constructor
    public Presentador(int IDartista, String nombre, String agencia, Date fechaTurno, Cartel cartel, Agenda agenda, int IDpresentador) {
        super(IDartista, nombre, agencia, fechaTurno, cartel, agenda);
        this.IDpresentador = IDpresentador;
    }

    //Getters y Setters
    public int getIDpresentador() {
        return IDpresentador;
    }

    //Métodos
}
