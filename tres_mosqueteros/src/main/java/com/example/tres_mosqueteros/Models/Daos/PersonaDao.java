package com.example.tres_mosqueteros.Models.Daos;

import com.example.tres_mosqueteros.Beans.Granjero;
import com.example.tres_mosqueteros.Beans.Persona;

import java.sql.*;
import java.util.ArrayList;

public class PersonaDao extends DaoBase{


    public ArrayList<Persona> listarPersonas(Integer idJugador){

        ArrayList<Persona> list= new ArrayList<>();

        String sql = "SELECT p.*, g.genero, prof.profesion\n" +
                "FROM pobladores p\n" +
                "inner join genero_poblador g on (p.idGenero = g.idGenero)\n" +
                "left join profesion_poblador prof on (prof.idProfesion = p.idProfesion)\n" +
                "where idJugador = ?";

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

    public void crearPersona(Persona persona){

        String sql = "INSERT INTO pobladores (idJugador, nombre, idGenero, idProfesion, alimentacionXdia, produccion_moral, moral, tiempo_en_colonia, fuerza, consumo_alimento, produccion_alimento)\n" +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try(Connection conn = this.getConection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1,persona.getIdJugador());
            pstmt.setString(2, persona.getNombre());
            pstmt.setString(3, persona.getIdGenero());
            pstmt.setString(4, persona.getIdProfesion());
            pstmt.setInt(5,((Granjero) persona).getAlimentacionxdia());
            pstmt.setInt(6,((Granjero) persona).getProduccionMoral());
            pstmt.setInt(7,((Granjero) persona).getMoral());
            pstmt.setInt(8,((Granjero) persona).getAlimentacionxdia());
            pstmt.setInt(9,((Granjero) persona).getAlimentacionxdia());

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
        persona.setGenero(rs.getString(12));
        persona.setProfesion(rs.getString(13));

    }





}
