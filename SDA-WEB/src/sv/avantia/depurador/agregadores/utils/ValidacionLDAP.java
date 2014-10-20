package sv.avantia.depurador.agregadores.utils;

import java.util.Hashtable;

import javax.naming.Context;
import javax.naming.directory.InitialDirContext;

import org.apache.log4j.Logger;

import sv.avantia.depurador.agregadores.entidades.ParametrosSistema;
import sv.avantia.depurador.agregadores.jdbc.BdEjecucion;

public class ValidacionLDAP {

	/**
	 * Obtener el appender para la impresión en un archivo de LOG
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * */
	public static Logger logger = Logger.getLogger("avantiaLogger");
	
	/**
	 * Obtener el contexto con el que se ejecutara el contexto para la autenticacion por LDAP
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * */
	private String INITCTX = "com.sun.jndi.ldap.LdapCtxFactory";
	
	/**
	 * Autenticacion contra el Active Directory
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @param host la direccion
	 * */
	public boolean Authenticate(String domain, String user, String pass, Integer idPais) {
		BdEjecucion ejecucion = new BdEjecucion();
		ParametrosSistema sistema = null;
		Hashtable<String, String> env = new Hashtable<String, String>();
		try 
		{
			sistema = (ParametrosSistema)	ejecucion.obtenerDato("FROM SDA_PARAMETROS_SISTEMA WHERE KEY = 'host"+idPais+"'");
			
			if (pass == null || user == null)
				return false;
			
			if (pass.compareTo("") == 0 || user.compareTo("") == 0)
				return false;
			
			env.put(Context.INITIAL_CONTEXT_FACTORY, INITCTX);
			env.put(Context.PROVIDER_URL, "ldap://" + sistema.getValor());
			env.put(Context.SECURITY_AUTHENTICATION, "simple");
			env.put(Context.SECURITY_PRINCIPAL,	new String(domain + "\\" + user));
			env.put(Context.SECURITY_CREDENTIALS, new String(pass));

			new InitialDirContext(env); 	
			return true;
		} 
		catch (Exception e) 
		{
			//seguimiento del error
			logger.debug("Trato de loguearse " + user);
			logger.debug("en el dominio " + domain);
			logger.debug("en el host " + sistema.getValor());
			logger.debug("surgio el problema");
			logger.debug(e.getMessage());
			
			//puede existirir javax.naming.AuthenticationException: [LDAP: Invalid Credentials] por eso solo lo tratamos como un false
			return false;
		}
		finally
		{
			sistema = null;
			env = null;
			ejecucion = null;
		}
	}
}
