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



/**
 * Servlet implementation class MenuSubZona
 */
@WebServlet("/MenuSubZona")
public class MenuSubZona extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MenuSubZona() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");    
        PrintWriter out = response.getWriter();    
          
        String[] zonas = request.getParameterValues("checkbox");  
        String zona = NombreTablas.getNombreZona(zonas);
        request.getSession().setAttribute("zonas", zonas);
        request.getSession().setAttribute("zona", zona);
        if (zonas == null || zonas.length == 0){
        	
        }else{
        	request.setAttribute("zonas", zonas);
        
        	 RequestDispatcher rd=request.getRequestDispatcher("WEB-INF/menus/menusubzona.jsp");    
             rd.forward(request,response); 
        }
        
       
        out.close();
	}

}
