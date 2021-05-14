package Clases;

import java.util.Date;

/**
 * La clase <code>Solista</code> que especifica las características de los solistas
 * @author Natalia Cristobal
 * @version 1.0
 * @since 1.0
 */

public class Solista extends Cantante{
    //Atributos
    int IDsolista;
    int numBailarines;

    //Constructor
    public Solista(int IDartista, String nombre, String agencia, Date fechaTurno, Cartel cartel, Agenda agenda, int IDcantante, String nombreFanclub,
                   String generoMusical, Date fechaDebut, String colorOficial, Maquillador maquillador, Vestuario vestuario, int IDsolista, int numBailarines) {
        super(IDartista, nombre, agencia, fechaTurno, cartel, agenda, IDcantante, nombreFanclub, generoMusical, fechaDebut, colorOficial, maquillador, vestuario);
        this.IDsolista = IDsolista;
        this.numBailarines = numBailarines;
    }

    //Getters y Setters
    public int getIDsolista() {
        return IDsolista;
    }
    public int getNumBailarines() {
        return numBailarines;
    }
    public void setNumBailarines(int numBailarines) {
        this.numBailarines = numBailarines;
    }

    //Métodos

}
