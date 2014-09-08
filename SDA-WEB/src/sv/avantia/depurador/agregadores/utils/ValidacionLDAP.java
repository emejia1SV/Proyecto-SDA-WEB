package sv.avantia.depurador.agregadores.utils;

import java.util.Hashtable;

import javax.naming.Context;

public class ValidacionLDAP {

	private String INITCTX = "com.sun.jndi.ldap.LdapCtxFactory";
	private String MY_HOST = "ldap://servidor_de_Dominio";

	public boolean Authenticate(String domain, String user, String pass) {
		try {
			Hashtable<String, String> env = new Hashtable<String, String>();
			if (pass.compareTo("") == 0 || user.compareTo("") == 0)
				return false;
			env.put(Context.INITIAL_CONTEXT_FACTORY, INITCTX);
			env.put(Context.PROVIDER_URL, MY_HOST);
			env.put(Context.SECURITY_AUTHENTICATION, "simple");
			env.put(Context.SECURITY_PRINCIPAL,	new String(domain + "\\" + user));
			env.put(Context.SECURITY_CREDENTIALS, new String(pass));

			//new InitialDirContext(env);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
}
