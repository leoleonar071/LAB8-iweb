package com.example.tres_mosqueteros.Servlets;

import com.example.tres_mosqueteros.Beans.Granjero;
import com.example.tres_mosqueteros.Beans.Jugador;
import com.example.tres_mosqueteros.Beans.Persona;
import com.example.tres_mosqueteros.Models.Daos.PersonaDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "menu", value = "/menu")
public class MenuServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PersonaDao personaDao = new PersonaDao();
        String action = request.getParameter("action") == null? "register" : request.getParameter("action");


        switch (action){
            case "register":
            request.getRequestDispatcher("pages/register.jsp").forward(request, response);
            break;

            case "home":
                HttpSession httpSession = request.getSession();
                Jugador jugador = (Jugador) httpSession.getAttribute("jugadorLogueado");
                System.out.println("el id del jugador es: "+ jugador.getIdJugador());
                ArrayList<Persona> listaPersonas = personaDao.listarPersonas(jugador.getIdJugador());
                request.setAttribute("listaPersonas", listaPersonas);
                request.getRequestDispatcher("/pages/gestion_personas.jsp").forward(request, response);
                break;

            case "crearPersona":


                request.getRequestDispatcher("/pages/new_person.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action") == null? "newPerson" : request.getParameter("action");


        switch (action){
            case "newPerson":
                String nombre = request.getParameter("nombre");
                String idGenero = request.getParameter("genero");
                String idOficio = request.getParameter("lugar");

                switch (idOficio){

                    case "GRA":
                        Persona persona = new Granjero();
                        Granjero g = (Granjero) persona;
                        ((Granjero) persona).setAlimentacionxdia();
                        ((Granjero) persona).setMoral();
                        ((Granjero) persona).setFuerza();
                        ((Granjero) persona).setProduccionAlimento();
                        ((Granjero) persona).setProduccionMoral();

                        System.out.println("alimentacion x dia: "+ ((Granjero) persona).getAlimentacionxdia());
                        System.out.println("moral: "+((Granjero) persona).getAlimentacionxdia());
                        System.out.println("fuerza:" + ((Granjero) persona).getProduccionAlimento());
                        
                        break;


                }

                System.out.println("nombre:" + nombre);
                System.out.println("genero: "+ idGenero);
                System.out.println("idOficio: " + idOficio);
                break;

        }

    }
}
