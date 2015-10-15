package captura;

import java.sql.ResultSet;
import java.sql.SQLException;

import estados.QueryMaker;

public class Inserta {
	
	public static String getQueryInPunto(String subzona, String tipo, String categoria, 
			String cadena, String nombre, String direccion, String lng, String lat, String dotacion){
		StringBuilder query = new StringBuilder(1000);
		String idPQuery = "select max(idPuntoVenta)+1 from PuntoDeVenta";
		String idRQuery = "select idRelacion from RelacionTipoCadenaCategoria "
				+ " where idTipo =" + tipo + " and idCategoria = " + categoria 
				+ " and idCadena = " + cadena;
		ResultSet idP = QueryMaker.executeQuery(idPQuery);
		ResultSet idR = QueryMaker.executeQuery(idRQuery);
		int idPunto=1;
		int idRelacion=1;
		try {
			idP.next();
			idPunto = idP.getInt(1);
			idR.next();
			idRelacion = idR.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		query.append("insert into PuntoDeVenta values(");
		query.append(idPunto + " , ");
		query.append("'"+ nombre + "' , ");
		query.append("'"+ direccion + "' , ");
		query.append(subzona + " , ");
		query.append(idRelacion + " , 1 , ");
		query.append(lng + " , ");
		query.append(lat + " , ");
		query.append(dotacion + " , null , null)");
		return query.toString();
	}
	
	public static String getQueryInEstado (String nombre){
		String query = "";
		String idEQuery = "select max(idEstados)+1 from Estados";
		ResultSet idE = QueryMaker.executeQuery(idEQuery);
		int idEstado = 100;
		try {
			idE.next();
			idEstado = idE.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		query = "insert into Estados values ( "+ idEstado + " , '" + nombre + "' , 1 )";
		return query;
	}
	
	
	public static String getQueryInZona (String nombre, String estado){
		String query = "";
		String idZQuery = "select max(idZonas)+1 from Zonas";
		ResultSet idZ = QueryMaker.executeQuery(idZQuery);
		int idZona = 100;
		try {
			idZ.next();
			idZona = idZ.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		query = "insert into Zonas values ( "+ idZona + " , '" + nombre + "' , " +  estado + " )";
		return query;
	}
	
	public static String getQueryInSubZona (String nombre, String zona){
		String query = "";
		String idSQuery = "select max(idSubzona)+1 from SubZona";
		ResultSet idS = QueryMaker.executeQuery(idSQuery);
		int idSubZona = 100;
		try {
			idS.next();
			idSubZona = idS.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		query = "insert into SubZona values ( "+ idSubZona + " , '" + nombre + "' , " +  zona + " )";
		return query;
	}
	
	public static String getQueryInTipo(String nombre){
		String query = "";
		String idTQuery = "select max(idTipoEstablecimiento)+1 from TipoEstablecimiento";
		ResultSet idT = QueryMaker.executeQuery(idTQuery);
		int idTipo = 100;
		try {
			idT.next();
			idTipo = idT.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		query = "insert into TipoEstablecimiento values ( "+ idTipo + " , '" + nombre +  "')";
		return query;
	}
	
	public static String getQueryInCategoria(String nombre){
		String query = "";
		String idCQuery = "select max(idCategoria)+1 from Categoria";
		ResultSet idC = QueryMaker.executeQuery(idCQuery);
		int idCategoria = 100;
		try {
			idC.next();
			idCategoria = idC.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		query = "insert into Categoria values ( "+ idCategoria + " , '" + nombre +  "')";
		return query;
	}
	
	public static String getQueryInCadena(String nombre){
		String query = "";
		String idCQuery = "select max(idCadena)+1 from Cadena";
		ResultSet idC = QueryMaker.executeQuery(idCQuery);
		int idCadena = 100;
		try {
			idC.next();
			idCadena = idC.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		query = "insert into Cadena values ( "+ idCadena + " , '" + nombre +  "')";
		return query;
	}
	

}
