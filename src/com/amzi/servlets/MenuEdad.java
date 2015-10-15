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
 * Servlet implementation class MenuEdad
 */
@WebServlet("/MenuEdad")
public class MenuEdad extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MenuEdad() {
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
		String[] nse = request.getParameterValues("nse");
		String ns6 = "Sin NSE";
		if (nse == null){
			nse = new String[1];
			nse[0]= "0";
		}else{
			ns6 = NombreTablas.getNombreNSE(nse);
		}
		request.getSession().setAttribute("nse", nse);
		request.getSession().setAttribute("ns6", ns6);
		
		response.setContentType("text/html");    
        PrintWriter out = response.getWriter();    
    	RequestDispatcher rd=request.getRequestDispatcher("WEB-INF/menus/menuedad.jsp");    
        rd.forward(request,response); 
        out.close();
	}

}
