package com.example.tres_mosqueteros.Servlets;

import com.example.tres_mosqueteros.Beans.Jugador;
import com.example.tres_mosqueteros.Models.Daos.JugadorDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "login", value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("/pages/gestion_personas.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JugadorDao jdao = new JugadorDao();
        String usuario = request.getParameter("user");
        String password = request.getParameter("password");

        System.out.println("usuario: " + usuario+ " y passwd: "+ password);

        if(jdao.verificarUserPasswordHashed(usuario, password)){
            System.out.println("credenciales validas");
            Jugador jugador = jdao.obtenerJugador(usuario);
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("jugadorLogueado", jugador);
            response.sendRedirect(request.getContextPath()+"/login");
        }else{
            System.out.println("credenciales invalidas");

        }





    }
}
