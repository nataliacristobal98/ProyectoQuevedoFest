package Clases;

import java.util.Date;

/**
 * La clase <code>Invitacion</code> que especifica los datos de las invitaciones
 * @author Natalia Cristobal
 * @version 1.0
 * @since 1.0
 */

public class Invitacion {
    //Atributos
    int IDinvitacion;
    String codigoQR;
    Date fecha;
    private Agenda agenda;
    private Celebridad celebridad;

    //Constructor
    public Invitacion(int IDinvitacion, String codigoQR, Date fecha, Agenda agenda, Celebridad celebridad) {
        this.IDinvitacion = IDinvitacion;
        this.codigoQR = codigoQR;
        this.fecha = fecha;
        this.agenda = agenda;
        this.celebridad = celebridad;
    }

    //Getters y Setters
    public int getIDinvitacion() {
        return IDinvitacion;
    }
    public String getCodigoQR() {
        return codigoQR;
    }
    public Date getFecha() {
        return fecha;
    }
    public Agenda getAgenda() {
        return agenda;
    }
    public Celebridad getCelebridad() {
        return celebridad;
    }

    //Métodos
}
