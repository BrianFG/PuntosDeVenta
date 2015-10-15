package estados;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;

public class Genero {
	
	String[] puntos;
	String[] estados;
	String[] zonas;
	String[] subzonas; 
	String[] tipos;
	String[] categorias;
	String[] cadenas;
	
	
	
	
	public Genero(String[] estados, String[] zonas, String[] subzonas,
			String[] tipos, String[] categorias, String[] cadenas) {
		this.estados = estados;
		this.zonas = zonas;
		this.subzonas = subzonas;
		this.tipos = tipos;
		this.categorias = categorias;
		this.cadenas = cadenas;
		this.puntos = getIDPuntos(getPuntosRS());
	}
	
	
	public  ResultSet getGeneros(){
		return QueryMaker.executeQuery(generateQuery());
	}
	
	public  String generateQuery (){
		String pun = Arrays.toString(puntos).replace("[", "(").replace("]", ")");
		String query = "select * from Genero where idGenero in ("
				+ "select Genero from ImpactosEconomicos where idPunto in "
				+  pun +")";
		return query;
	}
	
	
	
	
	
	public String generateQueryPuntos (){
		String sub = Arrays.toString(subzonas).replace("[", "(").replace("]", ")");
		String tip = Arrays.toString(tipos).replace("[", "(").replace("]", ")");
		String cat = Arrays.toString(categorias).replace("[", "(").replace("]", ")");
		String cad = Arrays.toString(cadenas).replace("[", "(").replace("]", ")");
		String query = "select * from PuntoDeVenta where idSubZona in "
				+  sub + " and idRelacionTipoCadenaCategoria in ("
				+ "select idRelacion from RelacionTipoCadenaCategoria where idTipo in "
				+ tip + " and idCategoria in " + cat + " and idCadena in " + cad + ") order by idPuntoVenta";
		return query;
	}
	
	
	
	public String[] getIDPuntos (ResultSet rs ){
		ArrayList<String> puntosTem = new ArrayList<String>();
		try {
			while (rs.next()){
				puntosTem.add(rs.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String[] puntos = new String[puntosTem.size()];
		for (int i = 0 ; i < puntosTem.size(); i++){
			puntos[i] = puntosTem.get(i);
		}
		return puntos;
	}			
	
	
	public  ResultSet getPuntosRS (){
		return QueryMaker.executeQuery(generateQueryPuntos());
	}

	public String getMapa (){
		ResultSet rs = getPuntosRS();
		return MapaScript.generateMapfromRS(rs);
	}
	
	public String[] getPuntos(){
		return puntos;
	}
	
	public String generateQueryCount(){
		String pun = Arrays.toString(puntos).replace("[", "(").replace("]", ")");
		String query = "select RelacionTipoCadenaCategoria.idTipo, count(*), sum(PuntoDeVenta.dotacion) from PuntoDeVenta, RelacionTipoCadenaCategoria "
				+ " where PuntoDeVenta.idRelacionTipoCadenaCategoria = RelacionTipoCadenaCategoria.idRelacion"
				+ " and PuntoDeVenta.idPuntoVenta in " + pun
				+ " group by RelacionTipoCadenaCategoria.idTipo;";
		
		return query;
	}
	
	public Counter getCount(){
		int cruceros =0,  periodicoC=0, LCs=0 , periodicoLC=0 , mujeres=0, periodicoMujeres=0; 
		
		ResultSet rs = 	QueryMaker.executeQuery(generateQueryCount());
		try {
			while(rs.next()){
				int tipo = rs.getInt(1);
				switch (tipo) {
				case 1: cruceros = rs.getInt(2); periodicoC = rs.getInt(3);
					break;
				case 2: LCs = rs.getInt(2); periodicoLC = rs.getInt(3);
					break;
				case 3: mujeres = rs.getInt(2); periodicoMujeres = rs.getInt(3);
					break;

				}
						
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
		return new Counter(cruceros, periodicoC, LCs, periodicoLC, mujeres , periodicoMujeres);
	}
	
	public String getQueryDetalle(){
		String pun = Arrays.toString(puntos).replace("[", "(").replace("]", ")");
		StringBuilder query = new StringBuilder(1000);
		query.append("select est.nombre as Estado, tipo.tipoEstablecimiento as Tipo, punto.numPunto as Punto, punto.direccion , zon.nombre as Zona, sub.nombre as SubZona, punto.dotacion ");
		query.append("From  PuntoDeVenta punto ");
		query.append("inner join SubZona sub on punto.idSubzona = sub.idSubZona ");
		query.append("inner join Zonas zon on sub.idZona = zon.idZonas ");
		query.append("inner join Estados est on zon.idEstado = est.idEstados ");
		query.append("inner join RelacionTipoCadenaCategoria rel on punto.idRelacionTipoCadenaCategoria = rel.idRelacion ");
		query.append("inner join TipoEstablecimiento tipo on rel.idTipo = tipo.idTipoEstablecimiento ");
		query.append("where punto.idPuntoVenta in " + pun);
		return query.toString();
	}
	

	

}

