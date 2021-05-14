package Clases;

import java.util.Date;

/**
 * La clase <code>Grupo</code> que especifica las características de los cantantes que son parte de un grupo
 * @author Natalia Cristobal
 * @version 1.0
 * @since 1.0
 */

public class Grupo extends Cantante{
    //Atributos
    int IDgrupo;
    int numIntegrantes;

    //Constructor
    public Grupo(int IDartista, String nombre, String agencia, Date fechaTurno, Cartel cartel, Agenda agenda, int IDcantante, String nombreFanclub,
                 String generoMusical, Date fechaDebut, String colorOficial, Maquillador maquillador, Vestuario vestuario, int IDgrupo, int numIntegrantes) {
        super(IDartista, nombre, agencia, fechaTurno, cartel, agenda, IDcantante, nombreFanclub, generoMusical, fechaDebut, colorOficial, maquillador, vestuario);
        this.IDgrupo = IDgrupo;
        this.numIntegrantes = numIntegrantes;
    }

    //Getters y Setters
    public int getIDgrupo() {
        return IDgrupo;
    }
    public int getNumIntegrantes() {
        return numIntegrantes;
    }
    public void setNumIntegrantes(int numIntegrantes) {
        this.numIntegrantes = numIntegrantes;
    }

    //Métodos

}
