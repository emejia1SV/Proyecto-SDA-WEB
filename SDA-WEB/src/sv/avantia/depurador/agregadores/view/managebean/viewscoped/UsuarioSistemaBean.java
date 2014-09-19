package sv.avantia.depurador.agregadores.view.managebean.viewscoped;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.model.SelectItem;

import org.primefaces.context.RequestContext;

import sv.avantia.depurador.agregadores.entidades.UsuarioSistema;
import sv.avantia.depurador.agregadores.jdbc.BdEjecucion;
import sv.avantia.depurador.agregadores.utils.AccionesManageBean;

@ManagedBean
@ViewScoped
public class UsuarioSistemaBean extends AccionesManageBean implements Serializable 
{
	private static final long serialVersionUID = 1L;
	private UsuarioSistema usuarioSistema;
	private List<UsuarioSistema> usuarioSistemas;

	@PostConstruct
	public void init() {
		setUsuarioSistema(new UsuarioSistema());
		setUsuarioSistemas(new ArrayList<UsuarioSistema>());
		setEjecucion(new BdEjecucion());
		llenarTablaUsuarios();
	}

	/**
	 * Metodo para llenar {@link List} desde la base de datos con los objetos
	 * {@link UsuarioSistema}
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @return {@link Void}
	 * */
	@SuppressWarnings("unchecked")
	public void llenarTablaUsuarios() {
		try {
			setUsuarioSistemas((List<UsuarioSistema>) (List<?>) getEjecucion()
					.listData("FROM SDA_USUARIO_SISTEMA"));
		} catch (Exception e) {
			lanzarMensajeError("Error:",
					"No se pudo cargar la tabla de paises", e);
		}
	}

	/**
	 * Metodo para limpiar el objeto {@link UsuarioSistema}
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @return {@link Void}
	 * */
	public void limpiarUsuario() {
		setUsuarioSistema(new UsuarioSistema());
		RequestContext.getCurrentInstance().update("IDFrmPrincipal");
	}

	/**
	 * Metodo para eliminar el objeto {@link UsuarioSistema}
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @return {@link Void}
	 * */
	public void eliminarUsuario() {
		if(getUsuarioSistema().getId()!=null){
			getEjecucion().deleteData(getUsuarioSistema());
			setUsuarioSistema(new UsuarioSistema());
			llenarTablaUsuarios();
			RequestContext.getCurrentInstance().update("IDFrmPrincipal");
		}
	}

	/**
	 * Metodo para guardar el objeto {@link UsuarioSistema}
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @return {@link Void}
	 * */
	public void guardarUsuario() {
		if (getUsuarioSistema().getId() == null) {
			getEjecucion().createData(getUsuarioSistema());
		} else {
			getEjecucion().updateData(getUsuarioSistema());
		}
		setUsuarioSistema(new UsuarioSistema());
		llenarTablaUsuarios();
		RequestContext.getCurrentInstance().update("IDFrmPrincipal");
	}

	/**
	 * Metodo para cargar desde la vista el objeto seleccionado desde el
	 * datatable de la pagina
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @param usuarioSistema
	 *            {@link UsuarioSistema}
	 * @return {@link Void}
	 * */
	public void cargarUsuario(UsuarioSistema usuarioSistema) {
		setUsuarioSistema(usuarioSistema);
		llenarTablaUsuarios();
		RequestContext.getCurrentInstance().update("IDFrmPrincipal");
	}
	
	/**
	 * Metodo que carga los estados que puede llegar a tener un usuario en el
	 * sistema SDA
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @return {@link SelectItem}
	 * */
	public SelectItem[] getListaEstados() {
		SelectItem[] items = new SelectItem[2];
		items[0] = new SelectItem(1, "Activo");
		items[1] = new SelectItem(0, "Inactivo");
		return items;
	}

	/**
	 * @return the usuarioSistema
	 */
	public UsuarioSistema getUsuarioSistema() {
		return usuarioSistema;
	}

	/**
	 * @param usuarioSistema
	 *            the usuarioSistema to set
	 */
	public void setUsuarioSistema(UsuarioSistema usuarioSistema) {
		this.usuarioSistema = usuarioSistema;
	}

	/**
	 * @return the usuarioSistemas
	 */
	public List<UsuarioSistema> getUsuarioSistemas() {
		return usuarioSistemas;
	}

	/**
	 * @param usuarioSistemas
	 *            the usuarioSistemas to set
	 */
	public void setUsuarioSistemas(List<UsuarioSistema> usuarioSistemas) {
		this.usuarioSistemas = usuarioSistemas;
	}
}