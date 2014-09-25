package sv.avantia.depurador.agregadores.view.managebean.viewscoped;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.model.SelectItem;

import org.primefaces.context.RequestContext;
import org.primefaces.event.FlowEvent;

import com.cladonia.xml.webservice.wsdl.WSDLException;

import sv.avantia.depurador.agregadores.entidades.Agregadores;
import sv.avantia.depurador.agregadores.entidades.Metodos;
import sv.avantia.depurador.agregadores.entidades.Pais;
import sv.avantia.depurador.agregadores.entidades.Parametros;
import sv.avantia.depurador.agregadores.entidades.Respuesta;
import sv.avantia.depurador.agregadores.jdbc.BdEjecucion;
import sv.avantia.depurador.agregadores.utils.AccionesManageBean;
import sv.avantia.depurador.agregadores.utils.ParametrizarServicio;

@ManagedBean
@ViewScoped
public class ParametrizacionBean extends AccionesManageBean implements	Serializable 
{

	private static final long serialVersionUID = 1L;
	private Pais pais;
	private Agregadores agregador;
	private Metodos metodo;
	private Parametros parametro;
	private Respuesta respuesta;
	private List<Pais> paises;
	private List<Agregadores> agregadores;
	private List<Metodos> metodos;
	private List<Parametros> parametros;
	private List<Respuesta> respuestas;

	/**
	 * Metodo {@link PostConstruct}
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * */
	@PostConstruct
	public void init() {
		setEjecucion(new BdEjecucion());
		setPais(new Pais());
		setAgregador(new Agregadores());
		setMetodo(new Metodos());
		setParametro(new Parametros());
		setPaises(new ArrayList<Pais>());
		setAgregadores(new ArrayList<Agregadores>());
		setMetodos(new ArrayList<Metodos>());
		setParametros(new ArrayList<Parametros>());
		setRespuesta(new Respuesta());
		setRespuestas(new ArrayList<Respuesta>());
		llenarTablaPaises();
	}

	@SuppressWarnings("unchecked")
	public void llenarTablaPaises() {
		try 
		{
			setPaises((List<Pais>) (List<?>) getEjecucion().listData("FROM SDA_PAISES"));
		} 
		catch (Exception e) 
		{
			lanzarMensajeError("Error:", "No se pudo cargar la tabla de paises", e);
		}
	}

	@SuppressWarnings("unchecked")
	public void llenarTablaAgregadores() {
		try 
		{
			setAgregadores((List<Agregadores>) (List<?>) getEjecucion().listData("FROM SDA_AGREGADORES WHERE ID_PAIS = "	+ getPais().getId()));
		} 
		catch (Exception e) 
		{
			lanzarMensajeError("Error:", "No se pudo cargar la tabla de Agregadores", e);
		}
	}

	@SuppressWarnings("unchecked")
	public void llenarTablaMetodos() 
	{
		try 
		{
			setMetodos((List<Metodos>) (List<?>) getEjecucion()
					.listData("FROM SDA_METODOS WHERE ID_AGREGADOR = "
							+ getAgregador().getId()));
		} 
		catch (Exception e) 
		{
			lanzarMensajeError("Error:", "No se pudo cargar la tabla de Metodos", e);
		}
	}

	@SuppressWarnings("unchecked")
	public void llenarTablaParametros() 
	{	
		try 
		{
			setParametros((List<Parametros>) (List<?>) getEjecucion()
					.listData("FROM SDA_PARAMETROS WHERE ID_METODO = "
							+ getMetodo().getId()));
		} 
		catch (Exception e) 
		{
			lanzarMensajeError("Error:", "No se pudo cargar la tabla de Parametros", e);
		}
	}
	
	@SuppressWarnings("unchecked")
	public void llenarTablaRespuestas() 
	{	
		try 
		{
			setRespuestas((List<Respuesta>) (List<?>) getEjecucion()
					.listData("FROM SDA_RESPUESTAS WHERE ID_METODO = "
							+ getMetodo().getId()));
		} 
		catch (Exception e) 
		{
			lanzarMensajeError("Error:", "No se pudo cargar la tabla de Respuestas", e);
		}
	}

	public void limpiarPais() 
	{
		setPais(new Pais());
		RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDPnlGridTab1");
	}

	public void limpiarAgregador() 
	{
		setAgregador(new Agregadores());
		RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDPnlGridTab2");
	}

	public void limpiarMetodo() 
	{
		setMetodo(new Metodos());
		RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDPnlGridTab3_2");
	}

	public void limpiarParametro() 
	{
		setParametro(new Parametros());
		RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDPnlGridTab4");
	}
	
	public void limpiarRespuesta() 
	{
		setRespuesta(new Respuesta());
		RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDPnlGridTab5");
	}
	
