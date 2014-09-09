package sv.avantia.depurador.agregadores.view.managebean.viewscoped;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

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
			lanzarMensajeInformacion("Flujo", "Se termino de procesar exitosamente");
		} 
		catch (Exception exception) 
		{
			lanzarMensajeError("Error", "No se puede generar la depuración", exception);
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
