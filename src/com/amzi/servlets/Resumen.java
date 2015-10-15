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
 * Servlet implementation class Resumen
 */
@WebServlet("/Resumen")
public class Resumen extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Resumen() {
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
		String[] edades = request.getParameterValues("edad");
		String edad = "Sin edad";
		if (edades == null){
			edades = new String[1];
			edades[0] = "0";
		}else{
			edad = NombreTablas.getNombreEdad(edades);
		}
		
		request.getSession().setAttribute("edades", edades);
		request.getSession().setAttribute("edad", edad);
		
		response.setContentType("text/html");    
        PrintWriter out = response.getWriter();    
		RequestDispatcher rd=request.getRequestDispatcher("WEB-INF/menus/resumen.jsp");    
		rd.forward(request,response); 
        out.close();
	}

}
