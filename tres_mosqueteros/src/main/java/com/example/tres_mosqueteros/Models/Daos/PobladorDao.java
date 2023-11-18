package com.example.tres_mosqueteros.Models.Daos;

import com.example.tres_mosqueteros.Beans.Poblador;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class PobladorDao extends DaoBase{

    public ArrayList<Poblador> listaPobladores(String id) {

        ArrayList<Poblador> lista = new ArrayList<>();

        try (Connection conn = this.getConection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM pobladores");) {

            while (rs.next()) {
                Poblador poblador = new Poblador();
               fetchPobladorData(poblador,rs);



                lista.add(poblador);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
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
