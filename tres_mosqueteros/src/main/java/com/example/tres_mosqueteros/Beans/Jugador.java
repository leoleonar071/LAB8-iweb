package com.example.tres_mosqueteros.Beans;

public class Jugador {
    private int idJugador;
    private String nombre;
    private String edad;

    public int getIdJugador() {
        return idJugador;
    }

    public void setIdJugador(int idJugador) {
        this.idJugador = idJugador;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEdad() {
        return edad;
    }

    public void setEdad(String edad) {
        this.edad = edad;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public boolean isPaz() {
        return paz;
    }

    public void setPaz(boolean paz) {
        this.paz = paz;
    }

    public String getPass_hashed() {
        return pass_hashed;
    }

    public void setPass_hashed(String pass_hashed) {
        this.pass_hashed = pass_hashed;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    private String usuario;
    private boolean paz;
    // en el esquema esta con tipo tynint, que admite 0 o 1 , solamente se hace un cambio a bollean y ya

    private String pass_hashed;
    // contraseña con hash
    private String email;
    private String pass;
    // contraña sin hash

}
