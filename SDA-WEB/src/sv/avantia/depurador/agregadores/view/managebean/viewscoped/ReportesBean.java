package sv.avantia.depurador.agregadores.view.managebean.viewscoped;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import org.primefaces.context.RequestContext;
import org.primefaces.event.SelectEvent;

import sv.avantia.depurador.agregadores.entidades.LogDepuracion;
import sv.avantia.depurador.agregadores.utils.AccionesManageBean;

@ManagedBean
@ViewScoped
public class ReportesBean extends AccionesManageBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	/**
	 * Listado de depuracion que han sido realizadas de las cuales se mostrara el reporte
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * */
	private List<LogDepuracion> depuraciones;
	
	/**
	 * Parametros que nos serviran para filtrar las fechas
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * */
	private Date filterTripDateFrom, filterTripDateTo;
	
	/**
	 * Instancia para ser manejada en el dialogo del reporte
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * */
	private LogDepuracion logDepuracion;
	
	/**
	 * Metodo de tipo post contruct para inicializar los valores prinicipales
	 * del bean para su buena ejecución
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * */
	@PostConstruct
	public void init()
	{
		setLogDepuracion(new LogDepuracion());
		llenarTablaLogs();
	}
	
	@SuppressWarnings("unchecked")
	private void llenarTablaLogs() 
	{
		try 
		{
			setDepuraciones(((List<LogDepuracion>) (List<?>) getEjecucion().listData("FROM SDA_LOG_DEPURACION")));
			
		} 
		catch (Exception e) 
		{
			lanzarMensajeError("Error:", "No se pudo cargar la tabla de paises", e);
		}
	}
	
	/**
	 * Metodo que genera los filtros de las fechas en el momento que sea
	 * seleccionada una fecha en pantalla
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * */
	@SuppressWarnings("unchecked")
	public void filtrarPorFechaSeleccionada()
	{
		String query = "FROM SDA_LOG_DEPURACION";
		
		if(getFilterTripDateFrom()!=null && getFilterTripDateTo()== null)
			query = "from SDA_LOG_DEPURACION WHERE FECHA_TRANSACCION > TO_DATE('"+ getDateFromDateTime(getFilterTripDateFrom()) +"','DD/MM/YYYY')";
		
		if(getFilterTripDateFrom()==null && getFilterTripDateTo()!= null)
			query = "from SDA_LOG_DEPURACION WHERE FECHA_TRANSACCION < TO_DATE('"+ getDateFromDateTime(getFilterTripDateTo()) +"','DD/MM/YYYY')+1";
		
		if(getFilterTripDateFrom()!=null && getFilterTripDateTo()!= null)
			query = "from SDA_LOG_DEPURACION WHERE FECHA_TRANSACCION BETWEEN TO_DATE('"+ getDateFromDateTime(getFilterTripDateFrom()) +"','DD/MM/YYYY') AND TO_DATE('"+ getDateFromDateTime(getFilterTripDateTo()) +"','DD/MM/YYYY')+1";
		
		setDepuraciones(((List<LogDepuracion>) (List<?>) getEjecucion().listData(query)));
		RequestContext.getCurrentInstance().update("IDFrmPrincipal");
	}
	
	/**
	 * Metodo que devuelve la fecha en el formato esperado para realizar el
	 * filtro al reporte
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @param date de tipo {@link Date}
	 * @return {@link String} fecha formateada dd/MM/yyyy
	 * */
	private String getDateFromDateTime (Date date) 
	{
        SimpleDateFormat dtFormatter= new SimpleDateFormat("dd/MM/yyyy");
        return dtFormatter.format(date);
    }
	
	/**
	 * Metodo que realiza la limpieza de los campos de fecha en la pantalla
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * */
	public void limpiarFechas()
	{
		setFilterTripDateFrom(null);
		setFilterTripDateTo(null);
		RequestContext.getCurrentInstance().update("IDFrmPrincipal");
	}
	
	/**
	 * Metodo que muestra el nombre del metodo a partir del id guardado en la
	 * base de datos
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @param id
	 * @return {@link String} con el nombre del metodo
	 * */
	public String metodoLabel(Integer id)
	{
		if(id==1)
			return "Lista Negra";
		else if (id==2)
			return "Consulta de Servicios";
		else if (id==3)
			return "Baja de Servicios";
		else
			return "";
	}

	/**
	 * cuando alguien seleccione una fila del reporte se levantara un dialogo informando mas detalladamente el porque del estado de la transaccion
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @param event {@link SelectEvent}
	 * @return void
	 * */
	public void onRowSelect(SelectEvent event){
		setLogDepuracion((LogDepuracion)event.getObject());
		RequestContext.getCurrentInstance().execute("WVDialogReporte.show()");
		RequestContext.getCurrentInstance().update("IDFrmDialogReporte");
	}
	
	/**
	 * @return the filterTripDateFrom
	 */
	public Date getFilterTripDateFrom() {
		return filterTripDateFrom;
	}

	/**
	 * @param filterTripDateFrom the filterTripDateFrom to set
	 */
	public void setFilterTripDateFrom(Date filterTripDateFrom) {
		this.filterTripDateFrom = filterTripDateFrom;
	}

	/**
	 * @return the filterTripDateTo
	 */
	public Date getFilterTripDateTo() {
		return filterTripDateTo;
	}

	/**
	 * @param filterTripDateTo the filterTripDateTo to set
	 */
	public void setFilterTripDateTo(Date filterTripDateTo) {
		this.filterTripDateTo = filterTripDateTo;
	}

	/**
	 * @return the depuraciones
	 */
	public List<LogDepuracion> getDepuraciones() {
		return depuraciones;
	}

	/**
	 * @param depuraciones the depuraciones to set
	 */
	public void setDepuraciones(List<LogDepuracion> depuraciones) {
		this.depuraciones = depuraciones;
	}

	/**
	 * @return the logDepuracion
	 */
	public LogDepuracion getLogDepuracion() {
		return logDepuracion;
	}

	/**
	 * @param logDepuracion the logDepuracion to set
	 */
	public void setLogDepuracion(LogDepuracion logDepuracion) {
		this.logDepuracion = logDepuracion;
	}
}