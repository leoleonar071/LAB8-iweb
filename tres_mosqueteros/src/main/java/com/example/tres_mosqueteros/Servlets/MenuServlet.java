package com.example.tres_mosqueteros.Servlets;

import com.example.tres_mosqueteros.Models.Beans.Granjero;
import com.example.tres_mosqueteros.Models.Beans.Jugador;
import com.example.tres_mosqueteros.Models.Beans.Persona;
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
                HttpSession httpSession1 = request.getSession();
                Jugador jugador1 = (Jugador) httpSession1.getAttribute("jugadorLogueado");
                System.out.println("el id del jugador es: "+ jugador1.getIdJugador());
                request.getRequestDispatcher("/pages/new_person.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PersonaDao personaDao = new PersonaDao();
        String action = request.getParameter("action") == null? "newPerson" : request.getParameter("action");

        HttpSession httpSession = request.getSession();
        Jugador jugador = (Jugador) httpSession.getAttribute("jugadorLogueado");

        switch (action){
            case "newPerson":

                Integer idJugador = jugador.getIdJugador();
                String nombre = request.getParameter("nombre");
                String idGenero = request.getParameter("genero");
                String idProfesion = request.getParameter("lugar");

                switch (idProfesion){

                    case "GRA":
                        Persona persona = new Granjero();
                        Granjero g = (Granjero) persona;
                        ((Granjero) persona).setAlimentacionxdia();
                        ((Granjero) persona).setProduccionMoral();
                        ((Granjero) persona).setMoral();
                        persona.setTiempo_en_colonia(0);
                        ((Granjero) persona).setFuerza();
                        ((Granjero) persona).setProduccionAlimento();

                        personaDao.crearPersona(idJugador,nombre,idGenero,idProfesion,((Granjero) persona).getAlimentacionxdia(),((Granjero) persona).getProduccionMoral(), ((Granjero) persona).getMoral(),persona.getTiempo_en_colonia(),((Granjero) persona).getFuerza(),((Granjero) persona).getProduccionAlimento());
                        response.sendRedirect(request.getContextPath()+"/menu?action=home");
                        break;


                }


                break;

        }

    }
}
