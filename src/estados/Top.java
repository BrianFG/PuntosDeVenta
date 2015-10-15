package estados;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;

public class Top {
	
	String[] puntos;  
	String[] generos; 
	String[] nse; 
	String[] edades; 
	int top;
	
	
	
	public Top(String[] puntos, String[] generos, String[] nse,
			String[] edades, int top) {
		this.puntos = puntos;
		this.generos = generos;
		this.nse = nse;
		this.edades = edades;
		this.top = top;
	}

	public  ResultSet getTopPuntos (){
		return QueryMaker.executeQuery(generateQueryTop());
	}

	public  String generateQueryTop (){
		String pun = Arrays.toString(puntos).replace("[", "(").replace("]", ")");
		String gen = Arrays.toString(generos).replace("[", "(").replace("]", ")");
		String ns  = Arrays.toString(nse).replace("[", "(").replace("]", ")");
		String eda = Arrays.toString(edades).replace("[", "(").replace("]", ")");
		String query = "select PuntoDeVenta.* , avg(Impactos) from PuntoDeVenta , ImpactosEconomicos"
				+ " where PuntoDeVenta.idPuntoVenta = ImpactosEconomicos.idPunto"
				+ " and  idPunto in " + pun 
				+ " and Genero in " + gen +  " and NS6 in " + ns + "and Edad in " + eda
				+ " group by idPunto order by avg(Impactos) desc , idPuntoVenta limit " + top;
		return query;
	}
	
	public  String generateQueryPuntos(){
		String pun = Arrays.toString(puntos).replace("[", "(").replace("]", ")");
		String query = "select * from PuntoDeVenta"
				+ " where idPuntoVenta in " + pun 
				+ " and idRelacionTipoCadenaCategoria in ("
				+ " select idRelacion from RelacionTipoCadenaCategoria"
				+ " where idTipo in (2,3))";
		return query;
	}
	
	public  ResultSet getPuntos (){
		return QueryMaker.executeQuery(generateQueryPuntos());
	}
	
	public  String getMString(){
		ResultSet rs = getTopPuntos();
		ResultSet rs2 = getPuntos();
		return MapaScript.generateMapfrom2RS( rs, rs2);
	}
	
	public ArrayList<String> getArray(){
		ArrayList<String> ids = new ArrayList<String>();
		ResultSet rs = getTopPuntos();
		ids.add("0");
		try {
			
			while (rs.next()){
				ids.add(rs.getString(1));
			
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ids;
	}
	
	public  String generateQueryCount(){
		String pun = Arrays.toString(puntos).replace("[", "(").replace("]", ")");
		String pun2 = getArray().toString().replace("[", "(").replace("]", ")");

		String query = "select RelacionTipoCadenaCategoria.idTipo, count(*), sum(PuntoDeVenta.dotacion) from PuntoDeVenta, RelacionTipoCadenaCategoria "
				+ " where PuntoDeVenta.idRelacionTipoCadenaCategoria = RelacionTipoCadenaCategoria.idRelacion"
				+ " and PuntoDeVenta.idPuntoVenta in ("
				+ " select idPuntoVenta from PuntoDeVenta "
				+ " where idPuntoVenta in " + pun2
				+ " union select idPuntoVenta from PuntoDeVenta"
				+ " where idPuntoVenta in " + pun
				+ " and idRelacionTipoCadenaCategoria in ("
				+ " select idRelacion from RelacionTipoCadenaCategoria"
				+ " where idTipo in (2,3)))"
				+ " group by RelacionTipoCadenaCategoria.idTipo;";
		
		return query;
	}
	
	public  Counter getCount(){
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
		String pun2 = getArray().toString().replace("[", "(").replace("]", ")");
		String gen = Arrays.toString(generos).replace("[", "(").replace("]", ")");
		String ns  = Arrays.toString(nse).replace("[", "(").replace("]", ")");
		String eda = Arrays.toString(edades).replace("[", "(").replace("]", ")");
		StringBuilder query = new StringBuilder(1000);
		query.append("select est.nombre as Estado, tipo.tipoEstablecimiento as Tipo, punto.numPunto as Punto, punto.direccion , zon.nombre as Zona, sub.nombre as SubZona, punto.dotacion ");
		query.append("From  PuntoDeVenta punto ");
		query.append("inner join SubZona sub on punto.idSubzona = sub.idSubZona ");
		query.append("inner join Zonas zon on sub.idZona = zon.idZonas ");
		query.append("inner join Estados est on zon.idEstado = est.idEstados ");
		query.append("inner join RelacionTipoCadenaCategoria rel on punto.idRelacionTipoCadenaCategoria = rel.idRelacion ");
		query.append("inner join TipoEstablecimiento tipo on rel.idTipo = tipo.idTipoEstablecimiento ");
		query.append("where punto.idPuntoVenta in ");
		query.append(pun2);
		query.append(" or punto.idPuntoVenta in ( select idPuntoVenta from PuntoDeVenta ");
		query.append(" where idRelacionTipoCadenaCategoria != 1 ");
		query.append("and idPuntoVenta in " + pun + ")");
		return query.toString();
	}
	
}
