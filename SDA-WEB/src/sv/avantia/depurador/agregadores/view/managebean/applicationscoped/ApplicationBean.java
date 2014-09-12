package sv.avantia.depurador.agregadores.view.managebean.applicationscoped;

import java.io.Serializable;

import javax.annotation.PostConstruct;
import javax.faces.bean.ApplicationScoped;
import javax.faces.bean.ManagedBean;

import org.apache.log4j.Logger;

import sv.avantia.depurador.agregadores.utileria.Log4jInit;

@ManagedBean(eager = true)
@ApplicationScoped
public class ApplicationBean implements Serializable {

	
	/* Get actual class name to be printed on */
	public static Logger logger = Logger.getLogger("avantiaLogger");
	private static final long serialVersionUID = 1L;
	
	public ApplicationBean(){
		System.out.println("constructor");
	}
	
	static{
		System.out.println("iniciando aplicacion");
		Log4jInit.init();
	}

	@PostConstruct
	public void init(){
		System.out.println("inicia el application scope");
	}	
}
