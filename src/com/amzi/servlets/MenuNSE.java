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
 * Servlet implementation class MenuNSE
 */
@WebServlet("/MenuNSE")
public class MenuNSE extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MenuNSE() {
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
		String[] generos = request.getParameterValues("genero");
		String gene = "Sin genero";
		if (generos == null){
			generos = new String[1];
			generos[0]= "0";
		}else{
			gene = NombreTablas.getNombreGenero(generos);
		}
		request.getSession().setAttribute("generos", generos);
		request.getSession().setAttribute("gene", gene);
		
		response.setContentType("text/html");    
        PrintWriter out = response.getWriter();    
		RequestDispatcher rd=request.getRequestDispatcher("WEB-INF/menus/menunse.jsp");    
        rd.forward(request,response); 
        out.close();
	}

}
