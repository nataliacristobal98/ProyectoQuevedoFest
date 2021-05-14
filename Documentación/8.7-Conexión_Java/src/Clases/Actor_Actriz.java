package Clases;

/**
 * La clase <code>Actor_Actriz</code> que especifica las características de los actores
 * @author Natalia Cristobal
 * @version 1.0
 * @since 1.0
 */

public class Actor_Actriz extends Celebridad {
    //Atributos
    /**
     * ID del actor
     */
    int IDact;
    /**
     * Agencia a la que pertenece
     */
    String agencia;

    /**
     * Constructor con todos los atributos:
     * @param IDcelebridad
     * @param nombre
     * @param IDact
     * @param agencia
     */
    //Constructor
    public Actor_Actriz(int IDcelebridad, String nombre, int IDact, String agencia) {
        super(IDcelebridad, nombre);
        this.IDact = IDact;
        this.agencia = agencia;
    }

    //Getters y Setters
    public int getIDact() {
        return IDact;
    }
    public String getAgencia() {
        return agencia;
    }
    public void setAgencia(String agencia) {
        this.agencia = agencia;
    }

    //Métodos
}
