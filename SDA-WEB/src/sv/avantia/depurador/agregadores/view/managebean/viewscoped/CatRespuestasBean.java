package sv.avantia.depurador.agregadores.view.managebean.viewscoped;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import org.primefaces.context.RequestContext;

import sv.avantia.depurador.agregadores.entidades.CatRespuestas;
import sv.avantia.depurador.agregadores.jdbc.BdEjecucion;
import sv.avantia.depurador.agregadores.utils.AccionesManageBean;

@ManagedBean
@ViewScoped
public class CatRespuestasBean extends AccionesManageBean implements Serializable {

	private static final long serialVersionUID = 1L;
	private CatRespuestas catRespuesta;
	private List<CatRespuestas> catRespuestas;

	@PostConstruct
	private void init() {
		setCatRespuesta(new CatRespuestas());
		setCatRespuestas(new ArrayList<CatRespuestas>());
		setEjecucion(new BdEjecucion());
		llenarTablaCatRespuestas();
	}

	/**
	 * Metodo para llenar la lista desde la base de datos con los objetos {@link ParametrosSistema}
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @return {@link Void}
	 * */
	@SuppressWarnings("unchecked")
	public void llenarTablaCatRespuestas() {
		try 
		{
			setCatRespuestas((List<CatRespuestas>) (List<?>) getEjecucion().listData("FROM SDA_CAT_RESPUESTAS"));
		} 
		catch (Exception e) 
		{
			lanzarMensajeError("Error:", "No se pudo cargar la tabla de catalogo de respuestas", e);
		}
	}
	
	/**
	 * Metodo para limpiar el objeto {@link CatRespuestas}
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @return {@link Void}
	 * */
	public void limpiarCatRespuestas() 
	{
		setCatRespuesta(new CatRespuestas());
		RequestContext.getCurrentInstance().update("IDFrmPrincipal");
	}
	
	/**
	 * Metodo para eliminar el objeto {@link CatRespuestas}
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @return {@link Void}
	 * */
	public void eliminarCatRespuestas() {
		if(getCatRespuesta().getId()!=null){
			getEjecucion().deleteData(getCatRespuesta());
			setCatRespuesta(new CatRespuestas());
			llenarTablaCatRespuestas();
			RequestContext.getCurrentInstance().update("IDFrmPrincipal");
		}
	}
	
	/**
	 * Metodo para guardar el objeto {@link CatRespuestas}
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @return {@link Void}
	 * */
	public void guardarCatRespuestas()
	{
		if(getCatRespuesta().getId() == null)
		{
			getEjecucion().createData(getCatRespuesta());
		}
		else
		{
			getEjecucion().updateData(getCatRespuesta());
		}
		setCatRespuesta(new CatRespuestas());
		llenarTablaCatRespuestas();
		RequestContext.getCurrentInstance().update("IDFrmPrincipal");
	}
	
	/**
	 * Metodo para cargar desde la vista el objeto seleccionado desde el
	 * datatable de la pagina
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @param parametrosSistema
	 *            {@link CatRespuestas}
	 * @return {@link Void}
	 * */
	public void cargarCatRespuestas(CatRespuestas catRespuestas) {
		setCatRespuesta(catRespuestas);
		llenarTablaCatRespuestas();
		RequestContext.getCurrentInstance().update("IDFrmPrincipal");
	}
	
	/**
	 * @return the catRespuesta
	 */
	public CatRespuestas getCatRespuesta() {
		return catRespuesta;
	}

	/**
	 * @param catRespuesta
	 *            the catRespuesta to set
	 */
	public void setCatRespuesta(CatRespuestas catRespuesta) {
		this.catRespuesta = catRespuesta;
	}

	/**
	 * @return the catRespuestas
	 */
	public List<CatRespuestas> getCatRespuestas() {
		return catRespuestas;
	}

	/**
	 * @param catRespuestas
	 *            the catRespuestas to set
	 */
	public void setCatRespuestas(List<CatRespuestas> catRespuestas) {
		this.catRespuestas = catRespuestas;
	}
}