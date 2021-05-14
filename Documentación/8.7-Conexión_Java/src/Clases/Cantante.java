package Clases;

import java.util.Date;

/**
 * La clase <code>Cantante</code> que especifica las características de los cantantes
 * @author Natalia Cristobal
 * @version 1.0
 * @since 1.0
 */

public class Cantante extends Artistas{
    //Atributos
    int IDcantante;
    String nombreFanclub;
    String generoMusical;
    Date fechaDebut;
    String colorOficial;
    private Maquillador maquillador;
    private Vestuario vestuario;

    //Constructor
    public Cantante(int IDartista, String nombre, String agencia, Date fechaTurno, Cartel cartel, Agenda agenda, int IDcantante, String nombreFanclub,
                    String generoMusical, Date fechaDebut, String colorOficial, Maquillador maquillador, Vestuario vestuario) {
        super(IDartista, nombre, agencia, fechaTurno, cartel, agenda);
        this.IDcantante = IDcantante;
        this.nombreFanclub = nombreFanclub;
        this.generoMusical = generoMusical;
        this.fechaDebut = fechaDebut;
        this.colorOficial = colorOficial;
        this.maquillador = maquillador;
        this.vestuario = vestuario;
    }

    //Getters y Setters
    public int getIDcantante() {
        return IDcantante;
    }
    public String getNombreFanclub() {
        return nombreFanclub;
    }
    public String getGeneroMusical() {
        return generoMusical;
    }
    public void setGeneroMusical(String generoMusical) {
        this.generoMusical = generoMusical;
    }
    public Date getFechaDebut() {
        return fechaDebut;
    }
    public String getColorOficial() {
        return colorOficial;
    }
    public void setColorOficial(String colorOficial) {
        this.colorOficial = colorOficial;
    }
    public Maquillador getMaquillador() {
        return maquillador;
    }
    public Vestuario getVestuario() {
        return vestuario;
    }

    //Métodos
}
