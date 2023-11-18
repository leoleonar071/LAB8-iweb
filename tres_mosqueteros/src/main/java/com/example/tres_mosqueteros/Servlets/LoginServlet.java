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
                String jugadorNombre = request.getParameter("jugadorNombre");
                String jugadorEdadStr = request.getParameter("jugadorEdad");
                String jugadorUsuarioStr = request.getParameter("jugadorUsuario");
                String jugadorCorreoStr = request.getParameter("jugadorCorreo");
                String jugadorPasswordStr = request.getParameter("jugadorPassword");

                System.out.println("Edad ingresada" + jugadorEdadStr);

                boolean isAllValid = true;
                if(Integer.parseInt(jugadorEdadStr) < 13){
                    isAllValid = false;
                    System.out.println("Entro el numero");
                }

                if(isAllValid){
                    if (jdao.buscarPorCorreo(jugadorCorreoStr)){
                        Jugador jugador = jdao.buscarPorUsuario(jugadorUsuarioStr); //Busca si hay alguien con el mismo usuario

                        //Creamos Trabajador
                        if(jugador == null){  //Se verifica que no se repita el primary key
                            jdao.crear(jugadorNombre,Integer.parseInt(jugadorEdadStr),jugadorUsuarioStr,jugadorCorreoStr,jugadorPasswordStr);
                            response.sendRedirect(request.getContextPath() + "/login"); //Una vez creado y dado click a submit se devuelve a la página donde está la lista
                        }else{
                            request.setAttribute("error_usuario","Error: El nombre de usuario ya existe");
                            request.getRequestDispatcher("pages/register.jsp").forward(request,response);
                        }
                    }else {
                        request.setAttribute("error_edad","No cumple con el requerimiento de edad");
                        request.getRequestDispatcher("pages/register.jsp.jsp").forward(request, response);
                    }
                }else{

                    jdao.jugadorAgregadoListaNegra(jugadorNombre,Integer.parseInt(jugadorEdadStr),jugadorUsuarioStr,jugadorCorreoStr,jugadorPasswordStr);
                    request.setAttribute("error_edad","No cumple con el requerimiento de edad");
                    request.getRequestDispatcher("pages/register.jsp").forward(request,response);

                }
                break;
        }




    }
}


