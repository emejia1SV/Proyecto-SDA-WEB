package sv.avantia.depurador.agregadores.view.managebean.viewscoped;

import java.io.Serializable;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;

/**
 * Clase generada para la verificacion de la expiracion de session
 * 
 * @author Edwin Mejia - Avantia Consultores
 * */
@ManagedBean
@ViewScoped
public class SessionExpiredMB implements Serializable {

	private static final long serialVersionUID = 1L;
	private String mensaje = "Su sesión ha expirado ";

	@PostConstruct
	public void init() {
		invalidateSession();
	}

	/**
	 * Metodo encargado de invalidar la session actual
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @return void
	 * */
	public void invalidateSession() {
		FacesContext facescontext = FacesContext.getCurrentInstance();
		HttpSession sesion = (HttpSession) facescontext.getExternalContext().getSession(false);
		if (sesion != null)
			sesion.invalidate();
	}

	public String getMensaje() {
		return mensaje;
	}

	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}
}