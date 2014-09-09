package sv.avantia.depurador.agregadores.view.managebean.viewscoped;

import java.io.IOException;
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

import sv.avantia.depurador.agregadores.utils.AccionesManageBean;

@ManagedBean
@ViewScoped
public class DepuracionMasivaBean extends AccionesManageBean implements Serializable {

	private static final long serialVersionUID = 1L;
	private UploadedFile file;
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
            if(getFile().getFileName().endsWith(".xlx"))
            {
            	readExcelFile(getFile().getInputstream());
            	for (String numero : getNumerosMoviles())
            	{
            		System.out.println(numero);
            	}
            }
            
            if(getFile().getFileName().endsWith(".xlsx"))
            {
            	readExcelxFile(getFile().getInputstream());
            	for (String numero : getNumerosMoviles())
            	{
            		System.out.println(numero);
            	}
            }
            lanzarMensajeInformacion("Flujo", "Se termino de procesar exitosamente");
        } 
        catch (IOException ex) 
        {
            lanzarMensajeError("Error", "Regada al subir el archivo", ex);
        }
    }
	
	/**
	 * Metodo para leer archivos XLX y obtener los numeros de telefono en una
	 * lista de String
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @param InputStream
	 * @return void
	 * @throws IOException
	 * */
	private void readExcelFile(InputStream fileInputStream) throws IOException {
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
	 * @param InputStream
	 * @return void
	 * @throws IOException
	 * */
	private void readExcelxFile(InputStream fileInputStream) throws IOException {
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

	public List<String> getNumerosMoviles() 
	{
		return numerosMoviles;
	}

	public void setNumerosMoviles(List<String> numerosMoviles) 
	{
		this.numerosMoviles = numerosMoviles;
	}
	
	private UploadedFile getFile() 
	{
        return file;
    }
 
    private void setFile(UploadedFile file) 
    {
        this.file = file;
    }
}
