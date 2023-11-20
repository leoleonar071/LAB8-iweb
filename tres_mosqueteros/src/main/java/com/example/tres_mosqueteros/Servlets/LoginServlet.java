package com.example.tres_mosqueteros.Servlets;

import com.example.tres_mosqueteros.Models.Beans.Jugador;
import com.example.tres_mosqueteros.Models.Daos.JugadorDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "login", value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession httpSession = request.getSession();
        Jugador jugadorLog = (Jugador) httpSession.getAttribute("jugadorLogueado");

        if(jugadorLog != null && jugadorLog.getIdJugador() > 0){

            if(request.getParameter("action") != null){ //es decir, tiene un valor
                httpSession.invalidate();
            }
            response.sendRedirect(request.getContextPath());
        }else{
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JugadorDao jdao = new JugadorDao();
        String action = request.getParameter("action") == null ? "main_page" : request.getParameter("action");


        switch (action){
            case "iniciar_sesion":
                String usuario = request.getParameter("user");
                String password = request.getParameter("password");

                System.out.println("usuario: " + usuario+ " y passwd: "+ password);



                if(jdao.verificarUserPasswordHashed(usuario, password)){
                    System.out.println("credenciales validas");
                    Jugador jugador = jdao.obtenerJugador(usuario);
                    HttpSession httpSession = request.getSession();
                    httpSession.setAttribute("jugadorLogueado", jugador);
                    response.sendRedirect(request.getContextPath()+"/menu?action=home");
                }else{
                    System.out.println("credenciales invalidas");
                    request.setAttribute("err","Usuario o password incorrectos");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
                break;
            case "registrarse": //Registrar jugador
                String newNombre = request.getParameter("jugadorNombre");
                Integer newEdad = Integer.parseInt(request.getParameter("jugadorEdad"));
                String newUsuario = request.getParameter("jugadorUsuario");
                String newCorreo = request.getParameter("jugadorCorreo");
                String newPassword = request.getParameter("jugadorPassword");

                System.out.println(newNombre);
                System.out.println(newEdad);
                System.out.println(newUsuario);
                System.out.println(newCorreo);
                System.out.println(newPassword);


                if (newEdad > 13){
                    jdao.crear(newNombre,newEdad,newUsuario,newCorreo,newPassword,0);
                    response.sendRedirect(request.getContextPath());
                }else{
                    jdao.crear(newNombre,newEdad,newUsuario,newCorreo,newPassword,1);
                    response.sendRedirect(request.getContextPath());
                }

                break;
        }




    }
}


