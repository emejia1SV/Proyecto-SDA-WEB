package sv.avantia.depurador.agregadores.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.apache.xerces.impl.dv.util.Base64;


public class TestMain {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		/**
		  <wsse:Username>PA00000737</wsse:Username>
          <wsse:Password Type="...#PasswordDigest">x9t/yLcnC3VYKCb6v0uezTwYJNk=</wsse:Password>
          <wsse:Nonce>096459e93f20a2b39ab6c5ddd493e44f58bc3a91</wsse:Nonce>
          <wsse:Created>2012-10-17T11:51:50.263Z</wsse:Created>

			El psw sin encriptar es:  Admin111
		 * */
		
		String timestamp = fechaFormated();
		String pass = "Admin111";
		String user = "PA00000737";
		String nonce = java.util.UUID.randomUUID().toString();

		timestamp = "2012-10-17T11:51:50.263Z";
		nonce = "096459e93f20a2b39ab6c5ddd493e44f58bc3a91";
		try {
			System.out.println(user);
			System.out.println(pass);
			System.out.println(timestamp);
			
			System.out.println("x9t/yLcnC3VYKCb6v0uezTwYJNk=");
			System.out.println(contraseniaSMT(nonce, timestamp, pass));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}		
	}
	
	//PasswordDigest = Base64 (SHA-1 (nonce + created + password)) 
	private static String contraseniaSMT(String nonce, String timestamp, String pass) throws NoSuchAlgorithmException{
		String concatenacion = nonce.concat(timestamp).concat(pass);
		MessageDigest md = MessageDigest.getInstance("SHA-1");
		md.update(concatenacion.getBytes());
		return Base64.encode(md.digest());
	}
	
	private static String fechaFormated(){
    	SimpleDateFormat dateT = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
    	return dateT.format(Calendar.getInstance().getTime());
    }   
}