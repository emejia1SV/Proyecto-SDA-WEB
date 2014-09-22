package sv.avantia.depurador.agregadores.view.managebean.viewscoped;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import sv.avantia.depurador.agregadores.entidades.Agregadores;
import sv.avantia.depurador.agregadores.entidades.Pais;
import sv.avantia.depurador.agregadores.hilo.ConsultaAgregadorPorHilo;
import sv.avantia.depurador.agregadores.jdbc.BdEjecucion;
import sv.avantia.depurador.agregadores.jdbc.SessionFactoryUtil;
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
	 * Metodo que depurará un numero de telefono en los agregadores
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @return void
	 * */
	public void accionDepuracion() 
	{
		logger.info("Iniciando la depuración unitaria");
		try 
		{
			if(getNumeroMovil() == null || getNumeroMovil().trim().equals(""))
				lanzarMensajeAdvertencia("Número", "Por favor, ingresar un numero telefonico");
			
			//obtener el numero para la depuracion
			setNumerosMoviles(new ArrayList<String>());
			getNumerosMoviles().add(getNumeroMovil()); 
			
			if(getNumerosMoviles().size()>0) 
			{
				setEjecucion(new BdEjecucion());
				//consultar la parametrización
				for (Pais pais : obtenerParmetrizacion()) 
				{
					for (Agregadores agregador : pais.getAgregadores()) 
					{
						//abrir un hilo pr cada agregador parametrizados
						ConsultaAgregadorPorHilo hilo = new ConsultaAgregadorPorHilo();
						hilo.setMoviles(getNumerosMoviles());
						hilo.setAgregador(agregador);
						hilo.setTipoDepuracion("UNITARIA");
						hilo.setUsuarioSistema(getUsuarioSessionMB().getUsuarioSession());
						hilo.start();
					}
				}
				lanzarMensajeInformacion("Flujo", "Se termino de procesar exitosamente");
			}
			else
			{
				lanzarMensajeInformacion("Flujo", "No existen números para procesar");
			}
		} 
		catch (Exception exception) 
		{
			lanzarMensajeError("Error", "No se puede generar la depuración", exception);
		}
		finally
		{
			//terminar el flujo.
			//SessionFactoryUtil.closeSession();
			setNumerosMoviles(null);
			setEjecucion(null);
		}
		
	}
	
	/**
	 * Obtener insumo de parametrización para consultar a los agregadores
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @return {@link List} paises con sus dependencias en la base de datos
	 * @throws Exception
	 *             podria generarse una exepcion en el momento de ejecutar la
	 *             consulta a la base de datos
	 * */
	@SuppressWarnings("unchecked")
	public List<Pais> obtenerParmetrizacion() throws Exception 
	{
		return (List<Pais>)(List<?>) getEjecucion().listData("FROM SDA_PAISES");
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
