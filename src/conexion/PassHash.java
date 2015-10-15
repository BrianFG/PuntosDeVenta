package conexion;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


public class PassHash {
	
	public static void main(String[] args) throws NoSuchAlgorithmException {
        String passwordToHash = "pass$$word";//this will be the lain text password
        String salt = "us2"; //this will be the username
        salt = getSecurePassword(salt, "mexbpo");
         
        String securePassword = getSecurePassword(passwordToHash, salt);
        System.out.println(securePassword);
        
        
        
    }
	
	
	
	 private static String getSecurePassword(String passwordToHash, String salt){
	        String generatedPassword = null;
	        try {
	            MessageDigest md = MessageDigest.getInstance("SHA-512");
	            md.update(salt.getBytes());
	            byte[] bytes = md.digest(passwordToHash.getBytes());
	            StringBuilder sb = new StringBuilder();
	            for(int i=0; i< bytes.length ;i++){
	                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
	            }
	            generatedPassword = sb.toString();
	        }
	        catch (NoSuchAlgorithmException e){
	            e.printStackTrace();
	        }
	        return generatedPassword;
	    }
	

}
