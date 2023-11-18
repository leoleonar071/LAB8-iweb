package com.example.tres_mosqueteros.Models.Daos;

import com.example.tres_mosqueteros.Beans.Poblador;

import java.sql.*;
import java.util.ArrayList;

public class PobladorDao extends DaoBase{


    public ArrayList<Poblador> listarPobladores(Integer idJugador){

        ArrayList<Poblador> list= new ArrayList<>();

        String sql = "SELECT * FROM pobladores where idJugador= ?";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idJugador);

            try (ResultSet rs = pstmt.executeQuery()) {

                while (rs.next()) {
                    Poblador p = new Poblador();
                    fetchPobladorData(p, rs);
                    list.add(p);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }

    private void fetchPobladorData(Poblador poblador, ResultSet rs) throws SQLException{
        poblador.setIdPoblador(rs.getInt(1));
        poblador.setNombre(rs.getString(3));
        poblador.setIdGenero(rs.getString(4));
        poblador.setIdProfesion(rs.getString(5));
        poblador.setAlimentacionXdia(rs.getInt(6));
        poblador.setMoral(rs.getInt(10));
        poblador.setTiempo_en_colonia(rs.getInt(8));
        poblador.setFuerza(rs.getInt(9));
        poblador.setProduccion_moral(rs.getInt(7));
        poblador.setProduccion_alimento(rs.getInt(11));

    }





}
