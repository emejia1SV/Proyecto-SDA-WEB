package sv.avantia.depurador.agregadores.view.managebean.viewscoped;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import org.primefaces.context.RequestContext;

import sv.avantia.depurador.agregadores.hilo.GestionarParametrizacion;
import sv.avantia.depurador.agregadores.jdbc.BdEjecucion;
import sv.avantia.depurador.agregadores.utils.AccionesManageBean;

@ManagedBean
@ViewScoped
public class DepuracionUnitariaBean extends AccionesManageBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	/**
	 * Instancia de un {@link String} para alojar el unico numero que sera
	 * depurado en este Managebean
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * */
	private String numeroMovil = "";
	
	/**
	 * Instancia de la lista que tendra alojada los numeros para la depuracion
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * */
	private List<String> numerosMoviles;

	/**
	 * Metodo {@link PostConstruct}
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * */
	@PostConstruct
	public void init() 
	{
		setNumerosMoviles(new ArrayList<String>());
	}

	/**
	 * Metodo que depurar� un numero de telefono en los agregadores
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @return void
	 * */
	public void accionDepuracion() 
	{
		logger.info("Iniciando la depuraci�n unitaria");
		try 
		{
			if(getNumeroMovil() == null || getNumeroMovil().trim().equals(""))
				lanzarMensajeAdvertencia("N�mero", "Por favor, ingresar un numero telefonico");
			
			//obtener el numero para la depuracion
			setNumerosMoviles(new ArrayList<String>());
			getNumerosMoviles().add(getNumeroMovil()); 
			
			if(getNumerosMoviles().size()>0) 
			{
				setEjecucion(new BdEjecucion());
				
				//gestionar la logica de la depuracion
				GestionarParametrizacion gestion = new GestionarParametrizacion();
				gestion.depuracionBajaMasiva(getUsuarioSessionMB().getUsuarioSession(), getNumerosMoviles(), "UNITARIA", false);
			}
			else
			{
				lanzarMensajeInformacion("Flujo", "No existen n�meros para procesar");
			}
		} 
		catch (Exception exception) 
		{
			lanzarMensajeError("Error", "No se puede generar la depuraci�n", exception);
		}
		finally
		{
			setNumeroMovil(null);
			setNumerosMoviles(null);
			setEjecucion(null);
			RequestContext.getCurrentInstance().update("IDFrmPrincipal");
			lanzarMensajeInformacion("Flujo", "Se termino de procesar exitosamente");
		}
	}
	
	/**
	 * getter
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @return {@link String} numero movil
	 */
	public String getNumeroMovil() 
	{
		return numeroMovil;
	}

	/**
	 * setter
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @param ejecucion
	 *            the ejecucion to set
	 * @return {@link Void}
	 */
	public void setNumeroMovil(String numeroMovil) 
	{
		this.numeroMovil = numeroMovil;
	}

	/**
	 * getter
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @return {@link List} numeros moviles
	 */
	private List<String> getNumerosMoviles() 
	{
		return numerosMoviles;
	}

	/**
	 * setter
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @param ejecucion
	 *            the ejecucion to set
	 * @return {@link Void}
	 */
	private void setNumerosMoviles(List<String> numerosMoviles) 
	{
		this.numerosMoviles = numerosMoviles;
	}
}