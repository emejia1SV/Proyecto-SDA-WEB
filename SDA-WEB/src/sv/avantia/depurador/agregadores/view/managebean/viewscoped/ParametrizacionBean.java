package sv.avantia.depurador.agregadores.view.managebean.viewscoped;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.event.ActionEvent;

import org.primefaces.event.FlowEvent;

import com.cladonia.xml.webservice.wsdl.WSDLException;

import sv.avantia.depurador.agregadores.entidades.Agregadores;
import sv.avantia.depurador.agregadores.entidades.Metodos;
import sv.avantia.depurador.agregadores.entidades.Pais;
import sv.avantia.depurador.agregadores.entidades.Parametros;
import sv.avantia.depurador.agregadores.jdbc.BdEjecucion;
import sv.avantia.depurador.agregadores.jdbc.SessionFactoryUtil;
import sv.avantia.depurador.agregadores.utils.AccionesManageBean;
import sv.avantia.depurador.agregadores.ws.cliente.ParametrizarServicio;

@ManagedBean
@ViewScoped
public class ParametrizacionBean extends AccionesManageBean implements Serializable {

	private static final long serialVersionUID = 1L;
	private Pais pais;
	private Agregadores agregador;
	private Metodos metodo;
	private Parametros parametro;
	private List<Pais> paises;
	
	
	/**
	 * Metodo {@link PostConstruct}
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * */
	@PostConstruct
	public void init() 
	{
		setPais(new Pais());
		setAgregador(new Agregadores());
		setMetodo(new Metodos());
		setParametro(new Parametros());
		setPaises(new ArrayList<Pais>());
		llenarTablaPaises();
	}
	
	
	@SuppressWarnings("unchecked")
	public void llenarTablaPaises(){
		BdEjecucion ejecucion = new BdEjecucion();
		setPaises((List<Pais>) ejecucion.listData("FROM AGR_PAISES"));
		
		SessionFactoryUtil.closeSession();
	}
	
	public void save(ActionEvent actionEvent) {
	 	 lanzarMensajeInformacion("pais", getPais().getNombre());
	 	 lanzarMensajeInformacion("agregador", getAgregador().getNombre_agregador());
	 	 lanzarMensajeInformacion("metodo", getMetodo().getNombre());
	 	 lanzarMensajeInformacion("parametro", getParametro().getNombre());
	}
	
	/**
	 * Implementar cambio de tas
	 * */
	public String onFlowProcessx(FlowEvent event){
        System.out.println("go >> " + event.getNewStep());
        System.out.println("back >> " + event.getOldStep());
        return event.getNewStep();
    }
   
	public void readWSDL(){
		try {
			setAgregador(new ParametrizarServicio().getServicesInfo(getMetodo().getWsdl_Agregador(), getAgregador()));
			lanzarMensajeInformacion("Exito" ,"Se obtubo la parametrizacion exitosamente");
		} catch (WSDLException e) {
			lanzarMensajeError("Error", "No se pudo obtener la parametrización", e);
		}  
	}
	
	public void cargarPais(Pais pais){
		setPais(pais);
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
}
