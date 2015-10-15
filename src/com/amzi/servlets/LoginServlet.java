package com.amzi.servlets;  
  
import java.io.IOException;  
import java.io.PrintWriter;  
  


import javax.servlet.RequestDispatcher;  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;  
  


import com.amzi.dao.Empleado;
import com.amzi.dao.LoginDao;  

import conexion.EmailBPO;
  
public class LoginServlet extends HttpServlet{  
  
    private static final long serialVersionUID = 1L;  
  
    @Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)    
            throws ServletException, IOException { 
    	
    	if (true){
    		 RequestDispatcher rd=request.getRequestDispatcher("WEB-INF/admin/usuarios.jsp");  
    	        rd.forward(request,response); 
    	        return ;
    	}
  
        response.setContentType("text/html");    
        PrintWriter out = response.getWriter();    
          
        String n=request.getParameter("username");    
        String p=request.getParameter("userpass");   
          
        HttpSession session = request.getSession(false);  
        if(session!=null)  
        session.setAttribute("name", n);  
  
        if(LoginDao.validate(n, p)){
        	if (Empleado.necesitaActualizar(n, p)){
            	RequestDispatcher rd=request.getRequestDispatcher("index.jsp"); 
                String mensaje =  Empleado.actualizar(n, p);
           	 	request.setAttribute("message", mensaje);
                request.setAttribute("tipo", "warning");
                rd.forward(request,response); 
        	}else{
            RequestDispatcher rd=request.getRequestDispatcher("WEB-INF/menus/menu_estados.jsp");  
            rd.forward(request,response); 
            }   
        }
        else if(LoginDao.validateUsuarioCapturista(n, p)){
        	if (Empleado.necesitaActualizar(n, p)){
            	RequestDispatcher rd=request.getRequestDispatcher("index.jsp"); 
                String mensaje =  Empleado.actualizar(n, p);
           	 	request.setAttribute("message", mensaje);
                request.setAttribute("tipo", "warning");
                rd.forward(request,response);  
        	}else{
        	 RequestDispatcher rd=request.getRequestDispatcher("WEB-INF/captura/captura1.jsp");
             rd.forward(request,response);  
        	}
        }
        else if (LoginDao.validateUsuarioSeguridad(n, p)){
        	 
        	if (Empleado.necesitaActualizar(n, p)){
            	RequestDispatcher rd=request.getRequestDispatcher("index.jsp"); 
                String mensaje =  Empleado.actualizar(n, p);
           	 	request.setAttribute("message", mensaje);
                request.setAttribute("tipo", "warning");
                rd.forward(request,response); 
        	}else{
        		RequestDispatcher rd=request.getRequestDispatcher("WEB-INF/admin/usuarios.jsp");
        		rd.forward(request,response); 
        	}

        }
        else{
        	if(LoginDao.validateUsuarioBloqueado(n, p)){
        		String salida = "El usuario "+ n +" esta bloqueado en la base de datos";
                RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                request.setAttribute("message", salida);
                request.setAttribute("tipo", "warning");
                rd.include(request,response);    
        	}else{  
            RequestDispatcher rd=request.getRequestDispatcher("index.jsp"); 
            request.setAttribute("message", "No. Empleado o Password incorrecto");
            request.setAttribute("tipo", "error");
            rd.include(request,response);    
        	}
        }    
  
        out.close();    
    }    
}   
