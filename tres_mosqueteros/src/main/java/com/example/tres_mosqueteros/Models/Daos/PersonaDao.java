package com.example.tres_mosqueteros.Models.Daos;
import java.util.ArrayList;



import com.example.tres_mosqueteros.Models.Beans.Granjero;
import com.example.tres_mosqueteros.Models.Beans.Persona;

import java.sql.*;
import java.util.ArrayList;

public class PersonaDao extends DaoBase{


    public ArrayList<Persona> listarPersonas(Integer idJugador){

        ArrayList<Persona> list= new ArrayList<>();

        String sql = "SELECT p.*, g.genero, prof.profesion\n" +
                "FROM pobladores p\n" +
                "inner join genero_poblador g on (p.idGenero = g.idGenero)\n" +
                "left join profesion_poblador prof on (prof.idProfesion = p.idProfesion)\n" +
                "where idJugador = ? " +
                "order by idPoblador";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idJugador);

            try (ResultSet rs = pstmt.executeQuery()) {

                while (rs.next()) {
                    Persona p = new Persona();
                    fetchPersonaData(p, rs);
                    p.setGenero(rs.getString(12));
                    p.setProfesion(rs.getString(13));
                    list.add(p);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }

    public void crearPersona(Integer idJugador,String nombre,String idGenero,String idProfesion,Integer alimentacionXdia,Integer produccionMoral,Integer moral,Integer tiempoColonia,Integer fuerza,Integer produccionAlimento){

        String sql = "INSERT INTO pobladores (idJugador, nombre, idGenero, idProfesion, alimentacionXdia, produccion_moral, moral, tiempo_en_colonia, fuerza, produccion_alimento)\n" +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try(Connection conn = this.getConection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1,idJugador);
            pstmt.setString(2, nombre);
            pstmt.setString(3, idGenero);
            pstmt.setString(4, idProfesion);
            pstmt.setInt(5,alimentacionXdia);
            pstmt.setInt(6,produccionMoral);
            pstmt.setInt(7,moral);
            pstmt.setInt(8,tiempoColonia);
            pstmt.setInt(9,fuerza);
            pstmt.setInt(10, produccionAlimento);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }



    private void fetchPersonaData(Persona persona, ResultSet rs) throws SQLException{
        persona.setIdPoblador(rs.getInt(1));
        persona.setIdJugador(rs.getInt(2));
        persona.setNombre(rs.getString(3));
        persona.setIdGenero(rs.getString(4));
        persona.setIdProfesion(rs.getString(5));
        persona.setAlimentacionXdia(rs.getInt(6));
        persona.setProduccionMoral(rs.getInt(7));
        persona.setMoral(rs.getInt(8));
        persona.setTiempo_en_colonia(rs.getInt(9));
        persona.setFuerza(rs.getInt(10));
        persona.setProduccionAlimento(rs.getInt(11));

    }


    public Persona obtenerPobladorAleatorio() {
        Persona poblador = new Persona();

        String sql = "SELECT * FROM lostresmosqueteros.pobladores\n" +
                "ORDER BY RAND() LIMIT 1;"; // Obtener un poblador aleatorio

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            if (rs.next()) {
                // Obtener los datos del poblador aleatorio
                fetchPersonaData(poblador, rs);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return poblador;
    }

    public Persona obtenerPersona(String idPersona) {
        Persona persona = null;

        String sql = "SELECT * FROM lostresmosqueteros.pobladores where idPoblador = ?"; // Obtener un poblador aleatorio


        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, idPersona);

            try (ResultSet rs = pstmt.executeQuery()) {

                while(rs.next()){
                    persona = new Persona();
                    fetchPersonaData(persona, rs);
                }

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return persona;
    }

    public int obtener_fuerza_total(int idJugador ){
        int sumaTotal = 0;


        String sql = "SELECT SUM(fuerza) AS suma_total " +
                "FROM pobladores " +
                "WHERE idJugador = ?";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idJugador);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    sumaTotal = rs.getInt("suma_total");
                    // Actualizar el atributo sumacomida del jugador
                    actualizar_SumaFuerzaJugador(idJugador, sumaTotal);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return sumaTotal;
    }

    public void actualizar_SumaFuerzaJugador(int idJugador, int sumaTotal) {


        String sqlUpdate = "UPDATE jugadores SET sumafuerzas = ? WHERE idJugador = ?";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sqlUpdate)) {

            pstmt.setInt(1, sumaTotal);
            pstmt.setInt(2, idJugador);

            pstmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void actualizarNombrePersona(String idPersona, String nuevoNombre) {


        String sqlUpdate = "UPDATE pobladores SET nombre=? WHERE idPoblador = ?";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sqlUpdate)) {

            pstmt.setString(1, nuevoNombre);
            pstmt.setString(2, idPersona);

            pstmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }




