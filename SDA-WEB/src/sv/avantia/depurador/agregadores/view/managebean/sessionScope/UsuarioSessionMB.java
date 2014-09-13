package sv.avantia.depurador.agregadores.view.managebean.sessionScope;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

import org.primefaces.context.RequestContext;

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
	private static String URL_PAGINA_PRINCIPAL = "/SDA-WEB/Principal.xhtml";
	private static String URL_PAGINA_PERMISOS = "/SDA-WEB/Permisos.xhtml";
	private static String URL_PAGINA_LOGOUT = "/SDA-WEB/vistas/commons/Logout.xhtml";
	private String nombreUsuario;

	private String mensaje = "";

	protected List<MenuT> menus;
	private MenuControllerT menu;
	
	private static HashMap<String, String> usuarios = new HashMap<String, String>();
	
	static{
		usuarios.put("edwin", "pass");
		usuarios.put("admin", "pass");
		usuarios.put("test", "pass");
	}

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
		try {
			//validar en active directory
			ValidacionLDAP activeDirectory = new ValidacionLDAP();
			if(activeDirectory.Authenticate("", getNombreUsuario(), contrasenia)){
				//validar en Base de Datos
				if(usuarios.get(getNombreUsuario()).equals(contrasenia)){
					PoblarMenu(1);
					redireccionarPagina(URL_PAGINA_PRINCIPAL);
				}else{
					mostrarMensajeError("No posee un perfil asignado.");
				}	
			}else{
				mostrarMensajeError("El usuario "+getNombreUsuario()+ " no existe");
			}	
		} catch (Exception e) {
			mostrarMensajeError((e.getMessage().equals("")? "Ocurrió un error al intentar validar su usuario y contraseña." : e.getMessage()));
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
			//new MenuT(id, nombre, idMenuPadre, url, orden)
			
			getMenus().add(	new MenuT("1", "Depuración", null, null));
			getMenus().add(	new MenuT("2", "Uno a uno", "1",  "/vistas/depuracion/DepuracionUnitaria.xhtml"));
			getMenus().add(	new MenuT("3", "Masivo", "1",  "/vistas/depuracion/DepuracionMasiva.xhtml"));
			
			getMenus().add(	new MenuT("4", "Reportes", null, null));
			getMenus().add(	new MenuT("5", "Uno a uno", "4",  "/vistas/reportes/ReportesDepuacionUnitaria.xhtml"));
			getMenus().add(	new MenuT("6", "Masivo", "4",  "/vistas/reportes/ReportesDepuracionMasiva.xhtml"));
			
			getMenus().add(	new MenuT("7", "Manteniento", null, null));
			getMenus().add(	new MenuT("8", "Parmetrización", "7",  "/vistas/mantenimientos/Parametrizacion.xhtml"));
			getMenus().add(	new MenuT("9", "Agregadores", "7",  "/vistas/mantenimientos/Paises.xhtml"));
			getMenus().add(	new MenuT("10", "Metodos", "7",  "/vistas/mantenimientos/Paises.xhtml"));
			getMenus().add(	new MenuT("11", "Prametros", "7",  "/vistas/mantenimientos/Paises.xhtml"));
			
			getMenus().add(	new MenuT("12", "Opciones", null, null));
			getMenus().add(	new MenuT("13", "Pagina Principal", "12",  "/Principal.xhtml"));
			getMenus().add(	new MenuT("14", "Salir", "12",  "/vistas/commons/Logout.xhtml"));
			
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
		//return new UtilsDates().formatoFechaSession();
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
	 * Metodo que sirve para direccionar a la pagina de inicio
	 * @author Edwin Mejia - Avantia Consultores
	 * */
	public void logout() {
		try {
			setMenus(new ArrayList<MenuT>());
			redireccionarPagina("/SDA-WEB");
		} catch (Exception exception) {
			mostrarMensajeError("Error al redireccionar hacia la página de inicio");
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
	 * Metodo que nos muestra la ruta completa de la pagina activa en el momento
	 * que se ejecuta este metodo
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * */
	private String getContextoCompleto() {
		FacesContext fc = FacesContext.getCurrentInstance();
		String id = fc.getViewRoot().getViewId();
		return id;
	}

	/**
	 * Valida el acceso a la pagina, establece los permisos.
	 * @author Edwin Mejia - Avantia Consultores
	 * */
	public void validarAccesoPagina() {
		String contexto = getContextoCompleto();
		boolean permiso = false;
		for (MenuT item : getMenus()) {
			if (item.getUrl() != null && item.getUrl().equals(contexto)) {				
				permiso = true;
				break;
			}
		}
		if (!permiso) {
			redireccionarPagina(URL_PAGINA_PERMISOS);
		}
	}

	/**
	 * Redireccion de una pagina.
	 * @author Edwin Mejia - Avantia Consultores
	 * */
	public void redireccionarPagina(String url) {
		try {
			FacesContext.getCurrentInstance().getExternalContext().redirect(url);
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
}
