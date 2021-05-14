package Clases;

/**
 * La clase <code>Influencer</code> que especifica las características de las celebridades que son influencers
 * @author Natalia Cristobal
 * @version 1.0
 * @since 1.0
 */

public class Influencer extends Celebridad{
    //Atributos
    int IDinfluencer;
    String redSocial;

    //Constructor
    public Influencer(int IDcelebridad, String nombre, int IDinfluencer, String redSocial) {
        super(IDcelebridad, nombre);
        this.IDinfluencer = IDinfluencer;
        this.redSocial = redSocial;
    }

    //Getters y Setters
    public int getIDinfluencer() {
        return IDinfluencer;
    }
    public String getRedSocial() {
        return redSocial;
    }
    public void setRedSocial(String redSocial) {
        this.redSocial = redSocial;
    }

    //Métodos
}
