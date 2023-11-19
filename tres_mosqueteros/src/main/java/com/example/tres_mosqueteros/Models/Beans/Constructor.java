package com.example.tres_mosqueteros.Models.Beans;

import java.util.Random;

public class Constructor extends Persona{

    private int alimentacionxdia;
    private int moral;
    private int fuerza;
    private int produccionMoral;
    private int produccionAlimento;
    Random random = new Random();




    public int getAlimentacionxdia() {
        return alimentacionxdia;
    }

    public void setAlimentacionxdia() {
        this.alimentacionxdia = random.nextInt(21) + 50;
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
        this.fuerza = random.nextInt(19) + 2;
    }

    public int getProduccionAlimento(){return produccionAlimento;}

    public void setProduccionAlimento(){this.produccionAlimento = 0;}

    public int getProduccionMoral() {
        return produccionMoral;
    }

    public void setProduccionMoral() {
        this.produccionMoral = random.nextInt(11) + 10;
    }

}
