package sv.avantia.depurador.agregadores.view.managebean.viewscoped;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import org.primefaces.context.RequestContext;

import sv.avantia.depurador.agregadores.entidades.ParametrosSistema;
import sv.avantia.depurador.agregadores.jdbc.BdEjecucion;
import sv.avantia.depurador.agregadores.utils.AccionesManageBean;

@ManagedBean
@ViewScoped
public class ParametrosSistemaBean extends AccionesManageBean implements Serializable 
{

	private static final long serialVersionUID = 1L;
	private ParametrosSistema parametrosSistema;
	private List<ParametrosSistema> parametrosSistemas;
	private BdEjecucion ejecucion;

	@PostConstruct
	public void init() {
		setParametrosSistema(new ParametrosSistema());
		setParametrosSistemas(new ArrayList<ParametrosSistema>());
		setEjecucion(new BdEjecucion());
		llenarTablaParametros();
	}
	
	/**
	 * Metodo para llenar la lista desde la base de datos con los objetos {@link ParametrosSistema}
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @return {@link Void}
	 * */
	@SuppressWarnings("unchecked")
	public void llenarTablaParametros() {
		try 
		{
			setParametrosSistemas((List<ParametrosSistema>) (List<?>) getEjecucion().listData("FROM SDA_PARAMETROS_SISTEMA"));
		} 
		catch (Exception e) 
		{
			lanzarMensajeError("Error:", "No se pudo cargar la tabla de paises", e);
		}
	}
	
	/**
	 * Metodo para limpiar el objeto {@link ParametrosSistema}
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @return {@link Void}
	 * */
	public void limpiarParametro() 
	{
		setParametrosSistema(new ParametrosSistema());
		RequestContext.getCurrentInstance().update("IDFrmPrincipal");
	}
	
	/**
	 * Metodo para eliminar el objeto {@link ParametrosSistema}
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @return {@link Void}
	 * */
	public void eliminarParametro() {
		if(getParametrosSistema().getId()!=null){
			getEjecucion().deleteData(getParametrosSistema());
			setParametrosSistema(new ParametrosSistema());
			llenarTablaParametros();
			RequestContext.getCurrentInstance().update("IDFrmPrincipal");
		}
	}
	
	/**
	 * Metodo para guardar el objeto {@link ParametrosSistema}
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @return {@link Void}
	 * */
	public void guardarParametro()
	{
		if(getParametrosSistema().getId() == null)
		{
			getEjecucion().createData(getParametrosSistema());
		}
		else
		{
			getEjecucion().updateData(getParametrosSistema());
		}
		setParametrosSistema(new ParametrosSistema());
		llenarTablaParametros();
		RequestContext.getCurrentInstance().update("IDFrmPrincipal");
	}
	
	/**
	 * Metodo para cargar desde la vista el objeto seleccionado desde el
	 * datatable de la pagina
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @param parametrosSistema
	 *            {@link ParametrosSistema}
	 * @return {@link Void}
	 * */
	public void cargarParametro(ParametrosSistema parametrosSistema) {
		setParametrosSistema(parametrosSistema);
		llenarTablaParametros();
		RequestContext.getCurrentInstance().update("IDFrmPrincipal");
	}

	/**
	 * @return the parametrosSistema
	 */
	public ParametrosSistema getParametrosSistema() {
		return parametrosSistema;
	}

	/**
	 * @param parametrosSistema
	 *            the parametrosSistema to set
	 */
	public void setParametrosSistema(ParametrosSistema parametrosSistema) {
		this.parametrosSistema = parametrosSistema;
	}

	/**
	 * @return the parametrosSistemas
	 */
	public List<ParametrosSistema> getParametrosSistemas() {
		return parametrosSistemas;
	}

	/**
	 * @param parametrosSistemas
	 *            the parametrosSistemas to set
	 */
	public void setParametrosSistemas(List<ParametrosSistema> parametrosSistemas) {
		this.parametrosSistemas = parametrosSistemas;
	}



	/**
	 * @return the ejecucion
	 */
	public BdEjecucion getEjecucion() {
		return ejecucion;
	}



	/**
	 * @param ejecucion the ejecucion to set
	 */
	public void setEjecucion(BdEjecucion ejecucion) {
		this.ejecucion = ejecucion;
	}

}
