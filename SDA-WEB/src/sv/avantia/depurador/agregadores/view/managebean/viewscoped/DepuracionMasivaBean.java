package sv.avantia.depurador.agregadores.view.managebean.viewscoped;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import org.primefaces.event.FileUploadEvent;
import org.primefaces.model.UploadedFile;

import sv.avantia.depurador.agregadores.utils.AccionesManageBean;

@ManagedBean
@ViewScoped
public class DepuracionMasivaBean extends AccionesManageBean implements Serializable {

	private static final long serialVersionUID = 1L;
	private UploadedFile file;
	private List<String> numerosMoviles;

	@PostConstruct
	public void init() 
	{
		numerosMoviles = new ArrayList<String>();
	}
     
	
	public void uploadFile(FileUploadEvent event) {
        byte[] file = event.getFile().getContents();

        System.out.println("MADE IT INTO FILE UPLOAD !!! ");
   }
	
    public void upload() 
    {
    	System.out.println("entre a obtener el archivo");
        if(file != null) 
        {
        	accionDepuacion();
            lanzarMensajeInformacion("Archivo:", "Se subio el archivo exitosamente");
        }
    }
    
	public void accionDepuacion() 
	{
		try 
		{
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
	
	public UploadedFile getFile() 
	{
        return file;
    }
 
    public void setFile(UploadedFile file) 
    {
    	System.out.println("Recibiendo....");
        this.file = file;
    }
}
