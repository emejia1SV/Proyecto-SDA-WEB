package sv.avantia.depurador.agregadores.utils;

import java.util.Hashtable;

import javax.naming.Context;
import javax.naming.directory.InitialDirContext;

import org.apache.log4j.Logger;

public class ValidacionLDAP {

	/**
	 * Obtener el appender para la impresión en un archivo de LOG
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * */
	public static Logger logger = Logger.getLogger("avantiaLogger");
	private String INITCTX = "com.sun.jndi.ldap.LdapCtxFactory";
	public boolean Authenticate(String host, String domain, String user, String pass) {
		try {
			
			Hashtable<String, String> env = new Hashtable<String, String>();
			if (pass == null || user == null)
				return false;
			
			if (pass.compareTo("") == 0 || user.compareTo("") == 0)
				return false;
			
			env.put(Context.INITIAL_CONTEXT_FACTORY, INITCTX);
			env.put(Context.PROVIDER_URL, "ldap://" + host);
			env.put(Context.SECURITY_AUTHENTICATION, "simple");
			env.put(Context.SECURITY_PRINCIPAL,	new String(domain + "\\" + user));
			env.put(Context.SECURITY_CREDENTIALS, new String(pass));

			new InitialDirContext(env);
			return true;
		} catch (Exception e) {
			logger.debug("se genero un error al validar contra el Active Directory");
			logger.debug(e.getMessage());
			return false;
		}
	}
}
