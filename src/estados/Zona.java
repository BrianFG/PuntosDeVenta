package estados;
import java.sql.*;
import java.util.Arrays;

public class Zona {
	
	private String[] estados;
	
	public Zona(String[] estados) {
		this.estados = estados;
	}

	public ResultSet getPuntos (){
		return QueryMaker.executeQuery(generateQueryPuntos());
	}
	
	public String generateQueryPuntos (){
		String st = Arrays.toString(estados).replace("[","(").replace("]", ")");
		
		String query2 = "select * from PuntoDeVenta where idSubzona in ("
				+ "select idSubzona from SubZona where idZona in ("
				+ "select idZonas from Zonas where idEstado in "+ st + ")) order by idPuntoVenta";
		
		return query2;
	}
	
	
	public String getMapa (){
		ResultSet rs = getPuntos();
		return MapaScript.generateMapfromRS(rs);
	}
	
	
	
	
	public  String generateQuery (){
		String val = Arrays.toString(estados).replace("[", "(").replace("]", ")");
		
		
		String query2 = "select Zonas.idZonas , Zonas.nombre , Estados.nombre  from Zonas , Estados "
				+ "where Estados.idEstados = Zonas.idEstado "
				+ "and Zonas.idEstado in " + val;
		
		return query2;
	}

	public  ResultSet getZonas(){
		return QueryMaker.executeQuery(generateQuery());
	}
	
	public String generateQueryCount  (){
		String st = Arrays.toString(estados).replace("[","(").replace("]", ")");
		String query ="select RelacionTipoCadenaCategoria.idTipo, count(*), sum(PuntoDeVenta.dotacion) from PuntoDeVenta, RelacionTipoCadenaCategoria "
				+ " where PuntoDeVenta.idRelacionTipoCadenaCategoria = RelacionTipoCadenaCategoria.idRelacion"
				+ " and idSubzona in (select idSubzona from SubZona where idZona in ("
				+ " select idZonas from Zonas where idEstado in " + st +  " )) "
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
		String st = Arrays.toString(estados).replace("[","(").replace("]", ")");
		StringBuilder query = new StringBuilder(1000);
		query.append("select est.nombre as Estado, tipo.tipoEstablecimiento as Tipo, punto.numPunto as Punto, punto.direccion , zon.nombre as Zona, sub.nombre as SubZona, punto.dotacion ");
		query.append("From  PuntoDeVenta punto ");
		query.append("inner join SubZona sub on punto.idSubzona = sub.idSubZona ");
		query.append("inner join Zonas zon on sub.idZona = zon.idZonas ");
		query.append("inner join Estados est on zon.idEstado = est.idEstados ");
		query.append("inner join RelacionTipoCadenaCategoria rel on punto.idRelacionTipoCadenaCategoria = rel.idRelacion ");
		query.append("inner join TipoEstablecimiento tipo on rel.idTipo = tipo.idTipoEstablecimiento ");
		query.append("where est.idEstados in " + st);
		
		return query.toString();
	}
}
