package com.example.tres_mosqueteros.Beans;
import java.util.Random;

public class Granjero extends Persona {
    private String profesionID;
    private int alimentacionxdia;
    private int moral;
    private int fuerza;
    private int produccion;
    Random random = new Random();

    public String getProfesionID() {
        return profesionID;
    }

    public void setProfesionID() {
        this.profesionID = "GRA";
    }

    public int getAlimentacionxdia() {
        return alimentacionxdia;
    }

    public void setAlimentacionxdia() {
        this.alimentacionxdia = random.nextInt(21) + 10;
    }

    public int getMoral() {
        return moral;
    }

    public void setMoral() {
        this.moral = random.nextInt(31) + 10;
    }

    public int getFuerza() {
        return fuerza;
    }

    public void setFuerza() {
        this.fuerza = 0;
    }

    public int getProduccion() {
        return produccion;
    }

    public void setProduccion(int produccion) {
        this.produccion = random.nextInt(101) + 100;
    }
}
