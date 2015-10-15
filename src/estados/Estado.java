package estados;
import conexion.db_conexion;

import java.sql.*;

public class Estado extends db_conexion  {
	
	static private PreparedStatement pst=null;

	public static ResultSet getEstados(){
		
		ResultSet rs=null;
		
		try{
			String sql="Select * from Estados where idEstados not in (33)";
			pst=cone().prepareStatement(sql);
			rs=pst.executeQuery();
			
			
		}
		
		catch(Exception e){
			
			System.out.print(e.getMessage());
		}
		
		
		
		return rs;
		
	}
	
	public static boolean validateEstado (String[] estados){
		ResultSet rs=null;
		
		for (String estado : estados){
			
			try {
				String sql  = "Select * from Zonas where idEstado = " + estado;
				pst = cone().prepareStatement(sql);
				rs = pst.executeQuery();
				if (rs == null || !rs.next()){
					return false;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		return true;
		
	}
	
	
}


