package com.example.tres_mosqueteros.Models.Beans;

import java.util.Random;

public class Soldado extends Persona{

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
        this.alimentacionxdia = random.nextInt(31) + 70;
    }

    public int getMoral() {
        return moral;
    }

    public void setMoral() {
        this.moral = random.nextInt(21) + 30;
    }

    public int getFuerza() {
        return fuerza;
    }

    public void setFuerza() {this.fuerza = random.nextInt(36) + 15;}

    public int getProduccionAlimento(){return produccionAlimento;}

    public void setProduccionAlimento(){this.produccionAlimento = 0;}

    public int getProduccionMoral() {
        return produccionMoral;
    }

    public void setProduccionMoral() {
        this.produccionMoral = random.nextInt(21) ;
    }





}
