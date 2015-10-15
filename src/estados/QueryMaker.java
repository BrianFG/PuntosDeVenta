package estados;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



import java.sql.Statement;

import conexion.db_conexion;

public class QueryMaker extends db_conexion{

	static private PreparedStatement pst=null;
	static private Statement stmt = null;
	
	public static ResultSet executeQuery (String query){
		ResultSet rs=null;
		
		try{
			pst=cone().prepareStatement(query);
			rs=pst.executeQuery();
			
			
		}
		catch(Exception e){
			System.out.print(e.getMessage());
		}
		
		return rs;
	}
	
	public static boolean executeUpdate(String query){
		
		try {
			stmt = cone().createStatement();
			stmt.executeUpdate(query);
			return true;
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		}
		return false;
	}
}
