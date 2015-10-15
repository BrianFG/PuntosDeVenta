package com.amzi.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import estados.NombreTablas;


/**
 * Servlet implementation class MenuCategoria
 */
@WebServlet("/MenuCategoria")
public class MenuCategoria extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MenuCategoria() {
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
        //PrintWriter out = response.getWriter();    
          
        String[] tipos = request.getParameterValues("tipo"); 
        String tipo = NombreTablas.getNombreTipo(tipos);
        request.getSession().setAttribute("tipos", tipos);
        request.getSession().setAttribute("tipo", tipo);
        
         
        if (tipos == null || tipos.length == 0){
        	
        }else{
        	
        	 RequestDispatcher rd=request.getRequestDispatcher("WEB-INF/menus/menucategoria.jsp");    
             rd.forward(request,response); 
        }
        
       
        //out.close();
	}

}
