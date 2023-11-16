package com.example.tres_mosqueteros.Models.Daos;

import com.example.tres_mosqueteros.Beans.Poblador;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class PobladorDao extends DaoBase{
    public ArrayList<Poblador> listaPobladores() {
        ArrayList<Poblador> listaPobladores = new ArrayList<>();

        try (Connection conn = this.getConection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM pobladores");) {

            while (rs.next()) {
                Poblador poblador = new Poblador();
                poblador.setIdPobladores(rs.getInt(1));
                poblador.setProfesion(rs.getString(2));
                poblador.setAlimentacionxdia(rs.getInt(3));
                poblador.setProduccion_moral(rs.getInt(4));
                poblador.setNombre(rs.getString(5));
                poblador.setGenero(rs.getString(6));
                poblador.setMoral(rs.getInt(7));
                poblador.setTiempo_en_colonia(rs.getInt(8));
                poblador.setFuerza(rs.getInt(9));
                poblador.setIdJugador(rs.getInt(10));
                poblador.setProduccion_alimento(rs.getInt(11));


                listaPobladores.add(poblador);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaPobladores;
    }

}
