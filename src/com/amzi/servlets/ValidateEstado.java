package com.amzi.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




import estados.NombreTablas;
import estados.Estado;

/**
 * Servlet implementation class ValidateEstado
 */
@WebServlet("/ValidateEstado")
public class ValidateEstado extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ValidateEstado() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");    
        PrintWriter out = response.getWriter();    
          
       String[] estados = request.getParameterValues("checkbox");  
       String esta = NombreTablas.getNombreEstado(estados);
       request.getSession().setAttribute("estados", estados);
       request.getSession().setAttribute("esta", esta);
       
        if(Estado.validateEstado(estados)){  
            RequestDispatcher rd=request.getRequestDispatcher("WEB-INF/menus/menuzona.jsp");
            rd.forward(request,response);    
        }    
        else{
            request.setAttribute("estadoNoExiste",true);
            RequestDispatcher rd=request.getRequestDispatcher("menu_estados.jsp");    
            rd.include(request,response);    
        }    
        out.close();
	}

}