    public int obtener_produccion_total_alimentosxDia(int idJugador ){
        int sumaTotal = 0;


        String sql = "SELECT SUM(produccion_alimento) AS suma_total " +
                "FROM pobladores " +
                "WHERE idJugador = ?";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idJugador);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    sumaTotal = rs.getInt("suma_total");
                    // Actualizar el atributo sumacomida del jugador
                    actualizar_SumaComidaJugador(idJugador, sumaTotal);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return sumaTotal;
    }



    public void actualizar_SumaComidaJugador(int idJugador, int nuevaSumaComida) {


        String sqlUpdate = "UPDATE jugadores SET sumacomida = ? WHERE idJugador = ?";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sqlUpdate)) {

            pstmt.setInt(1, nuevaSumaComida);
            pstmt.setInt(2, idJugador);

            pstmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }


    public void alimentarPersonasAleatorias(int idJugador) {
        ArrayList<Persona> pobladoresAlimentados = new ArrayList<>();
        ArrayList<Persona> pobladores_no_alimentados= new ArrayList<>();
        pobladores_no_alimentados= listarPersonas(idJugador);

        int produccionTotal = obtener_produccion_total_alimentosxDia(idJugador);
        int consumoDiario=0;
        Persona persona=new Persona();

        while (produccionTotal > consumoDiario) {
            // Seleccionar aleatoriamente a una persona
            persona = obtenerPobladorAleatorio();

            // Obtener el consumo diario de la persona
            consumoDiario = persona.getAlimentacionXdia();

            // Verificar si hay suficiente comida para alimentar a esta persona
            if (produccionTotal >= consumoDiario) {


                // Restar la cantidad de comida proporcionada de la producción total
                produccionTotal -= consumoDiario;


                // añadir a una lista las ids
                pobladoresAlimentados.add(persona);

                // Actualizar la producción total de alimentos
                actualizar_SumaComidaJugador(idJugador, produccionTotal);
            } else {

                pobladores_no_alimentados.removeAll(pobladoresAlimentados);
                bajarMoral(pobladores_no_alimentados);
                suicidioXmoral(idJugador);


                // Si no hay suficiente comida, se detiene el proceso
                break;
            }
        }
    }

    public void bajarMoral(ArrayList<Persona> personas) {
        for (Persona persona : personas) {
            int nuevaMoral = persona.getMoral() -persona.getAlimentacionXdia(); // Modificas la moral según el modificador recibido
            persona.setMoral(nuevaMoral); // Actualizas el atributo 'moral' de la persona

            String sqlUpdate = "UPDATE pobladores SET moral = ? WHERE idPoblador = ?";

            try (Connection conn = this.getConection();
                 PreparedStatement pstmt = conn.prepareStatement(sqlUpdate)) {

                pstmt.setInt(1, nuevaMoral);
                pstmt.setInt(2, persona.getIdJugador());

                pstmt.executeUpdate();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }


        }


    }

    public void suicidioXmoral(int idJugador) {


        String sqlUpdate = "DELETE FROM pobladores WHERE moral = 0";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sqlUpdate)) {



            pstmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }


    public ArrayList<Persona> listar_5pobladores_baja_moral(Integer idJugador){

        ArrayList<Persona> list= new ArrayList<>();

        String sql = "SELECT *\n" +
                "FROM pobladores\n" +
                "WHERE idJugador = ?\n" +
                "ORDER BY moral ASC\n" +
                "LIMIT 5;";



        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idJugador);

            try (ResultSet rs = pstmt.executeQuery()) {

                while (rs.next()) {
                    Persona p = new Persona();
                    fetchPersonaData(p, rs);
                    list.add(p);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }









}
