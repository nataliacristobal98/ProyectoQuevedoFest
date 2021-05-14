import org.sqlite.SQLiteDataSource;

import java.sql.*;

public class Conexion {
    public static void main(String[] args) {
        String url = "jdbc:sqlite:Documentación\\8.7-Conexión_Java\\src\\Festival.db";
        SQLiteDataSource dataSource = new SQLiteDataSource();
        dataSource.setUrl(url);

        //Conexión a la base de datos
        try(Connection con = dataSource.getConnection()) {
            //Comprobar si está conectada
            if (con.isValid(5)) {
                System.out.printf("Conexión establecida");
            }
            try (Statement st = con.createStatement()) {
                //Crear las tablas en la base de datos
                //Ejemplo de creación de tablas:
                    //String create = "CREATE TABLE IF NOT EXISTS Agenda (id_agenda INTEGER NOT NULL, fecha DATE NOT NULL, prevision_dia VARCHAR(120) NOT NULL, CONSTRAINT PK_Agenda PRIMARY KEY (id_agenda))";
                    //st.executeUpdate(create);

                //Insertar datos
                    //String insert = "INSERT INTO Agenda (id_agenda,fecha,prevision_dia) VALUES(1, '2021-07-06', '2 charlas con 7 speakers, 8 cantantes y 10 invitados');\n";
                    //st.executeUpdate(insert);
            }
        } catch (SQLException throwables) {
            System.out.println("Excepción SQL al conectar: " + throwables.getMessage());
            throwables.printStackTrace();
        }
    }
}
