package com.example.tres_mosqueteros.Models.Beans;
import java.util.Random;

public class Granjero extends Persona {
    private int alimentacionxdia;
    private int moral;
    private int fuerza;
    private int produccionMoral;
    private int produccionAlimento;
    Random random = new Random();


    public int getProduccionAlimento(){return produccionAlimento;}

    public void setProduccionAlimento(){this.produccionAlimento = random.nextInt(101) + 100;}


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

    public int getProduccionMoral() {
        return produccionMoral;
    }

    public void setProduccionMoral() {
        this.produccionMoral = 0;
    }
}
