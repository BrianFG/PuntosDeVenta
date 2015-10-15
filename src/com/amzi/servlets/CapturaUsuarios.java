package com.amzi.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CapturaUsuarios
 */
@WebServlet("/CapturaUsuarios")
public class CapturaUsuarios extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CapturaUsuarios() {
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
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String delUsuario = request.getParameter("delUsuario");
		String inUsuario = request.getParameter("inUsuario");
		if (request.getParameter("regreso") != null ){
			RequestDispatcher rd=request.getRequestDispatcher("WEB-INF/admin/usuarios.jsp");    
	        rd.forward(request,response); 
		}else if (delUsuario != null){
			RequestDispatcher rd=request.getRequestDispatcher("WEB-INF/admin/elimina.jsp");    
	        rd.forward(request,response); 	
		}else if (inUsuario != null){
			RequestDispatcher rd=request.getRequestDispatcher("WEB-INF/admin/inserta.jsp");    
	        rd.forward(request,response); 	
		}else{
			RequestDispatcher rd=request.getRequestDispatcher("WEB-INF/admin/modifica.jsp");    
	        rd.forward(request,response);
		}
		
		
		
	}

}
