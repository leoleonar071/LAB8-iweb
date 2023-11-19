package com.example.tres_mosqueteros.Models.Daos;

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
        persona.setGenero(rs.getString(12));
        persona.setProfesion(rs.getString(13));

    }





}
