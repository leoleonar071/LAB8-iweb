package com.example.tres_mosqueteros.Beans;

public class Jugador {
    private int idJugador;
    private String nombre;
    private String edad;

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    private boolean estado;

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

    public String getPassword_hashed() {
        return password_hashed;
    }

    public void setPassword_hashed(String password_hashed) {
        this.password_hashed = password_hashed;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPass(String password) {
        this.password = password;
    }

    private String usuario;
    private boolean paz;
    // en el esquema esta con tipo tynint, que admite 0 o 1 , solamente se hace un cambio a bollean y ya

    private String password_hashed;
    // contraseña con hash
    private String email;
    private String password;
    // contraña sin hash

}
