package Clases;

import java.util.Date;

/**
 * La clase <code>Horario</code> que especifica las características de los horarios
 * @author Natalia Cristobal
 * @version 1.0
 * @since 1.0
 */

public class Horario {
    //Atributos
    int IDhorario;
    String hora;
    Date fecha;
    String descripcionEvento;
    private Agenda agenda;

    //Constructor
    public Horario(int IDhorario, String hora, Date fecha, String descripcionEvento, Agenda agenda) {
        this.IDhorario = IDhorario;
        this.hora = hora;
        this.fecha = fecha;
        this.descripcionEvento = descripcionEvento;
        this.agenda = agenda;
    }

    //Getters y Setters
    public int getIDHorario() {
        return IDhorario;
    }
    public String getHora() {
        return hora;
    }
    public void setHora(String hora) {
        this.hora = hora;
    }
    public Date getFecha() {
        return fecha;
    }
    public String getDescripcionEvento() {
        return descripcionEvento;
    }
    public void setDescripcionEvento(String descripcionEvento) {
        this.descripcionEvento = descripcionEvento;
    }
    public Agenda getAgenda() {
        return agenda;
    }

    //Métodos

}
