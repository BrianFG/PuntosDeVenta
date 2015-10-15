package estados;

import java.sql.ResultSet;

public class Captura {
	
	public static ResultSet getEstados(){
		String query = "select * from Estados";
		return QueryMaker.executeQuery(query);
	}
	
	public static ResultSet getZonas(){
		String query ="select * from Zonas";
		return QueryMaker.executeQuery(query);
	}
	
	public static ResultSet getSubZonas(){
		String query= "select * from SubZona";
		return QueryMaker.executeQuery(query);
	}
	
	public static ResultSet getTipos(){
		String query = "select * from TipoEstablecimiento";
		return QueryMaker.executeQuery(query);
	}
	
	public static ResultSet getCategorias(){
		String query = "select * from Categoria";
		return QueryMaker.executeQuery(query);
	}
	
	public static ResultSet getCadenas(){
		String query = "select * from Cadena";
		return QueryMaker.executeQuery(query);
	}
	
	public static ResultSet getRelacionCCT(){
		String query = "select RelacionTipoCadenaCategoria.*, Categoria.Categoriac , Cadena.nombre from RelacionTipoCadenaCategoria, Categoria, Cadena "
				+ "where RelacionTipoCadenaCategoria.idCadena = Cadena.idCadena "
				+ "and RelacionTipoCadenaCategoria.idCategoria = Categoria.idCategoria;";
		return QueryMaker.executeQuery(query);
	}
	
	
	
	

}
