package com.example.tres_mosqueteros.Servlets;

import com.example.tres_mosqueteros.Models.Beans.*;
import com.example.tres_mosqueteros.Models.Daos.JugadorDao;
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

                if(jugador != null){
                    System.out.println("el id del jugador es: "+ jugador.getIdJugador());
                    ArrayList<Persona> listaPersonas = personaDao.listarPersonas(jugador.getIdJugador());
                    request.setAttribute("listaPersonas", listaPersonas);
                    request.getRequestDispatcher("/pages/gestion_personas.jsp").forward(request, response);
                }
                else{
                    response.sendRedirect(request.getContextPath());
                }

                break;


            case "gestionRecursos":
                HttpSession httpSession3 = request.getSession();
                Jugador jugador2 = (Jugador) httpSession3.getAttribute("jugadorLogueado");
                System.out.println("el id del jugador es: "+ jugador2.getIdJugador());


                int sumacomida= personaDao.obtener_produccion_total_alimentosxDia(jugador2.getIdJugador());
                request.setAttribute("sumacomida", sumacomida);
                int sumafuerza= personaDao.obtener_fuerza_total(jugador2.getIdJugador());
                request.setAttribute("sumafuerza", sumafuerza);
                ArrayList<Persona> lista5bajos = personaDao.listar_5pobladores_baja_moral(jugador2.getIdJugador());
                request.setAttribute("lista5bajos", lista5bajos);

                request.getRequestDispatcher("/pages/gestion_recursos.jsp").forward(request, response);


                break;

            case "crearPersona":
                HttpSession httpSession1 = request.getSession();
                Jugador jugador1 = (Jugador) httpSession1.getAttribute("jugadorLogueado");

                if(jugador1 != null){
                    System.out.println("la hora actual es:" + jugador1.getHora() +" al darle a crear");
                    request.getRequestDispatcher("/pages/new_person.jsp").forward(request, response);
                }else{
                    response.sendRedirect(request.getContextPath());
                }

                break;

            case "editarPersona":
                HttpSession httpSession2 = request.getSession();
                Jugador jugador3 = (Jugador) httpSession2.getAttribute("jugadorLogueado");

                if(jugador3 != null){
                    String idPersona = request.getParameter("idPersona");
                    System.out.println("idPersona: " +idPersona);
                    Persona persona = personaDao.obtenerPersona(idPersona);
                    System.out.println("nombre: " + persona.getNombre());
                    request.setAttribute("persona", persona);
                    request.getRequestDispatcher("/pages/edit_person.jsp").forward(request, response);
                }else{
                    response.sendRedirect(request.getContextPath());
                }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PersonaDao personaDao = new PersonaDao();
        JugadorDao jdao = new JugadorDao();
        String action = request.getParameter("action") == null? "newPerson" : request.getParameter("action");

        HttpSession httpSession = request.getSession();
        Jugador jugador = (Jugador) httpSession.getAttribute("jugadorLogueado");

        switch (action){
            case "newPerson":
                Integer idJugador = jugador.getIdJugador();
                Integer horaActualJugador = jugador.getHora();
                System.out.println("Hora actual: "+ horaActualJugador);
                String nombre = request.getParameter("nombre");
                String idGenero = request.getParameter("genero");
                String idProfesion = request.getParameter("idProfesion");
                System.out.println(idProfesion);

                switch (idProfesion){

                    case "GRA":
                        Persona persona = new Granjero();
                        Granjero granjero = (Granjero) persona;
                        ((Granjero) persona).setAlimentacionxdia();
                        ((Granjero) persona).setProduccionMoral();
                        ((Granjero) persona).setMoral();
                        persona.setTiempo_en_colonia(0);
                        ((Granjero) persona).setFuerza();
                        ((Granjero) persona).setProduccionAlimento();
                        jdao.actualizarHora(idJugador, horaActualJugador + 8);
                        personaDao.crearPersona(idJugador,nombre,idGenero,idProfesion,((Granjero) persona).getAlimentacionxdia(),((Granjero) persona).getProduccionMoral(), ((Granjero) persona).getMoral(),persona.getTiempo_en_colonia(),((Granjero) persona).getFuerza(),((Granjero) persona).getProduccionAlimento());
                        response.sendRedirect(request.getContextPath()+"/menu?action=home");
                        break;

                    case "CONS":
                        Persona persona2 = new Constructor();
                        Constructor constructor = (Constructor) persona2;
                        ((Constructor) persona2).setAlimentacionxdia();
                        ((Constructor) persona2).setProduccionMoral();
                        ((Constructor) persona2).setMoral();
                        persona2.setTiempo_en_colonia(0);
                        ((Constructor) persona2).setFuerza();
                        ((Constructor) persona2).setProduccionAlimento();
                        jdao.actualizarHora(idJugador, horaActualJugador + 8);
                        personaDao.crearPersona(idJugador,nombre,idGenero,idProfesion,((Constructor) persona2).getAlimentacionxdia(),((Constructor) persona2).getProduccionMoral(), ((Constructor) persona2).getMoral(),persona2.getTiempo_en_colonia(),((Constructor) persona2).getFuerza(),((Constructor) persona2).getProduccionAlimento());
                        response.sendRedirect(request.getContextPath()+"/menu?action=home");
                        break;

                    case "SOL":
                        Persona persona3 = new Soldado();
                        Soldado soldado = (Soldado) persona3;
                        ((Soldado) persona3).setAlimentacionxdia();
                        ((Soldado) persona3).setProduccionMoral();
                        ((Soldado) persona3).setMoral();
                        persona3.setTiempo_en_colonia(0);
                        ((Soldado) persona3).setFuerza();
                        ((Soldado) persona3).setProduccionAlimento();
                        jdao.actualizarHora(idJugador, horaActualJugador + 8);
                        personaDao.crearPersona(idJugador,nombre,idGenero,idProfesion,((Soldado) persona3).getAlimentacionxdia(),((Soldado) persona3).getProduccionMoral(), ((Soldado) persona3).getMoral(),persona3.getTiempo_en_colonia(),((Soldado) persona3).getFuerza(),((Soldado) persona3).getProduccionAlimento());
                        response.sendRedirect(request.getContextPath()+"/menu?action=home");
                        break;

                    case "UNSET":
                        Persona persona4 = new SinProfesion();
                        SinProfesion sinProfesion = (SinProfesion) persona4;
                        ((SinProfesion) persona4).setAlimentacionxdia();
                        ((SinProfesion) persona4).setProduccionMoral();
                        ((SinProfesion) persona4).setMoral();
                        persona4.setTiempo_en_colonia(0);
                        ((SinProfesion) persona4).setFuerza();
                        ((SinProfesion) persona4).setProduccionAlimento();
                        Integer horaActualJugador2 = jugador.getHora();

                        jdao.actualizarHora(idJugador, horaActualJugador2 + 2);
                        personaDao.crearPersona(idJugador,nombre,idGenero,idProfesion,((SinProfesion) persona4).getAlimentacionxdia(),((SinProfesion) persona4).getProduccionMoral(), ((SinProfesion) persona4).getMoral(),persona4.getTiempo_en_colonia(),((SinProfesion) persona4).getFuerza(),((SinProfesion) persona4).getProduccionAlimento());
                        response.sendRedirect(request.getContextPath()+"/menu?action=home");
                        break;

                }
                break;

            case "editPerson":
                String idPersona = request.getParameter("idPersona");
                String nuevoNombre = request.getParameter("nombreEditado");
                personaDao.actualizarNombrePersona(idPersona, nuevoNombre);
                response.sendRedirect(request.getContextPath()+"/menu?action=home");
                break;

        }

    }
}
