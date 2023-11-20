package com.example.tres_mosqueteros.Models.Daos;

import com.example.tres_mosqueteros.SHA256;
import com.example.tres_mosqueteros.Models.Beans.Jugador;


import java.sql.*;

public class JugadorDao extends DaoBase{

    public boolean verificarUserPasswordHashed(String user, String passwd){

        boolean valido = false;
        passwd = SHA256.cipherPassword(passwd);

        String sql = "SELECT * FROM jugadores WHERE usuario = ? AND password_hashed = ? AND estado_ban = 0;";


        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, user);
            pstmt.setString(2, passwd);

            try(ResultSet rs = pstmt.executeQuery()){

                if(rs.next()){
                    valido = true;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return valido;
    }


    // primero usar la funcion crear jugador
    public void crearUsuario(String nombre, int edad, String usuario, String email, String passwordStr){

        String sql = "INSERT INTO jugadores (`nombre`, `edad`, `usuario`, `email`, `password_hashed`, `estado`,hora) VALUES ( ?, ?, ?, ?, ?,?,?);";

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
            pstmt.setInt(7, 0);
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


    public Jugador obtenerJugador(String usuario) {

        Jugador jugador= null;

        String sql = "SELECT * FROM jugadores where usuario = ?";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, usuario);

            try (ResultSet rs = pstmt.executeQuery()) {

                if (rs.next()) {
                    jugador = new Jugador();
                    fetchJugadorData(jugador, rs);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return jugador;
    }


    private void fetchJugadorData(Jugador jugador, ResultSet rs) throws SQLException {
        jugador.setIdJugador(rs.getInt(1));
        jugador.setNombre(rs.getString(2));
        jugador.setEdad(rs.getString(3));
        jugador.setPaz(rs.getInt(4));
        jugador.setUsuario(rs.getString(5));
        jugador.setEmail(rs.getString(6));
        jugador.setEstado(rs.getInt(8));
        jugador.setHora(rs.getInt(9));
    }

    public Jugador buscarPorUsuario(String usuario){

        Jugador jugador = null;

        String sql = "select * from jugadores where usuario = ?";


        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1,usuario);

            try(ResultSet rs = pstmt.executeQuery()){
                while (rs.next()) {
                    jugador = new Jugador();
                    jugador.setNombre(rs.getString(2));
                    jugador.setEdad(rs.getString(3));
                    jugador.setUsuario(rs.getString(4));
                    jugador.setEmail(rs.getString(5));


                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
//servlet
        return jugador;
    }
    public void crear(String jugadorNombre, int jugadorEdad, String jugadorUsuario, String jugadorCorreo, String jugadorContrasena, Integer estado){

        jugadorContrasena = SHA256.cipherPassword(jugadorContrasena);
        String sql = "insert into jugadores (nombre, edad, usuario, email, password_hashed, estado_ban, paz, hora) values (?,?,?,?,?,?,?,?)";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1,jugadorNombre);
            pstmt.setInt(2,jugadorEdad);
            pstmt.setString(3,jugadorUsuario);
            pstmt.setString(4,jugadorCorreo);
            pstmt.setString(5,jugadorContrasena);
            pstmt.setInt(6,estado);
            pstmt.setInt(7,0);
            pstmt.setInt(8,0);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void jugadorAgregadoListaNegra(String jugadorNombre, int jugadorEdad, String jugadorUsuario, String jugadorCorreo, String jugadorContrasena){
        //0 No baneado 1 verdadero
        String Baneado = "1";
        String paz= "0";
        jugadorContrasena = SHA256.cipherPassword(jugadorContrasena);
        String sql = "insert into jugadores (nombre, edad, usuario, email password_hashed, estado, paz) values (?,?,?,?,?,?,?)";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1,jugadorNombre);
            pstmt.setInt(2,jugadorEdad);
            pstmt.setString(3,jugadorUsuario);
            pstmt.setString(4,jugadorCorreo);
            pstmt.setString(5,jugadorContrasena);
            pstmt.setString(6,Baneado);
            pstmt.setString(7,paz);
            pstmt.setInt(8,0);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public boolean buscarPorCorreo(String correo){

        boolean validacion = true;


        String sql = "SELECT * FROM jugadores WHERE email = ? AND estado = 1;";


        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, correo);


            try(ResultSet rs = pstmt.executeQuery()){

                if(rs.next()){
                    validacion = false;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return validacion;
    }

    public void actualizarHora(Integer idJugador, Integer nuevaHora){

        String sql = "update jugadores set hora = ? where idJugador = ?";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1,nuevaHora);
            pstmt.setInt(2,idJugador);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


}
