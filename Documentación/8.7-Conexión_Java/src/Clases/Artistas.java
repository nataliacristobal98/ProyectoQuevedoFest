package Clases;

import java.util.Date;

/**
 * La clase <code>Artistas</code> que especifica las características de estos
 * @author Natalia Cristobal
 * @version 1.0
 * @since 1.0
 */

public class Artistas {
    //Atributos
    int IDartista;
    String nombre;
    String agencia;
    Date fechaTurno;
    private Cartel cartel;
    private Agenda agenda;

    //Constructor
    public Artistas(int IDartista, String nombre, String agencia, Date fechaTurno, Cartel cartel, Agenda agenda) {
        this.IDartista = IDartista;
        this.nombre = nombre;
        this.agencia = agencia;
        this.fechaTurno = fechaTurno;
        this.cartel = cartel;
        this.agenda = agenda;
    }

    //Getters y Setters
    public int getIDartista() {
        return IDartista;
    }
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getAgencia() {
        return agencia;
    }
    public void setAgencia(String agencia) {
        this.agencia = agencia;
    }
    public Date getFechaTurno() {
        return fechaTurno;
    }
    public Cartel getCartel() {
        return cartel;
    }
    public Agenda getAgenda() {
        return agenda;
    }

    //Métodos
}
