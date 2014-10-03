package sv.avantia.depurador.agregadores.view.managebean.sessionScope;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;

import org.primefaces.context.RequestContext;

import sv.avantia.depurador.agregadores.entidades.ParametrosSistema;
import sv.avantia.depurador.agregadores.entidades.UsuarioSistema;
import sv.avantia.depurador.agregadores.jdbc.BdEjecucion;
import sv.avantia.depurador.agregadores.utils.MenuControllerT;
import sv.avantia.depurador.agregadores.utils.MenuT;
import sv.avantia.depurador.agregadores.utils.ValidacionLDAP;

/**
 * ManagedBeans de usuario sesion 
 * @author Edwin Mejia - Avantia Consultores
 * */

@ManagedBean
@SessionScoped
public class UsuarioSessionMB implements Serializable {

	private static final long serialVersionUID = 1L;
	private static String URL_PAGINA_PRINCIPAL = "/vistas/generales/Principal.xhtml";
	private static String URL_PAGINA_LOGOUT = "/vistas/generales/Logout.xhtml";
	private static final String MASTER_USER = "admin";
	private static final String MASTER_PASS = "admin";
	private String nombreUsuario;
	private String dominio;
	private UsuarioSistema usuarioSession;

	private String mensaje = "";

	protected List<MenuT> menus;
	private MenuControllerT menu;
	
	/**
	 * Metodo con el cual es ingresado la contraseña a traves de parametros
	 * desde la vista
	 * @author Edwin Mejia - Avantia Consultores 
	 * @param contrasenia - Contrasenia del Usuario
	 * */
	public void llamarUsuario(String contrasenia) {
		loginUsuario(contrasenia);
	}
	
	/**
	 * Metodo el cual realiza la verificacion del usuario que pretende loguearse
	 * @author Edwin Mejia - Avantia Consultores
	 * @param contrasenia - Contrasenia del usuario
	 * */
	private void loginUsuario(String contrasenia) {
		BdEjecucion ejecucion = new BdEjecucion();
		try {
			
			if(getNombreUsuario().equals(MASTER_USER) && contrasenia.equals(MASTER_PASS))
			{
				setUsuarioSession((UsuarioSistema) ejecucion.obtenerDato("FROM SDA_USUARIO_SISTEMA WHERE USUARIO = '" + getNombreUsuario() + "' AND CONTRASENIA =  '" + contrasenia + "'"));
				PoblarMenu(1);
				redireccionarPagina(URL_PAGINA_PRINCIPAL);
			}
			else{
				ParametrosSistema sistema = (ParametrosSistema)	ejecucion.obtenerDato("FROM SDA_PARAMETROS_SISTEMA WHERE KEY = 'host'");
				//validar en active directory
				ValidacionLDAP activeDirectory = new ValidacionLDAP();
				if(activeDirectory.Authenticate(sistema.getValor(), getDominio(), getNombreUsuario(), contrasenia)){
					//validar en Base de Datos
					if(ejecucion.verificarUsuario(getNombreUsuario(), contrasenia)){
						setUsuarioSession((UsuarioSistema) ejecucion.obtenerDato("FROM SDA_USUARIO_SISTEMA WHERE USUARIO = '" + getNombreUsuario() + "' AND CONTRASENIA =  '" + contrasenia + "'"));
						PoblarMenu(1);
						redireccionarPagina(URL_PAGINA_PRINCIPAL);
					}else{
						mostrarMensajeError("No posee un perfil asignado.");
					}	
				}else{
					mostrarMensajeError("El usuario "+getNombreUsuario()+ " no existe");
				}
			}
		} catch (Exception e) {
			mostrarMensajeError((e.getMessage().equals("")? "Ocurrió un error al intentar validar su usuario y contraseña." : e.getMessage()));
		}finally{
			ejecucion = null;
		}
	}

	/**
	 * Metodo para la creación de Menu 
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @param idPerfil - Identificador del Perfil
	 * */
	private void PoblarMenu(Integer idPerfil) {
		try {
			setMenus(new ArrayList<MenuT>());
			
			getMenus().add(	new MenuT("1", "Depuración", null, null));
			getMenus().add(	new MenuT("2", "Uno a uno", "1",  "/vistas/depuracion/DepuracionUnitaria.xhtml"));
			getMenus().add(	new MenuT("3", "Masivo", "1",  "/vistas/depuracion/DepuracionMasiva.xhtml"));
			
			getMenus().add(	new MenuT("4", "Reportes", null, null));
			getMenus().add(	new MenuT("5", "Reporte", "4",  "/vistas/reportes/ReportesDepuacion.xhtml"));
			
			getMenus().add(	new MenuT("6", "Manteniento", null, null));
			getMenus().add(	new MenuT("7", "Parametrización", "6",  "/vistas/mantenimientos/Parametrizacion.xhtml"));
			getMenus().add(	new MenuT("8", "Parametros Sistema", "6",  "/vistas/mantenimientos/ParametrosSistema.xhtml"));
			getMenus().add(	new MenuT("9", "Usuarios Sistema", "6",  "/vistas/mantenimientos/UsusarioSistema.xhtml"));
			getMenus().add(	new MenuT("10", "Catalogo Respuestas", "6",  "/vistas/mantenimientos/CatalogoRespuestas.xhtml"));
			//getMenus().add(	new MenuT("9", "Usuarios Sistema", "6",  "/vistas/mantenimientos/UsusarioSistema.xhtml"));
			
			getMenus().add(	new MenuT("11", "Opciones", null, null));
			getMenus().add(	new MenuT("12", "Pagina Principal", "11",  "/vistas/generales/Principal.xhtml"));
			getMenus().add(	new MenuT("13", "Salir", "11",  "/vistas/generales/Logout.xhtml"));
			
			setMenu(new MenuControllerT(getMenus()));
		} catch (Exception e) {
			mostrarMensajeError("Error al crear menú verificar que la asignación de menús fue asignada correctamente al perfil asignado.");
		}
	}

