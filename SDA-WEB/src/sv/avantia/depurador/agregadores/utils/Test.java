package sv.avantia.depurador.agregadores.utils;

import sv.avantia.depurador.agregadores.entidades.ParametrosSistema;
import sv.avantia.depurador.agregadores.jdbc.BdEjecucion;

public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			String dominio="Telecom1";
			String usuario="edwina.mejia";
			String contrasenia="INICIO+2";
			BdEjecucion ejecucion = new BdEjecucion();
			ParametrosSistema sistema = (ParametrosSistema)	ejecucion.obtenerDato("FROM SDA_PARAMETROS_SISTEMA WHERE KEY = 'host'");
			ValidacionLDAP activeDirectory = new ValidacionLDAP();
			System.out.println(activeDirectory.Authenticate(sistema.getValor(), dominio, usuario, contrasenia));
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
