package com.amzi.dao;  
  
import java.sql.*;

import conexion.db_conexion;
  
public class LoginDao extends db_conexion { 
	
    public static boolean validate(String name, String pass) {      
    	//if (true) return true;
        boolean status = false;  
       /// Connection conn = null;  
        PreparedStatement pst = null;  
        PreparedStatement pst2 = null; 
        PreparedStatement pst3 = null;  
        CallableStatement validaIntentos = null; 
        ResultSet rs = null;  
  
//        String url = "jdbc:mysql://127.0.0.1:3306/Publimetro";  
//        String dbName = "Publimetro";  
//        String driver = "com.mysql.jdbc.Driver";  
//        String userName = "newuser";  
       // String password = "password";  
        try { 
//        	Class.forName(driver).newInstance();  
//            conn = DriverManager.getConnection(url, userName, password);  
        	
	            pst = cone().prepareStatement("select * from Usuarios where noEmpleado=? and CAST(AES_DECRYPT(password, 'Mexico01') AS char(50))=? and idActivo = 1 and rolEmpleado = 4");  
	            pst2 = cone().prepareStatement("UPDATE Login SET intentos=0 where idUsuario=(select idUsuario from Usuarios where noEmpleado=?)");  
	            pst3 = cone().prepareStatement("UPDATE Login SET intentos=intentos+1 where idUsuario=(select idUsuario from Usuarios where noEmpleado=?)");  
	            //pst3 = conn.prepareStatement("UPDATE Usuarios SET intento=intento+1 where noEmpleado=?");  

	            validaIntentos = cone().prepareCall("{call verificaUsuarios(?)}");	            
	           
	        	pst.setString(1, name);  
	            pst.setString(2, pass);  
	            pst2.setString(1, name);  
	            pst3.setString(1, name); 
	            validaIntentos.setString(1, name);
	            rs = pst.executeQuery();       
	            status = rs.next();
	            if(status == true){
	            	pst2.executeUpdate();
	            }else{
	            	pst3.executeUpdate();
		            validaIntentos.execute();
	            }
        	
        } catch (Exception e) {  
            System.out.println(e);  
        } finally {  
            if (cone() != null) {  
                try {  
                	cone().close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
            if (pst != null) {  
                try {  
                    pst.close(); 
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            } 
            if (pst2 != null) {  
                try {  
                    pst2.close();
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }
            if (pst3 != null) {  
                try {  
                    pst3.close();
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }
            if (validaIntentos != null) {  
                try {  
                    validaIntentos.close();
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }
            if (rs != null) {  
                try {  
                    rs.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
        }  
    
        return status;  
    }  

    public static boolean validateUsuarioBloqueado(String name, String pass) {          
        boolean status = false;  
       // Connection conn = null;  
        PreparedStatement pst = null;  
        ResultSet rs = null;  
  
//      //  String url = "jdbc:mysql://127.0.0.1:3306/Publimetro";  
//        String dbName = "Publimetro";  
//        String driver = "com.mysql.jdbc.Driver";  
//        String userName = "newuser";  
//        String password = "password";  
        try { 
//        	Class.forName(driver).newInstance();  
//            conn = DriverManager.getConnection(url, userName, password);  
        	
	            pst = cone().prepareStatement("select * from Usuarios where noEmpleado=? and CAST(AES_DECRYPT(password, 'Mexico01') AS char(50))=? and idActivo = 0");  
	            //pst3 = conn.prepareStatement("UPDATE Usuarios SET intento=intento+1 where noEmpleado=?");  
	        	pst.setString(1, name);  
	            pst.setString(2, pass);  	           
	            rs = pst.executeQuery();       
	            status = rs.next();
        } catch (Exception e) {  
            System.out.println(e);  
        } finally {  
            if (cone() != null) {  
                try {  
                	cone().close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
            if (pst != null) {  
                try {  
                    pst.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
            if (rs != null) {  
                try {  
                    rs.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
        }  
    
        return status;  
    }  
    
    public static boolean validateUsuarioCapturista(String name, String pass) {          
        boolean status = false;  
        PreparedStatement pst = null;  
        ResultSet rs = null;  
  

        try { 
        	
            	pst = cone().prepareStatement("select * from Usuarios where noEmpleado=? and CAST(AES_DECRYPT(password, 'Mexico01') AS char(50))=? and idActivo = 1 and rolEmpleado = 2");  
	        	pst.setString(1, name);  
	            pst.setString(2, pass);  	           
	            rs = pst.executeQuery();       
	            status = rs.next();
        } catch (Exception e) {  
            System.out.println(e);  
        } finally {  
            if (cone() != null) {  
                try {  
                	cone().close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
            if (pst != null) {  
                try {  
                    pst.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
            if (rs != null) {  
                try {  
                    rs.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
        }  
    
        return status;  
    }  
    
    public static boolean validateUsuarioSeguridad(String name, String pass) {          
        boolean status = false;  
        PreparedStatement pst = null;  
        ResultSet rs = null;  
  

        try { 
        	
        		pst = cone().prepareStatement("select * from Usuarios where noEmpleado=? and CAST(AES_DECRYPT(password, 'Mexico01') AS char(50))=? and idActivo = 1 and rolEmpleado = 3");  
	        	pst.setString(1, name);  
	            pst.setString(2, pass);  	           
	            rs = pst.executeQuery();       
	            status = rs.next();
        } catch (Exception e) {  
            System.out.println(e);  
        } finally {  
            if (cone() != null) {  
                try {  
                	cone().close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
            if (pst != null) {  
                try {  
                    pst.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
            if (rs != null) {  
                try {  
                    rs.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
        }  
    
        return status;  
    }  
    

}  