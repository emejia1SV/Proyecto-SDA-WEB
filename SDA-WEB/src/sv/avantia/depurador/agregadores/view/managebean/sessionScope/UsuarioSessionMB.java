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
import javax.faces.model.SelectItem;

import org.apache.log4j.Logger;
import org.primefaces.context.RequestContext;

import sv.avantia.depurador.agregadores.entidades.Pais;
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
	private String nombreUsuario;
	private String dominio;
	private Integer idPais=null;
	private UsuarioSistema usuarioSession;

	private String mensaje = "";

	protected List<MenuT> menus;
	private MenuControllerT menu;
	
	/**
	 * Obtener el appender para la impresión en un archivo de LOG
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * */
	public static Logger logger = Logger.getLogger("avantiaLogger");
	
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
		ValidacionLDAP activeDirectory = new ValidacionLDAP();
		UsuarioSistema user = null;
		try {
			user=ejecucion.usuarioMaestro();
			if(getNombreUsuario().equals(user.getUsuario()))
			{
				setUsuarioSession(user);
				PoblarMenu(1);
				redireccionarPagina(URL_PAGINA_PRINCIPAL);
			}
			else
			{
				System.out.println(">>>>>>>>>>>>>>>>>>>>" + getIdPais());
				if(getIdPais()==null || getIdPais()==0){
					mostrarMensajeError("Debe Seleccionar un pais para poder ingresar");
					return;
				}
				
				//validar en active directory
				if(activeDirectory.Authenticate(getDominio(), getNombreUsuario(), contrasenia, getIdPais()))
				{
					//validar en Base de Datos
					if(ejecucion.verificarUsuario(getNombreUsuario()))
					{
						setUsuarioSession((UsuarioSistema) ejecucion.obtenerDato("FROM SDA_USUARIO_SISTEMA WHERE USUARIO = '" + getNombreUsuario() + "'"));
						PoblarMenu(2);
						redireccionarPagina(URL_PAGINA_PRINCIPAL);
					}
					else
					{
						mostrarMensajeError("No posee un perfil asignado.");
					}	
				}
				else
				{
					mostrarMensajeError("El usuario "+getNombreUsuario()+ " no existe");
				}
			}
		} catch (Exception e) {
			mostrarMensajeError("Ocurrió un error al intentar validar su usuario y contraseña.");
			logger.error(e.getMessage());
		}finally{
			ejecucion = null;
			activeDirectory = null;
			user=null;
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
			
			if(idPerfil==1){
				getMenus().add(	new MenuT("1", "Depuración", null, null));
				getMenus().add(	new MenuT("2", "Uno a uno", "1",  "/vistas/depuracion/DepuracionUnitaria.xhtml"));
				getMenus().add(	new MenuT("3", "Masivo", "1",  "/vistas/depuracion/DepuracionMasiva.xhtml"));
				
				getMenus().add(	new MenuT("4", "Reportes", null, null));
				getMenus().add(	new MenuT("5", "Reporte", "4",  "/vistas/reportes/ReportesDepuacion.xhtml"));
				
				getMenus().add(	new MenuT("6", "Mantenimiento", null, null));
				getMenus().add(	new MenuT("7", "Parametrización", "6",  "/vistas/mantenimientos/Parametrizacion.xhtml"));
				getMenus().add(	new MenuT("8", "Parametros Sistema", "6",  "/vistas/mantenimientos/ParametrosSistema.xhtml"));
				getMenus().add(	new MenuT("9", "Usuarios Sistema", "6",  "/vistas/mantenimientos/UsusarioSistema.xhtml"));
				getMenus().add(	new MenuT("10", "Catalogo Respuestas", "6",  "/vistas/mantenimientos/CatalogoRespuestas.xhtml"));
				
				getMenus().add(	new MenuT("11", "Opciones", null, null));
				getMenus().add(	new MenuT("12", "Pagina Principal", "11",  "/vistas/generales/Principal.xhtml"));
				getMenus().add(	new MenuT("13", "Salir", "11",  "/vistas/generales/Logout.xhtml"));
			}else{
				getMenus().add(	new MenuT("1", "Depuración", null, null));
				getMenus().add(	new MenuT("2", "Uno a uno", "1",  "/vistas/depuracion/DepuracionUnitaria.xhtml"));
				getMenus().add(	new MenuT("3", "Masivo", "1",  "/vistas/depuracion/DepuracionMasiva.xhtml"));
				
				getMenus().add(	new MenuT("4", "Reportes", null, null));
				getMenus().add(	new MenuT("5", "Reporte", "4",  "/vistas/reportes/ReportesDepuacion.xhtml"));
				
				//getMenus().add(	new MenuT("6", "Manteniento", null, null));
				//getMenus().add(	new MenuT("7", "Parametrización", "6",  "/vistas/mantenimientos/Parametrizacion.xhtml"));
				
				getMenus().add(	new MenuT("11", "Opciones", null, null));
				getMenus().add(	new MenuT("12", "Pagina Principal", "11",  "/vistas/generales/Principal.xhtml"));
				getMenus().add(	new MenuT("13", "Salir", "11",  "/vistas/generales/Logout.xhtml"));
			}
			
			setMenu(new MenuControllerT(getMenus()));
		} catch (Exception e) {
			mostrarMensajeError("Error al crear menú verificar que la asignación de menús fue asignada correctamente al perfil asignado.");
			logger.error(e.getMessage());
		}
	}

	public void validarSesion(){
		if(getMenus()==null){
			redireccionarPagina("/vistas/generales/Logout.xhtml");
		}else{
			if(getMenus().isEmpty()){
				redireccionarPagina("/vistas/generales/Logout.xhtml");
			}
		}
	}
	
	public void cerrarSesion(){
		setMenus(null);
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
			logger.error(exception.getMessage());
		}
	}
	
	/**
	 * Metodo que carga los Paises para ingresar los usuario en el sistema SDA
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @return {@link SelectItem}
	 * */
	@SuppressWarnings("unchecked")
	public SelectItem[] getListaPaises() {
		List<Pais> paises = new ArrayList<Pais>();
		BdEjecucion ejecucion = new BdEjecucion();
		SelectItem[] items = null;
		try 
		{
			paises = (List<Pais>) (List<?>) ejecucion.listData("FROM SDA_PAISES");
			items = new SelectItem[paises.size()];
			for (int i = 0; i < items.length; i++) {
				items[i] = new SelectItem(paises.get(i).getId(), paises.get(i).getNombre());
			}
		} 
		catch (Exception e) 
		{
			mostrarMensajeError( "Error No se pudo cargar la tabla de paises");
		}
		
		return items;
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

	/**
	 * @return the idPais
	 */
	public Integer getIdPais() {
		return idPais;
	}

	/**
	 * @param idPais the idPais to set
	 */
	public void setIdPais(Integer idPais) {
		this.idPais = idPais;
	}
}
