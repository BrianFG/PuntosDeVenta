package captura;


import javax.servlet.http.HttpSession;

import estados.QueryMaker;

public class Elimina {
	
	
	public static String getQueryDelPunto(String subzona, String tipo, String categoria, 
			String cadena, String nombre, String direccion, String lng, String lat, String dotacion){
		HttpSession sesion;
		return null;
	}
	public static boolean eliminaPunto (String idPunto){
		String query = "delete from PuntoDeVenta where idPuntoVenta = " + idPunto;
		if (!QueryMaker.executeUpdate(query))return false;
		return true;
	}
	
	public static boolean eliminaEstado (String idEstado){
		String query1 = "delete from PuntoDeVenta where idSubzona in ("
				+ " select idSubzona from SubZona where idZona in ("
				+ " select idZonas from Zonas where idEstado = " + idEstado + " ));";
		String query2 = " delete from SubZona where idZona in ("
				+ " select idZonas from Zonas where idEstado = " + idEstado + ");";
		String query3 = " delete from Zonas where idEstado = " + idEstado + ";";
		String query4 = " delete from Estados where idEstados = " + idEstado + ";";
		
		
		if (!QueryMaker.executeUpdate(query1)) return false;
		if (!QueryMaker.executeUpdate(query2)) return false;
		if (!QueryMaker.executeUpdate(query3)) return false;
		if (!QueryMaker.executeUpdate(query4)) return false;
		
		return true;
	}
	

	
	
	public static boolean eliminaZona (String idZona){
		String query1 = "delete from PuntoDeVenta where idSubzona in ("
				+ " select idSubzona from SubZona where idZona = " + idZona + ")";
		String query2 = "delete from SubZona where idZona = " + idZona;
		String query3 = "delete from Zonas where idZonas = " + idZona;
		if (!QueryMaker.executeUpdate(query1))return false;
		if (!QueryMaker.executeUpdate(query2))return false;
		if (!QueryMaker.executeUpdate(query3))return false;
		return true;
	}
	
	public static boolean eliminaSubZona (String idSubZona){
		String query1 = "delete from PuntoDeVenta where idSubzona  = " + idSubZona;
		String query2 = "delete from SubZona where idSubzona = " + idSubZona;
		if (!QueryMaker.executeUpdate(query1)) return false;
		if (!QueryMaker.executeUpdate(query2)) return false;
		return true;
	}
	
	public static boolean eliminaTipo( String idTipo){
		String query1 = "delete from PuntoDeVenta where idRelacionTipoCadenaCategoria in ("
				+ " select idRelacion from RelacionTipoCadenaCategoria"
				+ " where idTipo = "+ idTipo + " )";
		String query2 = "delete from RelacionTipoCadenaCategoria where idTipo = " + idTipo;
		String query3 = "delete from TipoEstablecimiento where idTipoEstablecimiento = " + idTipo;
		if (!QueryMaker.executeUpdate(query1))return false;
		if (!QueryMaker.executeUpdate(query2))return false;
		if (!QueryMaker.executeUpdate(query3))return false;
		return true;
	}
	
	public static boolean eliminaCadena(String idCadena){
		String query1 = "delete from PuntoDeVenta where idRelacionTipoCadenaCategoria in ("
				+ " select idRelacion from RelacionTipoCadenaCategoria"
				+ " where idCadena = "+ idCadena + " )";
		String query2 = "delete from RelacionTipoCadenaCategoria where idCadena = " + idCadena;
		String query3 = "delete from Cadena where idCadena = " + idCadena;
		if (!QueryMaker.executeUpdate(query1))return false;
		if (!QueryMaker.executeUpdate(query2))return false;
		if (!QueryMaker.executeUpdate(query3))return false;
		return true;
	}
	
	public static boolean eliminaCategoria(String idCategoria){
		String query1 = "delete from PuntoDeVenta where idRelacionTipoCadenaCategoria in ("
				+ " select idRelacion from RelacionTipoCadenaCategoria"
				+ " where idCategoria = " +  idCategoria + ")";
		String query2 = "delete from RelacionTipoCadenaCategoria where idCategoria = " + idCategoria;
		String query3 = "delete from Categoria where idCategoria = " + idCategoria;
		if (!QueryMaker.executeUpdate(query1))return false;
		if (!QueryMaker.executeUpdate(query2))return false;
		if (!QueryMaker.executeUpdate(query3))return false;
		return true;
	}
	



}
