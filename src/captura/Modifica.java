package captura;

public class Modifica {
	
	public static String getQueryModGeneral (String tabla , String campo, String nuevo, String campoID, String id){
		String query = "update " +tabla +  " set " + campo + " = '" + nuevo + "'";
		query += " where " + campoID + " = " + id;
		return query;
	}
	
	public static String getQueryModEstado(String nuevo, String id){
		return getQueryModGeneral("Estados", "nombre", nuevo, "idEstados", id);
	}
	
	public static String getQueryModZona(String nuevo, String id){
		return getQueryModGeneral("Zonas", "nombre", nuevo, "idZonas", id);
	}
	
	public static String getQueryModSubZona(String nuevo, String id){
		return getQueryModGeneral("SubZona", "nombre", nuevo, "idSubZona", id);
	}
	
	public static String getQueryModTipo(String nuevo, String id){
		return getQueryModGeneral("TipoEstablecimiento", "tipoEstablecimiento", nuevo, "idTipoEstablecimiento", id);
	}
	
	public static String getQueryModCategoria(String nuevo, String id){
		return getQueryModGeneral("Categoria", "Categoriac", nuevo, "idCategoria", id);
	}
	
	public static String getQueryModCadena(String nuevo, String id){
		return getQueryModGeneral("Cadena", "nombre", nuevo, "idCadena", id);
	}
	
	public static String getQueryModPunto (String nombre, String direccion, String lng, String lat, String dotacion, String idPunto ){
		String query = "update PuntoDeVenta set numPunto = '" + nombre + "' , "
				+ "direccion = '" +  direccion + "', longitud = " + lng + " , "
				+ "latitud = " + lat + " , dotacion = " + dotacion + " where idPuntoVenta = " + idPunto;
		return query;
	}

}