	public void eliminarPais() {
		if(getPais().getId()!=null){
			getEjecucion().deleteData(getPais());
			setPais(new Pais());
			llenarTablaPaises();
			RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDPnlGridTab1");
			RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDDataTblPaises");
		}
	}

	public void eliminarAgregador() {
		if(getAgregador().getId()!=null){
			getEjecucion().deleteData(getAgregador());
			setAgregador(new Agregadores());
			llenarTablaAgregadores();
			RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDPnlGridTab2");
			RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDDataTblAgregadores");
		}
	}

	public void eliminarMetodo() {
		if(getMetodo()!=null){
			getEjecucion().deleteData(getMetodo());
			setMetodo(new Metodos());
			llenarTablaMetodos();
			RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDPnlGridTab3_2");
			RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDDataTblMetodos");
		}
	}

	public void eliminarParametro() {
		if(getParametro().getId()!=null){
			getEjecucion().deleteData(getParametro());
			setParametro(new Parametros());
			llenarTablaParametros();
			RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDPnlGridTab4");
			RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDDataTblParametros");
		}
	}
	
	public void eliminarRespuesta() {
		if(getRespuesta().getId()!=null){
			getEjecucion().deleteData(getRespuesta());
			setRespuesta(new Respuesta());
			llenarTablaRespuestas();
			RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDPnlGridTab5");
			RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDDataTblRespuestas");
		}
	}
	
	public void guardarPais()
	{
		if(getPais().getId() == null)
		{
			getEjecucion().createData(getPais());
		}
		else
		{
			getEjecucion().updateData(getPais());
		}
		setPais(new Pais());
		llenarTablaPaises();
		RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDPnlGridTab1");
		RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDDataTblPaises");
	}
	
	public void guardarAgregador()
	{
		if(getAgregador().getId()== null)
		{
			getAgregador().setPais(getPais());
			getEjecucion().createData(getAgregador());
		}
		else
		{
			getEjecucion().updateData(getAgregador());
		}
		setAgregador(new Agregadores());
		llenarTablaAgregadores();
		RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDPnlGridTab2");
		RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDDataTblAgregadores");
	}
	
	public void guardarMetodo()
	{
		if(getMetodo().getEndPoint()==null){
			lanzarMensajeAdvertencia("Endpoint", "Debe ingresar el endpoint");
			return;
		}else{
			if(getMetodo().getEndPoint().startsWith("http:"))
			{
				getMetodo().setSeguridad(0);
			}
			else if(getMetodo().getEndPoint().startsWith("https:"))
			{
				getMetodo().setSeguridad(1);
			}else{
				lanzarMensajeAdvertencia("Endpoint", "Debe iniciar el endpoint con http: ó https");
			}
		}
		if(getMetodo().getId()==null)
		{
			getMetodo().setAgregador(getAgregador());
			getEjecucion().createData(getMetodo());
		}
		else
		{
			getEjecucion().updateData(getMetodo());
		}
		setMetodo(new Metodos());
		llenarTablaMetodos();
		RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDPnlGridTab3_2");
		RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDDataTblMetodos");
	}
	
	public void guardarParametro() 
	{
		if(getParametro().getId()==null)
		{
			getParametro().setMetodo(getMetodo());
			getEjecucion().createData(getParametro());
		}
		else
		{
			getEjecucion().updateData(getParametro());
		}
		setParametro(new Parametros());
		llenarTablaParametros();
		RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDPnlGridTab4");
		RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDDataTblParametros");
	}
	
	public void guardarRespuesta() 
	{
		if(getRespuesta().getId()==null)
		{
			getRespuesta().setMetodo(getMetodo());
			getEjecucion().createData(getRespuesta());
		}
		else
		{
			getEjecucion().updateData(getRespuesta());
		}
		setRespuesta(new Respuesta());
		llenarTablaRespuestas();
		RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDPnlGridTab5");
		RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDDataTblRespuestas");
	}

	/**
	 * Verificar que cuando se quiera mover de tab tenga seleccionado el objeto
	 * neccesario para seguir
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @param event
	 *            {@link FlowEvent}
	 * @return String {@link String}
	 * */
	public String onFlowProcessx(FlowEvent event) {
		if(event.getOldStep().equals("tab1") && event.getNewStep().equals("tab2"))
		{
			if(getPais().getId()==null)
			{
				lanzarMensajeInformacion("Pais", "Debe seleccionar un pais");
				return event.getOldStep();
			}
		}
		if(event.getOldStep().equals("tab2")  && event.getNewStep().equals("tab3"))
		{
			if(getAgregador().getId()==null)
			{
				lanzarMensajeInformacion("Agregador", "Debe seleccionar un agregador");
				return event.getOldStep();
			}
		}
		if(event.getOldStep().equals("tab3") && event.getNewStep().equals("tab4"))
		{
			if(getMetodo().getId()==null)
			{
				lanzarMensajeInformacion("Metodo", "Debe seleccionar un metodo");
				return event.getOldStep();
			}
		}
		return event.getNewStep();
	}

