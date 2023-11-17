package com.example.tres_mosqueteros.Models.Daos;

import com.example.tres_mosqueteros.SHA256;
import com.example.tres_mosqueteros.Beans.Jugador;


import java.net.ConnectException;
import java.sql.*;
import java.util.ArrayList;

public class JugadorDao extends DaoBase{

    public boolean login(String mail, String passwd){

        boolean valido = false;
        passwd = SHA256.cipherPassword(passwd);

        String sql = "SELECT j.email, j.password_hashed FROM jugadores j WHERE j.email = ? AND j.password_hashed = ? AND j.estado = 1;";


        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, mail);
            pstmt.setString(2, passwd);

            try(ResultSet rs = pstmt.executeQuery()){

                while(rs.next()){
                    String mailDB = rs.getString(1);
                    String passwdDB = rs.getString(2);

                    if (mailDB == null || passwdDB == null){
                        valido = false;
                    } else if (mailDB.equals(mail) && passwdDB.equals(passwd)){
                        valido = true;
                    }
                }

            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
        return valido;
    }


    // primero usar la funcion crear jugador
    public void crearUsuario(String nombre, int edad, String usuario, String email, String passwordStr){

        String sql = "INSERT INTO `l8_iweb`.`jugadores` (`nombre`, `edad`, `usuario`, `email`, `password_hashed`, `estado`) VALUES ( ?, ?, ?, ?, ?,?);";

        String passworHash = SHA256.cipherPassword(passwordStr);

        Boolean estado= edad>12;




        try(Connection conn = this.getConection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1,nombre);
            pstmt.setInt(2, edad);
            pstmt.setString(3, usuario);
            pstmt.setString(4, email);
            pstmt.setString(5,passworHash);
            pstmt.setBoolean(6,estado);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // en el servlet primero usar esta funcion de existe correo , y luego recien la de crear jugador
    // en el caso de que exista el servlet deberia mandar un mensaje que diga este correo ya existe o esta baneado

    public boolean existeCorreo(String correo) {

        boolean existe = false;
        String sql = "SELECT COUNT(*) FROM jugadores WHERE email = ? ";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, correo);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    int count = rs.getInt(1);
                    existe = count > 0; // Si count es mayor a 0, significa que el correo existe
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return existe;
    }

}
