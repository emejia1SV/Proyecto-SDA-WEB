package sv.avantia.depurador.agregadores.view.managebean.viewscoped;

import java.io.Serializable;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import sv.avantia.depurador.agregadores.utils.AccionesManageBean;

@ManagedBean
@ViewScoped
public class DepuracionUnitariaBean extends AccionesManageBean implements Serializable {

	private static final long serialVersionUID = 1L;
	private String numeroMovil;

	@PostConstruct
	public void init() 
	{

	}

	public void accionDepuacion() 
	{
		try {
			System.out.println("Entre a depurar un numero");
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

}
