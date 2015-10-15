package conexion;
import java.sql.*;


public class db_conexion {
	
	static private Connection cn = null;
	
	public static Connection cone(){
		
		String url = "jdbc:mysql://127.0.0.1:3306/Publimetro";  
	    String driver = "com.mysql.jdbc.Driver";  
	    String userName = "admin";  
	    String password = "admin";
		
		/*
	    String url = "jdbc:mysql://argos.e-novanet.mx:3306/bpotecno_Publimetro";  
	    String dbName = "bpotecno_Publimetro";  
	    String driver = "com.mysql.jdbc.Driver";  
	    String userName = "bpotecno_Publime";  
	    String password = "Mexico01";
	    */
	    
	    
	    try { 
        	Class.forName(driver).newInstance();  
            cn = DriverManager.getConnection(url, userName, password);  
	    
	    }
	    catch (SQLException e) {  
            System.out.println(e);  
        } 
	    catch (Exception e) {  
            System.out.println(e);  
        }  
	    


	    return cn;

	}
}
