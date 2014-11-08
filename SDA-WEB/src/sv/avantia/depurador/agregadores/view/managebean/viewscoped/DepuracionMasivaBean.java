package sv.avantia.depurador.agregadores.view.managebean.viewscoped;

import java.io.InputStream;
import java.io.Serializable;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.primefaces.event.FileUploadEvent;
import org.primefaces.model.UploadedFile;

import sv.avantia.depurador.agregadores.hilo.GestionarParametrizacion;
import sv.avantia.depurador.agregadores.jdbc.BdEjecucion;
import sv.avantia.depurador.agregadores.utils.AccionesManageBean;

@ManagedBean
@ViewScoped
public class DepuracionMasivaBean extends AccionesManageBean implements Serializable 
{
	
	private static final long serialVersionUID = 1L;
	
	/**
	 * Instancia de la lista que tendra alojada los numeros para la depuracion
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * */
	private List<String> numerosMoviles;
	
	/**
	 * Instancia del objeto que contendra el archivo excel subido por el usuario del sistema
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * */
	private UploadedFile file;

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
	 * Meodo que se encarga de subir el archivo de Excel y procesarlo de acuerdo
	 * al tipo que se ha subido que solo puede ser XLX o XLSX
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @param event
	 *            {@link FileUploadEvent}
	 * @return void
	 * */
	public void handleFileUpload(FileUploadEvent event) 
	{
        try 
        {
            setFile(event.getFile());
            logger.info("Archivo recibido " + getFile().getFileName());
            
            if(getFile().getFileName().endsWith(".xls"))
            	readExcelFile(getFile().getInputstream());
            
            if(getFile().getFileName().endsWith(".xlsx"))
            	readExcelxFile(getFile().getInputstream());
            
            accionDepuracion();
        } 
        catch (Exception ex) 
        {
        	logger.error("Error en el sistema de depuracion masiva por archivo ", ex);
            lanzarMensajeError("Error", "Problemas al subir el archivo", ex);
        }
    }
	
	/**
	 * Metodo para leer archivos XLX y obtener los numeros de telefono en una
	 * lista de String
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @param fileInputStream {@link InputStream}
	 * @return {@link Void}
	 * @throws Exception producida por instanciar HSSFWorkbook, POIFSFileSystem
	 * */
	private void readExcelFile(InputStream fileInputStream) throws Exception {
		POIFSFileSystem fsFileSystem = new POIFSFileSystem(fileInputStream);
		HSSFWorkbook workBook = new HSSFWorkbook(fsFileSystem);
		HSSFSheet hssfSheet = workBook.getSheetAt(0);
		Iterator<?> rowIterator = hssfSheet.rowIterator();
		while (rowIterator.hasNext()) 
		{
			double doubleCellValue = ((HSSFCell) ((HSSFRow) rowIterator.next()).getCell(0)).getNumericCellValue();
			DecimalFormat dFormat = new DecimalFormat("###########");
			getNumerosMoviles().add(dFormat.format(doubleCellValue));
		}
	}

	/**
	 * Metodo para leer archivos XLSX y obtener los numeros de telefono en una
	 * lista de String
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @param  fileInputStream {@link InputStream}
	 * @return {@link Void}
	 * @throws Exception producida por instanciar XSSFWorkbook
	 * */
	private void readExcelxFile(InputStream fileInputStream) throws Exception {
		XSSFWorkbook workbook = new XSSFWorkbook(fileInputStream);
		XSSFSheet sheet = workbook.getSheetAt(0);
		Iterator<org.apache.poi.ss.usermodel.Row> rowIterator = sheet.iterator();
		while (rowIterator.hasNext()) 
		{
			double doubleCellValue = ((Row) rowIterator.next()).getCell(0).getNumericCellValue();
			DecimalFormat dFormat = new DecimalFormat("###########");
			getNumerosMoviles().add(dFormat.format(doubleCellValue));
		}
	}

	/**
	 * Metodo que depurará un numero de telefono en los agregadores
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @return void
	 * */
	private void accionDepuracion() 
	{
		logger.info("Iniciando la depuración Masiva por archivo");
		try 
		{
			//obtener el numero
			if(getNumerosMoviles().size()>0)
			{
				setEjecucion(new BdEjecucion());
				
				//TODO: se necesita importar el jar para que se lea esta clase
				//gestionar la logica de la depuracion
				GestionarParametrizacion gestion = new GestionarParametrizacion();
				gestion.depuracionBajaMasiva(getNumerosMoviles(), "ARCHIVO", false);
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
			setNumerosMoviles(null);
			setEjecucion(null);
			lanzarMensajeInformacion("Flujo", "Se termino de procesar exitosamente");
		}
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
	 * @param numerosMoviles {@link List} numeros moviles
	 * @return {@link Void}
	 */
	private void setNumerosMoviles(List<String> numerosMoviles) 
	{
		this.numerosMoviles = numerosMoviles;
	}
	
	/**
	 * getter
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @return {@link UploadedFile} archivo recibido
	 */
	private UploadedFile getFile() 
	{
        return file;
    }
 
	/**
	 * setter
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @param file
	 *            en archivo enviado por el usuario
	 * @return {@link Void}
	 */
    private void setFile(UploadedFile file) 
    {
        this.file = file;
    }
}