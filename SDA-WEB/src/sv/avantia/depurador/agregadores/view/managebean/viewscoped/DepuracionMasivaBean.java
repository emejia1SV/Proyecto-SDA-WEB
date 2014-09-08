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
public class DepuracionMasivaBean extends AccionesManageBean implements Serializable {

	private static final long serialVersionUID = 1L;
	private List<String> numerosMoviles;

	@PostConstruct
	public void init() 
	{
		numerosMoviles = new ArrayList<String>();
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

	public List<String> getNumerosMoviles() 
	{
		return numerosMoviles;
	}

	public void setNumerosMoviles(List<String> numerosMoviles) 
	{
		this.numerosMoviles = numerosMoviles;
	}
}
