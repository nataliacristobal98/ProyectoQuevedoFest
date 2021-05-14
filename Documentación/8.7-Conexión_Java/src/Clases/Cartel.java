package Clases;

import java.util.Date;
import java.util.List;

/**
 * La clase <code>Cartel</code> que especifica las características de los carteles
 * @author Natalia Cristobal
 * @version 1.0
 * @since 1.0
 */

public class Cartel {
    //Atributos
    int IDcartel;
    int presupuesto;
    Date fecha;
    private List<Artistas> artistas;
    private Diseñador diseñador;
    private Agenda agenda;

    //Constructor
    public Cartel(int IDcartel, int presupuesto, Date fecha, Diseñador diseñador, Agenda agenda) {
        this.IDcartel = IDcartel;
        this.presupuesto = presupuesto;
        this.fecha = fecha;
        this.diseñador = diseñador;
        this.agenda = agenda;
    }

    //Getters y Setters
    public int getIDcartel() {
        return IDcartel;
    }
    public int getPresupuesto() {
        return presupuesto;
    }
    public void setPresupuesto(int presupuesto) {
        this.presupuesto = presupuesto;
    }
    public Date getFecha() {
        return fecha;
    }
    public Diseñador getDiseñador() {
        return diseñador;
    }
    public Agenda getAgenda() {
        return agenda;
    }

    //Métodos
}
