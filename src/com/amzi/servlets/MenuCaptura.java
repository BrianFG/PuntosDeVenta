package com.amzi.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Captura
 */
@WebServlet("/Captura")
public class MenuCaptura extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MenuCaptura() {
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
		
		String inEst = request.getParameter("inEstado");
		String inZon = request.getParameter("inZona");
		String inSub = request.getParameter("inSubZona");
		String inTip = request.getParameter("inTipo");
		String inCat = request.getParameter("inCategoria");
		String inCad = request.getParameter("inCadena");
		String inPun = request.getParameter("inPunto");
		
		String modEst = request.getParameter("modEstado");
		String modZon = request.getParameter("modZona");
		String modSub = request.getParameter("modSubZona");
		String modTip = request.getParameter("modTipo");
		String modCat = request.getParameter("modCategoria");
		String modCad = request.getParameter("modCadena");
		String modPun = request.getParameter("modPunto");
		
		String delEst = request.getParameter("delEstado");
		String delZon = request.getParameter("delZona");
		String delSub = request.getParameter("delSubZona");
		String delTip = request.getParameter("delTipo");
		String delCat = request.getParameter("delCategoria");
		String delCad = request.getParameter("delCadena");
		String delPun = request.getParameter("delPunto");
		
		
		boolean insert = inEst!=null || inZon!=null || inSub!=null || inTip!=null || inCat!=null || inCad!=null || inPun!=null; 
		boolean modifi = modEst!=null || modZon!=null || modSub!=null || modTip!=null || modCat!=null || modCad!=null || modPun!=null;
		boolean delete = delEst!=null || delZon!=null || delSub!=null || delTip!=null || delCat!=null || delCad!=null || delPun!=null;

		
		if (request.getParameter("captura1") != null){
			RequestDispatcher rd=request.getRequestDispatcher("WEB-INF/captura/captura1.jsp");    
	        rd.forward(request,response); 
		}else if (request.getParameter("delmodPunto") != null){
			RequestDispatcher rd=request.getRequestDispatcher("WEB-INF/captura/muestraPuntos.jsp");    
	        rd.forward(request,response); 
		}else if (insert){
			RequestDispatcher rd=request.getRequestDispatcher("WEB-INF/captura/inserta.jsp");    
	        rd.forward(request,response); 
		}else if (modifi){
			RequestDispatcher rd=request.getRequestDispatcher("WEB-INF/captura/modifica.jsp");    
	        rd.forward(request,response); 
		}else if(delete){
			RequestDispatcher rd=request.getRequestDispatcher("WEB-INF/captura/elimina.jsp");    
	        rd.forward(request,response); 
		}
	}

}
