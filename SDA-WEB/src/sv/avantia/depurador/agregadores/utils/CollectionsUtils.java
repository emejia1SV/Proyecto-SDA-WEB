package sv.avantia.depurador.agregadores.utils;

import java.util.HashSet;
import java.util.Set;

/**
 * clase que me funcionara como utileria para poder verificar colecciones dentro
 * del presente aplicativo
 * 
 * @author Emejia - Avantia Consultores
 * */
public class CollectionsUtils {

	/**
	 * Metodo para poder intersectar dos colecciones de datos y verificar la
	 * diferencia entre las colecciones - para conocer todas los opciones que
	 * fueron deseleccionadas y estan deberan ser eliminadas
	 * 
	 * @author Emejia - Avantia Consultores
	 * @param a
	 *            Primera coleccion
	 * @param b
	 *            Segunda coleccion
	 * 
	 * @return una sola coleccion de diferencias
	 * */
	public static <T> Set<T> eliminar(Set<T> base, Set<T> selected) {
		Set<T> res = new HashSet<T>(base);
		res.removeAll(selected);
		return res;
	}

	/**
	 * Metodo para poder intersectar dos colecciones de datos y verificar la
	 * diferencia entre las colecciones - para conocer todas los opciones que
	 * fueron selccionadas y estan deberan ser guardadas
	 * 
	 * @author Emejia - Avantia Consultores
	 * @param a
	 *            Primera coleccion
	 * @param b
	 *            Segunda coleccion
	 * 
	 * @return una sola coleccion de diferencias
	 * */
	public static <T> Set<T> guardar(Set<T> base, Set<T> selected) {
		Set<T> res = new HashSet<T>(selected);
		res.removeAll(base);
		return res;
	}
	
	
}