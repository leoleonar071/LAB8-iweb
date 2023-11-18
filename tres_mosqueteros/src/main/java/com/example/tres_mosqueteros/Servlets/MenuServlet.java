package com.example.tres_mosqueteros.Servlets;

import com.example.tres_mosqueteros.Beans.Jugador;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "menu", value = "/menu")
public class MenuServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action") == null? "register" : request.getParameter("action");


        switch (action){
            case "register":
            request.getRequestDispatcher("pages/register.jsp").forward(request, response);
            break;

            case "home":
                HttpSession httpSession = request.getSession();
                Jugador jugador = (Jugador) httpSession.getAttribute("jugadorLogueado");
                System.out.println("el id del jugador es: "+ jugador.getIdJugador());
                request.getRequestDispatcher("/pages/gestion_personas.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
