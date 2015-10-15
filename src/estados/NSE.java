package estados;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;


public class NSE {
	String[] puntos;
	String[] generos;
	
	
	public NSE(String[] puntos, String[] generos) {
		this.puntos = puntos;
		this.generos = generos;
	}


	public  ResultSet getNSE(){
		return QueryMaker.executeQuery(generateQuery());
	}
	
	
	public  String generateQuery (){
		String pun = Arrays.toString(puntos).replace("[", "(").replace("]", ")");
		String gen = Arrays.toString(generos).replace("[", "(").replace("]", ")");
		String query = "select * from NSE where idNSE in ("
				+ "select NS6 from ImpactosEconomicos where idPunto in "
				+ pun + " and Genero in " + gen +")";
	
		return query;
	}
	
	
	public  ResultSet getPuntos(){
		return QueryMaker.executeQuery(generateQueryPuntos());
		
	}
	
	
	public String generateQueryPuntos (){
		String pun = Arrays.toString(puntos).replace("[", "(").replace("]", ")");
		String gen = Arrays.toString(generos).replace("[", "(").replace("]", ")");
		String query = "select   * from PuntoDeVenta where idPuntoVenta in ( "
				+ "select idPunto from ImpactosEconomicos where idPunto in "
				+ pun +" and Genero in " + gen +  ")"
				+ " union select * from PuntoDeVenta "
				+ " where idPuntoVenta in " + pun
				+ " and idRelacionTipoCadenaCategoria in ("
				+ " select idRelacion from RelacionTipoCadenaCategoria"
				+ " where idTipo in(2,3)) order by idPuntoVenta";
		return query;
		
	}
	
	public  String getMapa (){
		ResultSet rs = getPuntos();
		return MapaScript.generateMapfromRS(rs);
	}
	
	public String generateQueryCount(){
		String pun = Arrays.toString(puntos).replace("[", "(").replace("]", ")");
		String gen = Arrays.toString(generos).replace("[", "(").replace("]", ")");
		String query = "select RelacionTipoCadenaCategoria.idTipo, count(*), sum(PuntoDeVenta.dotacion) from PuntoDeVenta, RelacionTipoCadenaCategoria "
				+ " where PuntoDeVenta.idRelacionTipoCadenaCategoria = RelacionTipoCadenaCategoria.idRelacion"
				+ " and PuntoDeVenta.idPuntoVenta in ("
				+ " select idPunto from ImpactosEconomicos "
				+ " where idPunto in " + pun
				+ " and Genero in " + gen
				+ " union select idPuntoVenta from PuntoDeVenta"
				+ " where idPuntoVenta in " + pun
				+ " and idRelacionTipoCadenaCategoria in ("
				+ " select idRelacion from RelacionTipoCadenaCategoria"
				+ " where idTipo in (2,3)))"
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
		String gen = Arrays.toString(generos).replace("[", "(").replace("]", ")");
		StringBuilder query = new StringBuilder(1000);
		query.append("select est.nombre as Estado, tipo.tipoEstablecimiento as Tipo, punto.numPunto as Punto, punto.direccion , zon.nombre as Zona, sub.nombre as SubZona, punto.dotacion ");
		query.append("From  PuntoDeVenta punto ");
		query.append("inner join SubZona sub on punto.idSubzona = sub.idSubZona ");
		query.append("inner join Zonas zon on sub.idZona = zon.idZonas ");
		query.append("inner join Estados est on zon.idEstado = est.idEstados ");
		query.append("inner join RelacionTipoCadenaCategoria rel on punto.idRelacionTipoCadenaCategoria = rel.idRelacion ");
		query.append("inner join TipoEstablecimiento tipo on rel.idTipo = tipo.idTipoEstablecimiento ");
		query.append("where punto.idPuntoVenta in ( ");
		query.append("select idPunto from ImpactosEconomicos ");
		query.append("where idPunto in " + pun);
		query.append(" and Genero in " + gen);
		query.append(" union select idPuntoVenta from PuntoDeVenta ");
		query.append(" where idPuntoVenta in " + pun);
		query.append(" and idRelacionTipoCadenaCategoria != 1 )");
		return query.toString();
	}
	
	
	
}
