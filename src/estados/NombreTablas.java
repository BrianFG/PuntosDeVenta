package estados;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import conexion.db_conexion;

public class NombreTablas extends db_conexion {
	static private PreparedStatement pst=null;
	
	public static String getNombres (String[] ids, String table, String column){

		ResultSet rs=null;
		ArrayList<String> nombres = new ArrayList<String>();
		String lista;
		
		try{
			
				String sql= "select * from " + table +  " where " + column + " in (";
				for (int i = 0 ; i < ids.length -1; i++){
					sql += ids[i] + ",";
				}
				sql += ids[ids.length-1] + ")";
				
				pst=cone().prepareStatement(sql);
				rs=pst.executeQuery();
				
				while (rs.next()){
					nombres.add(rs.getString(2));
				}
			
			
		}
		
		catch(Exception e){
			
			System.out.print(e.getMessage());
		}
		
		lista = nombres.toString().replace("[", "");
		lista = lista.replace("]", "");
		
		return lista;
		
	}
	
	public static String getNombreEstado(String[] estados){
		return getNombres(estados, "Estados ", "idEstados");
	}
	
	public static String getNombreZona (String[] zonas){
		return getNombres(zonas, "Zonas ", "idZonas");
	}
	
	public static String getNombreSubzona (String[] subzonas){
	  return getNombres(subzonas, "SubZona ", "idSubZona");
	}
	
	public static String getNombreTipo (String[] tipos){
		return getNombres(tipos, "TipoEstablecimiento ", "idTipoEstablecimiento");
	}
	
	public static String getNombreCategoria (String[] categorias){
		return getNombres(categorias, "Categoria ", "idCategoria");
	}
	
	public static String getNombreCadena (String[] cadenas){
		return getNombres(cadenas, "Cadena ", "idCadena");
	}
	
	public static String getNombreGenero (String[] generos){
		return getNombres(generos , "Genero ", "idGenero");
	}
	
	public static String getNombreNSE (String[] nses){
		return getNombres(nses , "NSE ", "idNSE");
	}
	
	public static String getNombreEdad (String[] edades){
		return getNombres(edades , "Edades ", "idEdades");
	}

}
