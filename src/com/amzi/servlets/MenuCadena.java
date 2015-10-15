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
 * Servlet implementation class MenuCadena
 */
@WebServlet("/MenuCadena")
public class MenuCadena extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MenuCadena() {
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
          
        String[] categorias = request.getParameterValues("categoria");  
        String cate = NombreTablas.getNombreCategoria(categorias);
        request.getSession().setAttribute("categorias", categorias);
        request.getSession().setAttribute("cate", cate);
        
        if (categorias == null || categorias.length == 0){
        	
        }else{
        	 RequestDispatcher rd=request.getRequestDispatcher("WEB-INF/menus/menucadena.jsp");    
             rd.forward(request,response); 
        }
        
       
        out.close();
	}

}
