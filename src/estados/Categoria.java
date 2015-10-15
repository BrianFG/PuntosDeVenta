package estados;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;


public class Categoria {
	
	String[] subzonas;
	String[] tipos;
	
	
	
	public Categoria(String[] subzonas, String[] tipos) {
		this.subzonas = subzonas;
		this.tipos = tipos;
	}

	public ResultSet getCategorias(){
		return QueryMaker.executeQuery(generateQuery());
	}

	public String generateQuery() {
		String sub = Arrays.toString(subzonas).replace("[", "(").replace("]", ")");
		String tip = Arrays.toString(tipos).replace("[", "(").replace("]", ")");
		String query = "select * from Categoria where idCategoria in ("
				+ "select idCategoria from RelacionTipoCadenaCategoria where idRelacion in ("
				+ "select idRelacionTipoCadenaCategoria from PuntoDeVenta"
				+ " where idSubzona in " + sub + ") and idTipo in " + tip +");";
		return query;	
	}
	
	public  ResultSet getPuntos (){
		return QueryMaker.executeQuery(generateQueryPuntos());
	}
	
	public  String generateQueryPuntos ( ){
		String sub = Arrays.toString(subzonas).replace("[", "(").replace("]", ")");
		String tip = Arrays.toString(tipos).replace("[", "(").replace("]", ")");
		String query = "select * from PuntoDeVenta where idSubzona in "
				+  sub + " and idRelacionTipoCadenaCategoria in ("
				+ " select idRelacion from RelacionTipoCadenaCategoria "
				+ " where idTipo in "+ tip +  ") order by idPuntoVenta";
		return query;
	}
	
	
	public  String getMapa (){
		ResultSet rs = getPuntos();
		return MapaScript.generateMapfromRS(rs);
	}
	
	public String generateQueryCount(){
		String sub = Arrays.toString(subzonas).replace("[", "(").replace("]", ")");
		String tip = Arrays.toString(tipos).replace("[", "(").replace("]", ")");
		String query = "select RelacionTipoCadenaCategoria.idTipo, count(*), sum(PuntoDeVenta.dotacion) from PuntoDeVenta, RelacionTipoCadenaCategoria "
				+ " where PuntoDeVenta.idRelacionTipoCadenaCategoria = RelacionTipoCadenaCategoria.idRelacion"
				+ " and idSubzona in " + sub +" and idRelacionTipoCadenaCategoria in ("
				+ " select idRelacion from RelacionTipoCadenaCategoria where idTipo in " + tip +  ")"
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
		String sub = Arrays.toString(subzonas).replace("[", "(").replace("]", ")");
		String tip = Arrays.toString(tipos).replace("[", "(").replace("]", ")");
		StringBuilder query = new StringBuilder(1000);
		query.append("select est.nombre as Estado, tipo.tipoEstablecimiento as Tipo, punto.numPunto as Punto, punto.direccion , zon.nombre as Zona, sub.nombre as SubZona, punto.dotacion ");
		query.append("From  PuntoDeVenta punto ");
		query.append("inner join SubZona sub on punto.idSubzona = sub.idSubZona ");
		query.append("inner join Zonas zon on sub.idZona = zon.idZonas ");
		query.append("inner join Estados est on zon.idEstado = est.idEstados ");
		query.append("inner join RelacionTipoCadenaCategoria rel on punto.idRelacionTipoCadenaCategoria = rel.idRelacion ");
		query.append("inner join TipoEstablecimiento tipo on rel.idTipo = tipo.idTipoEstablecimiento ");
		query.append("where sub.idSubZona in " + sub);
		query.append(" and rel.idTipo in " + tip);
		return query.toString();
	}
	
}
