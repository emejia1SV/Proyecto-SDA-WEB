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
	private List<LogDepuracion> depuraciones;
	private Date filterTripDateFrom, filterTripDateTo;
	/**
	 * Instancia para ser manejada en el dialogo del reporte
	 * */
	private LogDepuracion logDepuracion;
	
	@PostConstruct
	public void init(){
		setLogDepuracion(new LogDepuracion());
		llenarTablaLogs();
	}
	
	@SuppressWarnings("unchecked")
	public void llenarTablaLogs() {
		try 
		{
			setDepuraciones(((List<LogDepuracion>) (List<?>) getEjecucion().listData("FROM SDA_LOG_DEPURACION")));
			
		} 
		catch (Exception e) 
		{
			lanzarMensajeError("Error:", "No se pudo cargar la tabla de paises", e);
		}
	}
	
	@SuppressWarnings("unchecked")
	public void filtrarPorFechaSeleccionada(){
		String query = "FROM SDA_LOG_DEPURACION";
		if(getFilterTripDateFrom()!=null && getFilterTripDateTo()== null){
			query = "from SDA_LOG_DEPURACION WHERE FECHA_TRANSACCION > TO_DATE('"+ getDateFromDateTime(getFilterTripDateFrom()) +"','DD/MM/YYYY')";
		}
		if(getFilterTripDateFrom()==null && getFilterTripDateTo()!= null){
			query = "from SDA_LOG_DEPURACION WHERE FECHA_TRANSACCION < TO_DATE('"+ getDateFromDateTime(getFilterTripDateTo()) +"','DD/MM/YYYY')";
		}
		if(getFilterTripDateFrom()!=null && getFilterTripDateTo()!= null){
			query = "from SDA_LOG_DEPURACION WHERE FECHA_TRANSACCION BETWEEN TO_DATE('"+ getDateFromDateTime(getFilterTripDateFrom()) +"','DD/MM/YYYY') AND TO_DATE('"+ getDateFromDateTime(getFilterTripDateTo()) +"','DD/MM/YYYY')";
		}
		setDepuraciones(((List<LogDepuracion>) (List<?>) getEjecucion().listData(query)));
		RequestContext.getCurrentInstance().update("IDFrmPrincipal");
	}
	
	private String getDateFromDateTime (Date date) {
        SimpleDateFormat dtFormatter= new SimpleDateFormat("dd/MM/yyyy");
        return dtFormatter.format(date);
    }
	
	public void limpiarFechas(){
		setFilterTripDateFrom(null);
		setFilterTripDateTo(null);
		RequestContext.getCurrentInstance().update("IDFrmPrincipal");
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
	
	public void onRowSelect(SelectEvent event){
		setLogDepuracion((LogDepuracion)event.getObject());
		// TODO: debo implementar la manera en que el dialogo no me llame una segunda instancia del viewScope
		//RequestContext.getCurrentInstance().execute("WVDialogReporte.show();");
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