	public void readWSDL() {
		try {
			getAgregador().setPais(getPais());
			ParametrizarServicio readWSDL = new ParametrizarServicio();
			setAgregador(readWSDL.getServicesInfo(getMetodo().getWsdl_Agregador(), getAgregador()));
			
			for (Metodos metodo : agregador.getMetodos()) {
				System.out.println("Metodo Name: " 		+ metodo.toString());
				metodo.setAgregador(getAgregador());
				if(metodo.getNombre()==null)
					metodo.setNamespaceURI("" +metodo.getTargetMethodName());
				if(metodo.getTargetURL().startsWith("http:")){
					metodo.setSeguridad(0);
				}
				if(metodo.getTargetURL().startsWith("https:")){
					metodo.setSeguridad(1);
				}
				getEjecucion().createData(metodo);
				
				for (Parametros param : metodo.getParametros()) {
					System.out.println("parametro Name: " + param.getNombre());
					param.setMetodo(metodo);
					getEjecucion().createData(param);
				}				
			}			
			lanzarMensajeInformacion("Exito", "Se obtubo la parametrizacion exitosamente");
		} catch (WSDLException e) {
			lanzarMensajeError("Error",	"No se pudo obtener la parametrización", e);
		}
	}
	
	public void cargarPais(Pais pais) {
		setPais(pais);
		llenarTablaAgregadores();
		RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDPnlGridTab1");
	}
	
	public void cargarAgregador(Agregadores agregadores) {
		setAgregador(agregadores);
		llenarTablaMetodos();
		RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDPnlGridTab2");
	}
	
	public void cargarMetodo(Metodos metodos) {
		setMetodo(metodos);
		llenarTablaParametros();
		llenarTablaRespuestas();
		RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDPnlGridTab3_2");
	}
	
	public void cargarParametro(Parametros parametros) {
		setParametro(parametros);
		RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDPnlGridTab4");
	}
	
	public void cargarRespuesta(Respuesta respuesta) {
		setRespuesta(respuesta);
		RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDPnlGridTab5");
	}
	
	public SelectItem[] getListaEstados() {
		SelectItem[] items = new SelectItem[2];
		items[0] = new SelectItem(1, "Activo");
		items[1] = new SelectItem(0, "Inactivo");
		return items;
	}
	
	public SelectItem[] getListaServicios() {
		SelectItem[] items = new SelectItem[3];
		items[0] = new SelectItem(1, "Lista Negra");
		items[1] = new SelectItem(2, "Consulta de Servicios");
		items[2] = new SelectItem(3, "Baja de Servicios");
		return items;
	}
	
	public String estadoLabel(Integer id){
		if(id==1)
			return "Activo";
		else if (id==0)
			return "Inactivo";
		else
			return "";
	}
	
	public Pais getPais() {
		return pais;
	}

	public void setPais(Pais pais) {
		this.pais = pais;
	}

	public Agregadores getAgregador() {
		return agregador;
	}

	public void setAgregador(Agregadores agregador) {
		this.agregador = agregador;
	}

	public Metodos getMetodo() {
		return metodo;
	}

	public void setMetodo(Metodos metodo) {
		this.metodo = metodo;
	}

	public Parametros getParametro() {
		return parametro;
	}

	public void setParametro(Parametros parametro) {
		this.parametro = parametro;
	}

	public List<Pais> getPaises() {
		return paises;
	}

	public void setPaises(List<Pais> paises) {
		this.paises = paises;
	}

	public List<Agregadores> getAgregadores() {
		return agregadores;
	}

	public void setAgregadores(List<Agregadores> agregadores) {
		this.agregadores = agregadores;
	}

	public List<Metodos> getMetodos() {
		return metodos;
	}

	public void setMetodos(List<Metodos> metodos) {
		this.metodos = metodos;
	}

	public List<Parametros> getParametros() {
		return parametros;
	}

	public void setParametros(List<Parametros> parametros) {
		this.parametros = parametros;
	}

	/**
	 * @return the respuesta
	 */
	public Respuesta getRespuesta() {
		return respuesta;
	}

	/**
	 * @param respuesta the respuesta to set
	 */
	public void setRespuesta(Respuesta respuesta) {
		this.respuesta = respuesta;
	}

	/**
	 * @return the respuestas
	 */
	public List<Respuesta> getRespuestas() {
		return respuestas;
	}

	/**
	 * @param respuestas the respuestas to set
	 */
	public void setRespuestas(List<Respuesta> respuestas) {
		this.respuestas = respuestas;
	}
}
