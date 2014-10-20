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

import sv.avantia.depurador.agregadores.entidades.Agregadores;
import sv.avantia.depurador.agregadores.entidades.Pais;
import sv.avantia.depurador.agregadores.hilo.ConsultaAgregadorPorHilo;
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
				//consultar la parametrización
				for (Pais pais : obtenerParmetrizacion()) 
				{
					if(pais.getEstado()==1)
					{
						for (Agregadores agregador : pais.getAgregadores()) 
						{
							if(agregador.getEstado()==1)
							{
								if(!agregador.getMetodos().isEmpty())
								{
									//abrir un hilo pr cada agregador parametrizados
									ConsultaAgregadorPorHilo hilo = new ConsultaAgregadorPorHilo();
									hilo.setMoviles(getNumerosMoviles());
									hilo.setAgregador(agregador);
									hilo.setTipoDepuracion("ARCHIVO");
									hilo.setUsuarioSistema(getUsuarioSessionMB().getUsuarioSession());
									hilo.start();
								}
							}
						}
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
		return (List<Pais>)(List<?>) getEjecucion().listData("FROM SDA_PAISES WHERE STATUS = 1 AND CODIGO = '" + getNumerosMoviles().get(0).substring(0, 3) + "'");
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