package sv.avantia.depurador.agregadores.view.managebean.applicationscoped;

import java.io.Serializable;

import javax.annotation.PostConstruct;
import javax.faces.bean.ApplicationScoped;
import javax.faces.bean.ManagedBean;

import org.apache.log4j.Logger;

import sv.avantia.depurador.agregadores.jdbc.BdEjecucion;
import sv.avantia.depurador.agregadores.utileria.Log4jInit;

@ManagedBean(eager = true)
@ApplicationScoped
public class ApplicationBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	/* Get actual class name to be printed on */
	private static Logger logger = Logger.getLogger("avantiaLogger");
	
	/**
	 * Instanacia de {@link BdEjecucion} para poder generar ejecuciones en la
	 * base de datos desde cualquier managebean
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * */
	private BdEjecucion ejecucion ;
	
	public ApplicationBean(){
	}
	
	static{
		Log4jInit.init();
		logger.info("iniciando aplicacion SDA");
	}

	@PostConstruct
	public void init(){
		setEjecucion(new BdEjecucion());
		getEjecucion().usuarioMaestro();//test conect DB
		logger.info("SDA iniciado... Listo para funcionar");
	}

	/**
	 * @return the ejecucion
	 */
	private BdEjecucion getEjecucion() {
		return ejecucion;
	}

	/**
	 * @param ejecucion the ejecucion to set
	 */
	private void setEjecucion(BdEjecucion ejecucion) {
		this.ejecucion = ejecucion;
	}	
}