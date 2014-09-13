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
	private String numeroMovil;
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
		try 
		{
			getNumerosMoviles().add(getNumeroMovil());
			for (String numero : getNumerosMoviles())
        	{
        		System.out.println(numero);
        	}
			
			long init = System.currentTimeMillis();
			
			//consultar la parametrización
			for (Pais pais : obtenerParmetrizacion()) {
				System.out.println("Procesando... " + pais.getNombre());
				for (Agregadores agregador : pais.getAgregadores()) {
					//abrir un hilo pr cada agregador parametrizados
					ConsultaAgregadorPorHilo hilo = new ConsultaAgregadorPorHilo();
					hilo.setMoviles(getNumerosMoviles());
					hilo.setAgregador(agregador);
					hilo.start();
				}
			}
			
			//terminar el flujo.
			SessionFactoryUtil.closeSession();
			
			System.out.println("finish " + ((System.currentTimeMillis() - init)/1000)  + "Segundos");
			
			lanzarMensajeInformacion("Flujo", "Se termino de procesar exitosamente");
		} 
		catch (Exception exception) 
		{
			lanzarMensajeError("Error", "No se puede generar la depuración", exception);
		}
		
	}
	
	@SuppressWarnings("unchecked")
	public static List<Pais> obtenerParmetrizacion(){
		BdEjecucion ejecucion = new BdEjecucion();
		try {
			return (List<Pais>)(List<?>) ejecucion.listData("FROM SDA_PAISES WHERE ID = 1");
		} finally{
			ejecucion = null;
		}
	}

	public String getNumeroMovil() 
	{
		return numeroMovil;
	}

	public void setNumeroMovil(String numeroMovil) 
	{
		this.numeroMovil = numeroMovil;
	}

	private List<String> getNumerosMoviles() 
	{
		return numerosMoviles;
	}

	private void setNumerosMoviles(List<String> numerosMoviles) 
	{
		this.numerosMoviles = numerosMoviles;
	}

}
