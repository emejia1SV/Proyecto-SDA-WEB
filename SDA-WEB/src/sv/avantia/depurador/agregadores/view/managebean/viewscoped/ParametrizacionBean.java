package sv.avantia.depurador.agregadores.view.managebean.viewscoped;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.model.SelectItem;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.primefaces.context.RequestContext;
import org.primefaces.event.FlowEvent;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import com.cladonia.xml.webservice.wsdl.WSDLException;

import sv.avantia.depurador.agregadores.entidades.Agregadores;
import sv.avantia.depurador.agregadores.entidades.CatRespuestas;
import sv.avantia.depurador.agregadores.entidades.CatResultados;
import sv.avantia.depurador.agregadores.entidades.Metodos;
import sv.avantia.depurador.agregadores.entidades.Pais;
import sv.avantia.depurador.agregadores.entidades.Parametros;
import sv.avantia.depurador.agregadores.entidades.Respuesta;
import sv.avantia.depurador.agregadores.entidades.ResultadosRespuesta;
import sv.avantia.depurador.agregadores.jdbc.BdEjecucion;
import sv.avantia.depurador.agregadores.utils.AccionesManageBean;
import sv.avantia.depurador.agregadores.utils.CollectionsUtils;
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
	private ResultadosRespuesta resultadosRespuesta;
	private Respuesta respuesta;
	private List<Pais> paises;
	private List<Agregadores> agregadores;
	private List<Metodos> metodos;
	private List<Parametros> parametros;
	private List<Respuesta> respuestas;
	private List<ResultadosRespuesta> resultadosRespuestas;
	private List<CatRespuestas> catRespuestas;
	private CatRespuestas[] catRespuestaSelected;
	private List<CatResultados> catResultados;
	private CatResultados[] catResultadoSelected;
	private String ubicacion;

	/**
	 * Metodo {@link PostConstruct}
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * */
	@PostConstruct
	public void init() {
		setUbicacion("");
		setEjecucion(new BdEjecucion());
		setPais(new Pais());
		setAgregador(new Agregadores());
		setMetodo(new Metodos());
		setParametro(new Parametros());
		setPaises(new ArrayList<Pais>());
		setAgregadores(new ArrayList<Agregadores>());
		setMetodos(new ArrayList<Metodos>());
		setParametros(new ArrayList<Parametros>());
		setRespuestas(new ArrayList<Respuesta>());
		setResultadosRespuesta(new ResultadosRespuesta());
		setResultadosRespuestas(new ArrayList<ResultadosRespuesta>());
		setCatRespuestas(new ArrayList<CatRespuestas>());
		setCatResultados(new ArrayList<CatResultados>());
		llenarTablaPaises();
		llenarTablaCatRespuesta();
		llenarTablaCatResultado();
	}

	@SuppressWarnings("unchecked")
	private void llenarTablaCatResultado() {
		try 
		{
			setCatResultados((List<CatResultados>) (List<?>) getEjecucion().listData("FROM SDA_CAT_RESULTADOS"));
		} 
		catch (Exception e) 
		{
			lanzarMensajeError("Error:", "No se pudo cargar la tabla de catresultados", e);
		}
	}
	
	@SuppressWarnings("unchecked")
	private void llenarTablaCatRespuesta() {
		try 
		{
			setCatRespuestas((List<CatRespuestas>) (List<?>) getEjecucion().listData("FROM SDA_CAT_RESPUESTAS"));
		} 
		catch (Exception e) 
		{
			lanzarMensajeError("Error:", "No se pudo cargar la tabla de catrespuestas", e);
		}
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
			setAgregadores((List<Agregadores>) (List<?>) getEjecucion()
					.listData("FROM SDA_AGREGADORES WHERE ID_PAIS = " 
							+ getPais().getId() + " ORDER BY NOMBRE_AGREGADOR"));
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
	private void llenarTablaRespuestas() 
	{	
		try 
		{
			setRespuestas((List<Respuesta>) (List<?>) getEjecucion()
					.listData("FROM SDA_RESPUESTAS WHERE ID_METODO = "
							+ getMetodo().getId()));
			
			setCatRespuestaSelected(new CatRespuestas[getRespuestas().size()]);
			for (int i = 0; i < getRespuestas().size(); i++) {
				getCatRespuestaSelected()[i] = getRespuestas().get(i).getCatRespuesta();
			}
			
		} 
		catch (Exception e) 
		{
			lanzarMensajeError("Error:", "No se pudo cargar la tabla de Respuestas", e);
		}
	}
	
	@SuppressWarnings("unchecked")
	private void llenarTablaResultadoRespuestas() 
	{	
		try 
		{
			setResultadosRespuestas((List<ResultadosRespuesta>) (List<?>) getEjecucion()
					.listData("FROM SDA_RESULTADOS_RESPUESTA WHERE ID_RESPUESTA = "
							+ getRespuesta().getId()));
			
			System.out.println(getResultadosRespuestas().size());
			setCatResultadoSelected(new CatResultados[getResultadosRespuestas().size()]);
			for (int i = 0; i < getResultadosRespuestas().size(); i++) {
				System.out.println("agregaremos a " + getResultadosRespuestas().get(i).getCatResultado().getId());
				getCatResultadoSelected()[i] = getResultadosRespuestas().get(i).getCatResultado();
			}
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
	
	public void limpiarResultadoRespuesta() 
	{
		setResultadosRespuesta(new ResultadosRespuesta());
		RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDPnlGridTab5");
	}
	
	public void eliminarPais() {
		try {
			if(getPais().getId()!=null){
				getEjecucion().deleteData(getPais());
				setPais(new Pais());
				llenarTablaPaises();
				RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDPnlGridTab1");
				RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDDataTblPaises");
			}
		} catch (Exception e) {
			lanzarMensajeError("Guardar", "Problemas para eliminar el objeto Pais", e);
		}
	}

	public void eliminarAgregador() {
		try {
			if(getAgregador().getId()!=null){
				getEjecucion().deleteData(getAgregador());
				setAgregador(new Agregadores());
				llenarTablaAgregadores();
				RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDPnlGridTab2");
				RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDDataTblAgregadores");
			}
		} catch (Exception e) {
			lanzarMensajeError("Guardar", "Problemas para eliminar el objeto Agregador", e);
		}	
	}

	public void eliminarMetodo() {
		try {
			if(getMetodo()!=null){
				getEjecucion().deleteData(getMetodo());
				setMetodo(new Metodos());
				llenarTablaMetodos();
				RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDPnlGridTab3_2");
				RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDDataTblMetodos");
			}
		} catch (Exception e) {
			lanzarMensajeError("Guardar", "Problemas para eliminar el objeto Metodo", e);
		}
		
	}

	public void eliminarParametro() {
		try {
			if(getParametro().getId()!=null){
				getEjecucion().deleteData(getParametro());
				setParametro(new Parametros());
				llenarTablaParametros();
				RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDPnlGridTab4");
				RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDDataTblParametros");
			}
		} catch (Exception e) {
			lanzarMensajeError("Guardar", "Problemas para eliminar el objeto Parametro", e);
		}
	}
	
	
	
	public void guardarPais()
	{
		try {
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
		} catch (Exception e) {
			lanzarMensajeError("Guardar", "Problemas para guardar el objeto Agregador", e);
		}
		
	}
	
	public void guardarAgregador()
	{
		try {
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
		} catch (Exception e) {
			lanzarMensajeError("Guardar", "Problemas para guardar el objeto Agregador", e);
		}
		
	}
	
	public void guardarMetodo()
	{
		try {
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
				getMetodo().setId((Integer)getEjecucion().createData(getMetodo()));
				obtenerParametros(getMetodo().getInputMessageText());
			}
			else
			{
				getEjecucion().updateData(getMetodo());
			}
			setMetodo(new Metodos());
			llenarTablaMetodos();
			RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDPnlGridTab3_2");
			RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDDataTblMetodos");
		} catch (Exception e) {
			lanzarMensajeError("Guardar", "Problemas para guardar el objeto Metodo", e);
		}
		
	}
	
	private void obtenerParametros(String xml) throws ParserConfigurationException, UnsupportedEncodingException, SAXException, IOException {
		DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder;
		builder = builderFactory.newDocumentBuilder();
		Document doc = builder.parse(new InputSource(new ByteArrayInputStream(xml.getBytes("utf-8")))  );
		doc.getDocumentElement().normalize();
		if (doc.getDocumentElement().hasChildNodes()) 
		{
			NodeList nodeList = doc.getDocumentElement().getChildNodes();
			lecturaDeDatos(nodeList);
		}
	}
	
	private void lecturaDeDatos(NodeList nodeList) {
		for (int i = 0; i < nodeList.getLength(); i++) 
		{
			Node node = nodeList.item(i);
			if (node.getNodeType() == Node.ELEMENT_NODE) 
			{
				if (node.hasChildNodes())
					lecturaDeDatos(node.getChildNodes());
				if(node.getTextContent().startsWith("_*") && node.getNodeName().contains(node.getTextContent().substring(2, node.getTextContent().length()-2)))
				{
					getParametro().setNombre(node.getTextContent().substring(2, node.getTextContent().length()-2));
					guardarParametro();
				}					
			}
		}
	}
	
	public void guardarParametro() 
	{
		try {
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
		} catch (Exception e) {
			lanzarMensajeError("Guardar", "Problemas para guardar el objeto Parametro", e);
		}
		
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
		if(event.getOldStep().equals("tab5") && event.getNewStep().equals("tab6"))
		{
			if(getRespuesta().getId()==null)
			{
				lanzarMensajeInformacion("Respuesta", "Debe seleccionar una respuesta");
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
		setAgregador(new Agregadores());
		setMetodo(new Metodos());
		setParametro(new Parametros());
		setRespuesta(new Respuesta());
		setResultadosRespuesta(new ResultadosRespuesta());
		llenarTablaAgregadores();
		setUbicacion(getPais().getNombre());
		RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDPnlGridTab1");
	}
	
	public void cargarAgregador(Agregadores agregadores) {
		setAgregador(agregadores);
		setMetodo(new Metodos());
		setParametro(new Parametros());
		setRespuesta(new Respuesta());
		setResultadosRespuesta(new ResultadosRespuesta());
		llenarTablaMetodos();
		setUbicacion(getPais().getNombre() + "	>>	" + getAgregador().getNombre_agregador());
		RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDPnlGridTab2");
	}
	
	public void cargarMetodo(Metodos metodos) {
		setMetodo(metodos);
		setParametro(new Parametros());
		setRespuesta(new Respuesta());
		setResultadosRespuesta(new ResultadosRespuesta());
		llenarTablaParametros();
		llenarTablaRespuestas();
		setUbicacion(getPais().getNombre() + "	>>	" + getAgregador().getNombre_agregador() + " >>	"  + metodoLabel(metodos.getMetodo()));
		RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDPnlGridTab3_2");
	}
	
	public void cargarParametro(Parametros parametros) {
		setParametro(parametros);
		RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDPnlGridTab4");
	}
	
	public void cargarCatRespuesta(CatRespuestas catRespuesta){
		setResultadosRespuestas(new ArrayList<ResultadosRespuesta>());
		for (int i = 0; i < getRespuestas().size(); i++) {
			if(getRespuestas().get(i).getCatRespuesta().getId()==catRespuesta.getId()){
				cargarRespuesta(getRespuestas().get(i));
			}
		}
	}
	
	private void cargarRespuesta(Respuesta respuesta) {
		setRespuesta(respuesta);
		setResultadosRespuesta(new ResultadosRespuesta());
		llenarTablaResultadoRespuestas();
		RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDPnlGridTab5");
	}
	
	public void cargarResultadoRespuesta(ResultadosRespuesta resultadosRespuesta) {
		setResultadosRespuesta(resultadosRespuesta);
		RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDPnlGridTab6");
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
	
	public String metodoLabel(Integer id){
		if(id==1)
			return "Lista Negra";
		else if (id==2)
			return "Consulta de Servicios";
		else if (id==3)
			return "Baja de Servicios";
		else
			return "";
	}
	
	public void readRespuestaSelected(){
		Integer[] enBase;
		Integer[] selected;
		
		enBase = new Integer[getRespuestas().size()];
		for (int i = 0; i < getRespuestas().size(); i++) {
			enBase[i] = getRespuestas().get(i).getCatRespuesta().getId();
		}
		
		selected = new Integer[getCatRespuestaSelected().length];
		for (int i = 0; i < getCatRespuestaSelected().length; i++) {
			selected[i] = getCatRespuestaSelected()[i].getId();
		}
		
		HashSet<Integer> marge2 = (HashSet<Integer>) CollectionsUtils.eliminar(new HashSet<Integer>(Arrays.asList(enBase)), new HashSet<Integer>(Arrays.asList(selected)));
		System.out.println("Cantida de eliminaciones" + marge2.size());
		for (Integer idCatRespuesta : marge2) {
			for (int i = 0; i < getRespuestas().size(); i++) {
				if(getRespuestas().get(i).getCatRespuesta().getId()==idCatRespuesta){
					System.out.println("eliminaremos a la respuesta " + getRespuestas().get(i).getId());
					eliminarRespuesta(getRespuestas().get(i));
				}
			}
		}
		
		HashSet<Integer> marge1 = (HashSet<Integer>) CollectionsUtils.guardar(new HashSet<Integer>(Arrays.asList(enBase)), new HashSet<Integer>(Arrays.asList(selected)));
		for (Integer idCatRespuesta : marge1) {
			System.out.println("guardaremos una respuesta con el id " + idCatRespuesta); 
			for (CatRespuestas catRespuesta : getCatRespuestas()) {
				if(catRespuesta.getId()==idCatRespuesta){
					guardarRespuesta(catRespuesta);
				}
			}
		}
	}
	
	private void guardarRespuesta(CatRespuestas catRespuesta) 
	{
		try {
			Respuesta respuesta = new Respuesta();
			respuesta.setMetodo(getMetodo());
			respuesta.setCatRespuesta(catRespuesta);
			respuesta.setNombre(catRespuesta.getNombre());
			getEjecucion().createData(respuesta);
			
			
			respuesta=new Respuesta();
			llenarTablaRespuestas();
			RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDPnlGridTab5");
			RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDDataTblRespuestas");
		} catch (Exception e) {
			lanzarMensajeError("Guardar", "Problemas para guardar el objeto Respuesta", e);
		}
		
	}
	
	private void eliminarRespuesta(Respuesta respuesta) {
		try {
			getEjecucion().deleteData(respuesta);
			llenarTablaRespuestas();
			RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDPnlGridTab5");
			RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDDataTblRespuestas");
		} catch (Exception e) {
			lanzarMensajeError("Guardar", "Problemas para eliminar el objeto Respuesta", e);
		}
		
	}
	
	public void readResultadoSelected(){
		Integer[] enBase;
		Integer[] selected;
		
		System.out.println("iniciamos los resultados de base");
		enBase = new Integer[getResultadosRespuestas().size()];
		for (int i = 0; i < getResultadosRespuestas().size(); i++) {
			enBase[i] = getResultadosRespuestas().get(i).getCatResultado().getId();
		}
		
		System.out.println("iniciamos los datos seleccionados");
		selected = new Integer[getCatResultadoSelected().length];
		for (int i = 0; i < getCatResultadoSelected().length; i++) {
			selected[i] = getCatResultadoSelected()[i].getId();
		}
		
		HashSet<Integer> marge2 = (HashSet<Integer>) CollectionsUtils.eliminar(new HashSet<Integer>(Arrays.asList(enBase)), new HashSet<Integer>(Arrays.asList(selected)));
		System.out.println("Cantida de eliminaciones" + marge2.size());
		for (Integer idCatResultado : marge2) {
			for (int i = 0; i < getRespuestas().size(); i++) {
				if(getResultadosRespuestas().get(i).getCatResultado().getId()==idCatResultado){
					System.out.println("eliminaremos al resultado " + getResultadosRespuestas().get(i).getId());
					eliminarResultadoRespuesta(getResultadosRespuestas().get(i));
				}
			}
		}
		
		HashSet<Integer> marge1 = (HashSet<Integer>) CollectionsUtils.guardar(new HashSet<Integer>(Arrays.asList(enBase)), new HashSet<Integer>(Arrays.asList(selected)));
		for (Integer idCatResultado : marge1) {
			System.out.println("guardaremos una respuesta con el id " + idCatResultado); 
			for (CatResultados catResultados : getCatResultados()) {
				if(catResultados.getId()==idCatResultado){
					guardarResultadoRespuesta(catResultados);
				}
			}
		}
	}
	
	private void guardarResultadoRespuesta(CatResultados catResultados) {
		try {
			ResultadosRespuesta resultadosRespuesta = new ResultadosRespuesta();
			
			resultadosRespuesta.setCatResultado(catResultados);
			resultadosRespuesta.setDato(catResultados.getDato());
			resultadosRespuesta.setValor(catResultados.getValor());
			getEjecucion().createData(resultadosRespuesta);
			
			llenarTablaResultadoRespuestas();
			RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDPnlGridTab6");
			RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDDataTblResultadoRespuestas");
		} catch (Exception e) {
			lanzarMensajeError("Guardar", "Problemas para guardar el objeto Resultado de la Respuesta", e);
		}
	}
	
	private void eliminarResultadoRespuesta(ResultadosRespuesta resultadosRespuesta) {
		try {
				getEjecucion().deleteData(resultadosRespuesta);
				llenarTablaResultadoRespuestas();
				RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDPnlGridTab6");
				RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDDataTblResultadoRespuestas");
		} catch (Exception e) {
			lanzarMensajeError("Guardar", "Problemas para eliminar el objeto Resiltado de la Respuesta", e);
		}
	}
	
	public void guardarResultadoRespuesta() 
	{
		try {
			if(getResultadosRespuesta().getId()==null)
			{
				getResultadosRespuesta().setRespuesta(getRespuesta());
				getEjecucion().createData(getResultadosRespuesta());
			}
			else
			{
				getEjecucion().updateData(getResultadosRespuesta());
			}
			setResultadosRespuesta(new ResultadosRespuesta());
			llenarTablaResultadoRespuestas();
			RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDPnlGridTab6");
			RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDDataTblResultadoRespuestas");
		} catch (Exception e) {
			lanzarMensajeError("Guardar", "Problemas para guardar el objeto Resultado de la Respuesta", e);
		}
		
	}
	
	public void eliminarResultadoRespuesta() {
		try {
			if(getResultadosRespuesta().getId()!=null){
				getEjecucion().deleteData(getResultadosRespuesta());
				setResultadosRespuesta(new ResultadosRespuesta());
				llenarTablaResultadoRespuestas();
				RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDPnlGridTab6");
				RequestContext.getCurrentInstance().update("IDFrmPrincipal:IDDataTblResultadoRespuestas");
			}
		} catch (Exception e) {
			lanzarMensajeError("Guardar", "Problemas para eliminar el objeto Resiltado de la Respuesta", e);
		}
		
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

	/**
	 * @return the resultadosRespuesta
	 */
	public ResultadosRespuesta getResultadosRespuesta() {
		return resultadosRespuesta;
	}

	/**
	 * @param resultadosRespuesta the resultadosRespuesta to set
	 */
	public void setResultadosRespuesta(ResultadosRespuesta resultadosRespuesta) {
		this.resultadosRespuesta = resultadosRespuesta;
	}

	/**
	 * @return the resultadosRespuestas
	 */
	public List<ResultadosRespuesta> getResultadosRespuestas() {
		return resultadosRespuestas;
	}

	/**
	 * @param resultadosRespuestas the resultadosRespuestas to set
	 */
	public void setResultadosRespuestas(
			List<ResultadosRespuesta> resultadosRespuestas) {
		this.resultadosRespuestas = resultadosRespuestas;
	}

	/**
	 * @return the ubicacion
	 */
	public String getUbicacion() {
		return ubicacion;
	}

	/**
	 * @param ubicacion the ubicacion to set
	 */
	public void setUbicacion(String ubicacion) {
		this.ubicacion = ubicacion;
	}

	/**
	 * @return the catRespuestas
	 */
	public List<CatRespuestas> getCatRespuestas() {
		return catRespuestas;
	}

	/**
	 * @param catRespuestas the catRespuestas to set
	 */
	public void setCatRespuestas(List<CatRespuestas> catRespuestas) {
		this.catRespuestas = catRespuestas;
	}

	/**
	 * @return the catRespuestaSelected
	 */
	public CatRespuestas[] getCatRespuestaSelected() {
		return catRespuestaSelected;
	}

	/**
	 * @param catRespuestaSelected the catRespuestaSelected to set
	 */
	public void setCatRespuestaSelected(CatRespuestas[] catRespuestaSelected) {
		this.catRespuestaSelected = catRespuestaSelected;
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
	 * @return the catResultados
	 */
	public List<CatResultados> getCatResultados() {
		return catResultados;
	}

	/**
	 * @param catResultados the catResultados to set
	 */
	public void setCatResultados(List<CatResultados> catResultados) {
		this.catResultados = catResultados;
	}

	/**
	 * @return the catResultadoSelected
	 */
	public CatResultados[] getCatResultadoSelected() {
		return catResultadoSelected;
	}

	/**
	 * @param catResultadoSelected the catResultadoSelected to set
	 */
	public void setCatResultadoSelected(CatResultados[] catResultadoSelected) {
		this.catResultadoSelected = catResultadoSelected;
	}
}
