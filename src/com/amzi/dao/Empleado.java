package com.amzi.dao;



import java.math.BigInteger;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conexion.EmailBPO;
import conexion.db_conexion;

public class Empleado {
	
	public static boolean necesitaActualizar(String n, String p){
		Connection cone = db_conexion.cone();
		PreparedStatement ps;
		int dias = 0;
		try {
			ps = cone.prepareStatement("select DATEDIFF(NOW(), actualizacion)  from Usuarios where noEmpleado=? and CAST(AES_DECRYPT(password, 'Mexico01') AS char(50))=?");
			ps.setString(1, n);
			ps.setString(2, p);
			ResultSet rs = ps.executeQuery();
			if (rs.next()){
				dias = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		return dias >= 30 ? true: false;
	}
	
	public static String actualizar(String n, String p){
		SecureRandom random = new SecureRandom();	
		String pass = new BigInteger(50, random).toString(32);
		String query = "update Usuarios set password = AES_ENCRYPT(?, 'Mexico01'), actualizacion = now() where noEmpleado = ?";
		String query2 = "select correo from Usuarios where noEmpleado = ?";
		Connection cone = db_conexion.cone();
		PreparedStatement ps;
		String correo = "";
		try {
			ps = cone.prepareStatement(query);
			ps.setString(1, pass);
			ps.setString(2, n);
			ps.executeUpdate();
			ps = cone.prepareStatement(query2);
			ps.setString(1, n);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				correo = rs.getString(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String[] correos = {correo};
		String texto = "Usuario : " + n + "\n" + "Contraseña : " + pass; 
		EmailBPO email = new EmailBPO(correos, texto,"Nueva Contrasena App de Mapas");
		email.send();
		String mensaje = "Tu contraseña ha cambiado. Puedes encontrar tu nueva contraseña en tu correo :  " + correo;
		return mensaje;
	}

}
