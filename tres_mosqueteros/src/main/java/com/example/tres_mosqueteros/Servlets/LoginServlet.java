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
        String usuario = request.getParameter("user");
        String password = request.getParameter("password");

        System.out.println("usuario: " + usuario+ " y passwd: "+ password);

        if(jdao.verificarUserPasswordHashed(usuario, password)){
            System.out.println("credenciales validas");
            Jugador jugador = jdao.obtenerJugador(usuario);
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("jugadorLogueado", jugador);
            response.sendRedirect(request.getContextPath()+"/home");
        }else{
            System.out.println("credenciales invalidas");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }

    }
}

/*protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String correo = request.getParameter("username");
        String password = request.getParameter("password");
        System.out.println("username: " + correo + " | password: " + password);
        CredencialesDao credencialesDao = new CredencialesDao();

        if(credencialesDao.validarUsuarioPasswordHashed(correo,password)){
            System.out.println("usuario y password válidos");
            Jugador jugador = credencialesDao.obtenerJugador(correo); //Obtener al Jugador por el correo. Este es el Jugador logueado
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("usuarioLogueado",jugador);
            response.sendRedirect(request.getContextPath());
        }else{
            System.out.println("usuario o password incorrectos");
            request.setAttribute("err","Usuario o password incorrectos");
            request.getRequestDispatcher("index.jsp").forward(request,response);
        }
    }
}


<h2>Iniciar Sesión</h2>
                <% if (request.getAttribute("err") != null) {%>
                <div class="alert alert-danger" role="alert"><%=request.getAttribute("err")%>
                </div>
                <% } %>
*/
