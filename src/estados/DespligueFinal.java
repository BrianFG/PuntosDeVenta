package estados;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;


public class DespligueFinal  {

	String[] puntos;
	String[] generos;
	String[] nse;
	String[] edades;
	
	
	
	public DespligueFinal(String[] puntos, String[] generos, String[] nse,
			String[] edades) {
		this.puntos = puntos;
		this.generos = generos;
		this.nse = nse;
		this.edades = edades;
	}


	public ResultSet getPuntos(){	
		return QueryMaker.executeQuery(generateQuery());
	}
	
	
	public  String generateQuery (){
		String pun = Arrays.toString(puntos).replace("[", "(").replace("]", ")");
		String gen = Arrays.toString(generos).replace("[", "(").replace("]", ")");
		String ns  = Arrays.toString(nse).replace("[", "(").replace("]", ")");
		String eda = Arrays.toString(edades).replace("[", "(").replace("]", ")");
		String query = "select * from PuntoDeVenta where idPuntoVenta in ( "
				+ "select idPunto from ImpactosEconomicos where idPunto in "
				+ pun +" and Genero in " + gen + " and NS6 in " + ns + " and Edad in " + eda + ")"
				+ " union select * from PuntoDeVenta "
				+ " where idPuntoVenta in " + pun
				+ " and idRelacionTipoCadenaCategoria in ("
				+ " select idRelacion from RelacionTipoCadenaCategoria"
				+ " where idTipo in(2,3)) order by idPuntoVenta";
		return query;
	}
	
	public ResultSet getTop (int top){
		return QueryMaker.executeQuery(generateQueryTop(top));
	}
	
	public String generateQueryTop(int top){
		String pun = Arrays.toString(puntos).replace("[", "(").replace("]", ")");
		String gen = Arrays.toString(generos).replace("[", "(").replace("]", ")");
		String ns  = Arrays.toString(nse).replace("[", "(").replace("]", ")");
		String eda = Arrays.toString(edades).replace("[", "(").replace("]", ")");
		String query = "select ImpactosEconomicos.* , PuntoDeVenta.direccion from ImpactosEconomicos, PuntoDeVenta "
				+ " where ImpactosEconomicos.idPunto = PuntoDeVenta.idPuntoVenta and"
				+ " idPunto in "
				+ pun +" and Genero in " + gen + " and NS6 in " + ns + " and Edad in " + eda
				+ " order by Impactos desc limit " + top;
		
		return query;
	}
	
	public  String getMapScript (){
		ResultSet rs = getPuntos();
		return MapaScript.generateMapfromRS(rs);
	}
	
	public  ArrayList<String> getImpactos(){
		ArrayList<String> impactos = new ArrayList<String>();
		ResultSet rs = getTop(100);
		try {
			while (rs.next()){
				String imp = "";
				for (int i = 1 ; i < 9 ; i ++){
					imp += rs.getString(i) + ",";
				}
				imp += rs.getString(9);
				
				impactos.add(imp);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		return impactos;
	}
	
	public String generateQueryCount(){
		String pun = Arrays.toString(puntos).replace("[", "(").replace("]", ")");
		String gen = Arrays.toString(generos).replace("[", "(").replace("]", ")");
		String ns  = Arrays.toString(nse).replace("[", "(").replace("]", ")");
		String eda = Arrays.toString(edades).replace("[", "(").replace("]", ")");
		String query = "select RelacionTipoCadenaCategoria.idTipo, count(*), sum(PuntoDeVenta.dotacion) from PuntoDeVenta, RelacionTipoCadenaCategoria "
				+ " where PuntoDeVenta.idRelacionTipoCadenaCategoria = RelacionTipoCadenaCategoria.idRelacion"
				+ " and PuntoDeVenta.idPuntoVenta in ("
				+ " select idPunto from ImpactosEconomicos "
				+ " where idPunto in " + pun
				+ " and Genero in " + gen + " and NS6 in " + ns  + " and Edad in " + eda
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
		query.append("where punto.idPuntoVenta in ( ");
		query.append("select idPunto from ImpactosEconomicos ");
		query.append("where idPunto in " + pun);
		query.append(" and Genero in " + gen);
		query.append(" and NS6 in " + ns);
		query.append(" and Edad in " + eda);
		query.append(" union select idPuntoVenta from PuntoDeVenta ");
		query.append(" where idPuntoVenta in " + pun);
		query.append(" and idRelacionTipoCadenaCategoria != 1 )");
		return query.toString();
	}
	
	

	
}