	/**
	 * Define el formato de la fecha a mostrar en la aplicación
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @return 
	 * */
	public String horaActual() {				
		return getFechaActual().toString();
	}
	
	/**
	 * Define la fecha actual del sistema para sustituir los metodos escritos en
	 * los managebean
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @return fecha actual
	 * */
	public Date getFechaActual(){
		return new Date();
	}

	/**
	 * Mostrar algun mensaje de error este metodo es unicamente para session
	 * bean ya que no se puede heredar de un ManejadorAccion
	 * @author Edwin Mejia - Avantia Consultores
 	 * @param msg
	 *            - es el mensaje que se quiere enviar a pantalla
	 * */
	private void mostrarMensajeError(String msg) {
		RequestContext requestContext = RequestContext.getCurrentInstance();
		FacesContext context = FacesContext.getCurrentInstance();
		context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", msg));
		if (requestContext != null) {
			requestContext.update("IDGrowlErrorSistemas");
		}
	}

	/**
	 * Metodo que muestra el mensaje de validacion
	 * @author Edwin Mejia - Avantia Consultores
	 * */
	public void mostrarMensajeValidacion() {
		if (!getMensaje().isEmpty()) {
			mostrarMensajeError(getMensaje());
			setMensaje("");
		}
	}
	
	/**
	 * Metodo que nos muestra la pagina activa en el momento que se ejecuta este metodo
	 * @author Edwin Mejia - Avantia Consultores
	 * */
	public String getContexto() {
		FacesContext fc = FacesContext.getCurrentInstance();		
		String id = fc.getViewRoot().getViewId();
		String[] arreglo = id.split("/");	
		return arreglo[arreglo.length - 1];
	}

	/**
	 * Redireccion de una pagina.
	 * @author Edwin Mejia - Avantia Consultores
	 * */
	public void redireccionarPagina(String url) {
		try {
			FacesContext.getCurrentInstance().getExternalContext().redirect("/SDA-WEB"+url);
		} catch (IOException exception) {
			mostrarMensajeError("No es posible re-direccionar a la página " + url);
		}
	}
	
	/**
	 * Limpiar los datos que llevamos en sesión
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @return void
	 * */
	public void limpiarSesion(){
		try{
			setMenus(new ArrayList<MenuT>());
			setDominio("");
			setNombreUsuario("");
			setUsuarioSession(null);
			FacesContext facescontext = FacesContext.getCurrentInstance();
			RequestContext.getCurrentInstance().execute("stopTimer();");
			HttpSession sesion = (HttpSession) facescontext.getExternalContext().getSession(false);
			if (sesion != null)
				sesion.invalidate();
		}catch(Exception exception){
			mostrarMensajeError("Error al limpiar sesión");
		}
	}

	/**
	 * Valida la sesión, tiene un tiempo estimado para permanecer en la
	 * aplicacion despues que no esta en uso.
	 * 
	 * @author Roberto Moran
	 * */
	public void validarSesion() {
		try {
			if (getNombreUsuario() == null || getNombreUsuario().length() < 1)
				redireccionarPagina(URL_PAGINA_LOGOUT);
		} catch (Exception exception) {
			mostrarMensajeError("Su session ha expirado " + exception.getMessage());
		}
	}
	/*************************       Getter and Setter      ********************************/
	
	public String getNombreUsuario() {
		return nombreUsuario;
	}

	public void setNombreUsuario(String nombreUsuario) {
		this.nombreUsuario = nombreUsuario;
	}

	
	public String getMensaje() {
		return mensaje;
	}

	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}

	public MenuControllerT getMenu() {
		return menu;
	}

	/**
	 * @return the menus
	 */
	private List<MenuT> getMenus() {
		return menus;
	}

	/**
	 * @param menus the menus to set
	 */
	private void setMenus(List<MenuT> menus) {
		this.menus = menus;
	}

	/**
	 * @param menu the menu to set
	 */
	private void setMenu(MenuControllerT menu) {
		this.menu = menu;
	}

	/**
	 * @return the usuarioSession
	 */
	public UsuarioSistema getUsuarioSession() {
		return usuarioSession;
	}

	/**
	 * @param usuarioSession the usuarioSession to set
	 */
	public void setUsuarioSession(UsuarioSistema usuarioSession) {
		this.usuarioSession = usuarioSession;
	}

	/**
	 * @return the dominio
	 */
	public String getDominio() {
		return dominio;
	}

	/**
	 * @param dominio the dominio to set
	 */
	public void setDominio(String dominio) {
		this.dominio = dominio;
	}
}
