package Clases;

import java.util.Date;
import java.util.List;

/**
 * La clase <code>Agenda</code> que especifica las características de agendas
 * @author Natalia Cristobal
 * @version 1.0
 * @since 1.0
 */

public class Agenda {
    //Atributos
    int IDagenda;
    Date fecha;
    String previsionDia;
    private List<Invitacion> invitaciones;
    private List<Horario> horarios;
    private List<Cartel> carteles;
    private List<Artistas> artistas;

    //Constructor
    public Agenda(int IDagenda, Date fecha, String previsionDia) {
        this.IDagenda = IDagenda;
        this.fecha = fecha;
        this.previsionDia = previsionDia;
    }
    
    //Getters y Setters
    public int getIDagenda() {
        return IDagenda;
    }
    public Date getFecha() {
        return fecha;
    }
    public String getPrevisionDia() {
        return previsionDia;
    }
    public void setPrevisionDia(String previsionDia) {
        this.previsionDia = previsionDia;
    }

    //Métodos

}
