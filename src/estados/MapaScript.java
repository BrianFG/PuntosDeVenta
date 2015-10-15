package estados;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;



public class MapaScript {
	
	
	public static void main(String[] args) {
		ArrayList<String > puntos = new ArrayList<String>();
		puntos.add("1");
		puntos.add("2");
		puntos.add("3");
		puntos.add("4");
		getTipo(puntos);
		
	}
	
	

	public static String generateMapScript(double[] lat , double lng [], String[] desc,ArrayList<String> tipos) {
		double [] center = getCentralPoint(lat, lng);
		double centroLat = center[0];
		double centroLng = center[1];
		String markers = generateMarkers(lat, lng, desc , tipos);
		String fullScript = initiateScript(centroLat, centroLng, markers);
		
		
		
		
		return fullScript;
	}
	
	public static double[] getCentralPoint (double[] lat , double[] lng){
		double[] center = new double[2];
		double[] latitude = lat.clone();
		double[] longitude = lng.clone();
		Arrays.sort(latitude);Arrays.sort(longitude);
		center[0] = (latitude[0] + latitude[latitude.length-1])/2.0;
		center[1] = (longitude[0] + longitude[longitude.length-1])/2.0;
		
		
		return center;
		
	}
	
	public static String generateMarkers (double[] lat , double lng [], String[] desc , ArrayList<String> tipos){
		StringBuilder script = new StringBuilder(5000);
		for (int i = 0 ; i < lat.length; i++){
			//creating Markers
			script.append("var marker" + i + " = new google.maps.Marker({");
			String tipo = tipos.get(i);
			if (tipo.equals("1")){
				script.append("position:new google.maps.LatLng(" + lat[i] + "," + lng[i]+ "),icon:pinGreen });\n");
			}else if (tipo.equals("2")){
			
				script.append("position:new google.maps.LatLng(" + lat[i] + "," + lng[i]+ "),icon:pinLemon });\n");
			}else if (tipo.equals("3")){
				script.append("position:new google.maps.LatLng(" + lat[i] + "," + lng[i]+ "),icon:pinPink });\n");
			}
			
			script.append("marker" + i + ".setMap(map);\n");
			//creating InfoWindow
			String name = desc[i];
			String rep = name.replaceAll("\"", "\'");
			script.append("var infowindow" + i + "= new google.maps.InfoWindow({");
			script.append("content:\""+ rep + "\"});\n");
			script.append("google.maps.event.addListener(marker" + i +  ", 'click', function() {");
			script.append("infowindow"+ i +".open(map,marker"+ i +");});\n\n");
			
		}
		
		return script.toString();
	}
	
	public static String initiateScript (double latCenter, double lngCenter, String markers){
		StringBuilder script = new StringBuilder(1000);
		String lemonMarker = "http://steeplemedia.com/images/markers/markerGreen.png";
		String greenMarker = "http://maps.gpsvisualizer.com/google_maps/icons/google/green.png";
		String pinkMarker = "http://maps.google.com/mapfiles/ms/micons/pink-dot.png";
		
		
		script.append("<script \nsrc=\"http://maps.googleapis.com/maps/api/js?key=AIzaSyDY0kkJiTPVd2U7aTOAwhc9ySH6oHxOIYM&sensor=false\">\n</script>\n\n");
		script.append("<script>\n\nvar myCenter=new google.maps.LatLng(" + latCenter + ","+ lngCenter + ");\n");
		script.append("var pinLemon = new google.maps.MarkerImage(\"" + lemonMarker + "\");\n\n");
		script.append("var pinGreen = new google.maps.MarkerImage(\"" + greenMarker + "\");\n\n");
		script.append("var pinPink = new google.maps.MarkerImage(\"" + pinkMarker + "\");\n\n");
		script.append("var map; \n");
		script.append("function initialize()\n{\n\n");
		script.append("var mapa = {\ncenter:myCenter,\nzoom:9,\nmapTypeId:google.maps.MapTypeId.ROADMAP \n};\n\n");
		script.append("map=new google.maps.Map(document.getElementById(\"googleMap\"),mapa);\n\n");
		script.append("function resize(){");

	     script.append(" google.maps.event.trigger(map, 'resize');");

	    script.append(" };");
		script.append(markers);
		script.append("\n\n}\n\n");
		script.append("google.maps.event.addDomListener(window, 'load', initialize);\n\n</script>");
		return script.toString();
	}
	
	
	public static String generateMapfromRS (ResultSet rs){
		
		ArrayList<Double> lat = new ArrayList<Double>();
		ArrayList<Double> lng = new ArrayList<Double>();
		ArrayList<String> desc = new ArrayList<String>();
		ArrayList<String> puntos = new ArrayList<String>();
		try {
			
			while (rs.next()){
				puntos.add(rs.getString(1));
				lat.add(rs.getDouble(7));
				lng.add(rs.getDouble(8));
				desc.add(rs.getString(2)+ " / " + rs.getString(3));
				
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		double[] lat2 = new double[lat.size()];
		double[] lng2 = new double[lng.size()];
		String[] desc2 = new String[desc.size()];
		
		
		for (int j = 0 ; j < lat.size(); j++){
			lat2[j] = lat.get(j);
			lng2[j] = lng.get(j);
			desc2[j] = desc.get(j);
			
		}
		ArrayList<String> tipos = getTipo(puntos);
		
		
		return generateMapScript(lat2, lng2, desc2, tipos);
	}
	
	public static String generateMapfrom2RS (ResultSet rs, ResultSet rs2){
		
		ArrayList<Double> lat = new ArrayList<Double>();
		ArrayList<Double> lng = new ArrayList<Double>();
		ArrayList<String> desc = new ArrayList<String>();
		ArrayList<String> puntos = new ArrayList<String>();
		try {
			
			while (rs.next()){
				puntos.add(rs.getString(1));
				lat.add(rs.getDouble(7));
				lng.add(rs.getDouble(8));
				desc.add(rs.getString(2)+ " / " + rs.getString(3));
				
			}
			
			while (rs2.next()){
				puntos.add(rs2.getString(1));
				lat.add(rs2.getDouble(7));
				lng.add(rs2.getDouble(8));
				desc.add(rs2.getString(2)+ " / " + rs2.getString(3));
			}
			
			rs.close();
			rs2.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		double[] lat2 = new double[lat.size()];
		double[] lng2 = new double[lng.size()];
		String[] desc2 = new String[desc.size()];
		
		
		for (int j = 0 ; j < lat.size(); j++){
			lat2[j] = lat.get(j);
			lng2[j] = lng.get(j);
			desc2[j] = desc.get(j);
			
		}
		ArrayList<String> tipos = getTipo(puntos);
		
		
		return generateMapScript(lat2, lng2, desc2, tipos);
	}
	
	public static ArrayList<String> getTipo( ArrayList<String> idPuntos){
		ArrayList<String> tipos = new ArrayList<String>();
		String pun = idPuntos.toString().replace("[", "(").replace("]", ")");
		String query = "select PuntoDeVenta.idPuntoVenta , RelacionTipoCadenaCategoria.idTipo from PuntoDeVenta  , RelacionTipoCadenaCategoria "
				+ "where PuntoDeVenta.idRelacionTipoCadenaCategoria = RelacionTipoCadenaCategoria.idRelacion"
				+ " and PuntoDeVenta.idPuntoVenta in "+ pun + " order by  PuntoDeVenta.idPuntoVenta";
		
		ResultSet rs = QueryMaker.executeQuery(query);
		try {
			
			while(rs.next()){
				tipos.add(rs.getString(2));
			}
			
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		
		return tipos;
	}
	
}
