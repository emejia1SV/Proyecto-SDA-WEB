package sv.avantia.depurador.agregadores.view.managebean.viewscoped;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.PhaseId;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.export.JRCsvExporter;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.export.JRRtfExporter;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;
import net.sf.jasperreports.engine.export.ooxml.JRXlsxExporter;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;
import net.sf.jasperreports.export.SimplePdfExporterConfiguration;
import net.sf.jasperreports.export.SimpleXlsxReportConfiguration;

import org.apache.commons.io.FileUtils;
import org.primefaces.model.DefaultStreamedContent;
import org.primefaces.model.StreamedContent;

import sv.avantia.depurador.agregadores.entidades.LogDepuracion;
import sv.avantia.depurador.agregadores.utils.AccionesManageBean;

@ManagedBean
@ViewScoped
public class ReportesBean extends AccionesManageBean implements Serializable {

	private static final long serialVersionUID = 1L;
	private List<LogDepuracion> depuraciones;
	
	@PostConstruct
	public void init(){
		
	}
	
	@SuppressWarnings("unchecked")
	public void llenarTablaLogs() {
		try 
		{
			setDepuraciones(((List<LogDepuracion>) (List<?>) getEjecucion().listData("FROM SDA_LOG_DEPURACION")));
			for (LogDepuracion log : getDepuraciones()) {
				System.out.println("conocer si carga o no");
				System.out.println(log.getMetodo().getAgregador().getPais().getNombre());
			}
		} 
		catch (Exception e) 
		{
			lanzarMensajeError("Error:", "No se pudo cargar la tabla de paises", e);
		}
	}
	
	/**
	 * @return the depuraciones
	 */
	public List<LogDepuracion> getDepuraciones() {
		return depuraciones;
	}


	/**
	 * @param depuraciones the depuraciones to set
	 */
	public void setDepuraciones(List<LogDepuracion> depuraciones) {
		this.depuraciones = depuraciones;
	}


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//private final String COMPILE_FILE_NAME = "report6";

	/*@Override
	protected String getCompileFileName() {
		return COMPILE_FILE_NAME; 
	}

	@Override
	protected Map<String, Object> getReportParameters() {
		Map<String, Object> reportParameters = new HashMap<String, Object>();
		reportParameters.put("nombre" , "Claro depurador de agregadores a continuacion se muestran los numeros preocesados:");
		reportParameters.put("numeros", "50370170722 \n 50370172230");
		return reportParameters;
	}*/

	public void execute() {
		try {
			
			showReport();
			/*Map parameters = new HashMap();
		    parameters.put("TITULO", "PAISES");
		    parameters.put("FECHA", new java.util.Date());
			JasperReport report;
			report = JasperCompileManager.compileReport("C:\\Users\\Edwin\\Documents\\documentacion Agregadores claro\\reportes\\DepuraracionUnitariaReport.jrxml");
			JasperPrint print = JasperFillManager.fillReport(report, parameters);
			
			
			//JasperFillManager.fillReportToFile("C:\\Users\\Edwin\\Documents\\documentacion Agregadores claro\\reportes\\DepuraracionUnitariaReport.jasper", null, new JREmptyDataSource(2));
			  
			//JasperPrint jasperPrint = (JasperPrint)JRLoader.loadObjectFromFile("C:\\Users\\Edwin\\Documents\\documentacion Agregadores claro\\reportes\\DepuraracionUnitariaReport.jrprint");
			  HttpServletResponse httpServletResponse=(HttpServletResponse)FacesContext.getCurrentInstance().getExternalContext().getResponse();  
		      httpServletResponse.addHeader("Content-disposition", "attachment; filename=DepuraracionUnitariaReport.pdf");  
		       ServletOutputStream servletOutputStream=httpServletResponse.getOutputStream();  
		       JasperExportManager.exportReportToPdfStream(print, servletOutputStream);  
		       FacesContext.getCurrentInstance().responseComplete();
			//fill();
			//pdf();
			//xlsx();
*/			
		     /* Map parameters = new HashMap();
		      parameters.put("TITULO", "PAISES");
		      parameters.put("FECHA", new java.util.Date());
		      JasperReport report = JasperCompileManager.compileReport("C:\\Users\\Edwin\\Documents\\documentacion Agregadores claro\\reportes\\DepuraracionUnitariaReport.jrxml");
		      JasperPrint print = JasperFillManager.fillReport(report, parameters);
		      // Exporta el informe a PDF
		      JasperExportManager.exportReportToPdfFile(print, "C:\\Users\\Edwin\\Documents\\documentacion Agregadores claro\\reportes\\DepuraracionUnitariaReport.pdf");
		      //Para visualizar el pdf directamente desde java
		      JasperViewer.viewReport(print, false);*/
		    }
		    catch (Exception e) {
		      e.printStackTrace();
		    }
		
/*		try 
		{
			super.prepareReport();
		} 
		catch (Exception e) {
			System.err.println("error*********************************");
		}*/
	}
	
	public void fill() throws JRException
	{
	  long start = System.currentTimeMillis();
	  
	  //first JasperPrint object is generated and saved as .jrprint object in the build/reports directory
	  JasperFillManager.fillReportToFile("C:\\Users\\Edwin\\Documents\\documentacion Agregadores claro\\reportes\\DepuraracionUnitariaReport.jasper", null, new JREmptyDataSource(2));
	    
	  System.err.println("Filling time : " + (System.currentTimeMillis() - start));
	}
	
	public void pdf() throws JRException
	{
	  long start = System.currentTimeMillis();
	  
	  List<JasperPrint> jasperPrintList = new ArrayList<JasperPrint>();
	  jasperPrintList.add((JasperPrint)JRLoader.loadObjectFromFile("C:\\Users\\Edwin\\Documents\\documentacion Agregadores claro\\reportes\\DepuraracionUnitariaReport.jrprint"));

	  JRPdfExporter exporter = new JRPdfExporter();

	  exporter.setExporterInput(SimpleExporterInput.getInstance(jasperPrintList));
	  exporter.setExporterOutput(new SimpleOutputStreamExporterOutput("C:\\Users\\Edwin\\Documents\\documentacion Agregadores claro\\reportes\\BatchExportReport.pdf"));
	  SimplePdfExporterConfiguration configuration = new SimplePdfExporterConfiguration();
	  configuration.setCreatingBatchModeBookmarks(true);
	  exporter.setConfiguration(configuration);

	  exporter.exportReport();

	  
	  
	  
	  System.err.println("PDF creation time : " + (System.currentTimeMillis() - start));
	}
	
	public void xlsx() throws JRException
	{
	  long start = System.currentTimeMillis();
	  List<JasperPrint> jasperPrintList = new ArrayList<JasperPrint>();
	  jasperPrintList.add((JasperPrint)JRLoader.loadObjectFromFile("C:\\Users\\Edwin\\Documents\\documentacion Agregadores claro\\reportes\\DepuraracionUnitariaReport.jrprint"));

	  JRXlsxExporter exporter = new JRXlsxExporter();

	  exporter.setExporterInput(SimpleExporterInput.getInstance(jasperPrintList));
	  exporter.setExporterOutput(new SimpleOutputStreamExporterOutput("C:\\Users\\Edwin\\Documents\\documentacion Agregadores claro\\reportes\\BatchExportReport.xlsx"));
	  
	  SimpleXlsxReportConfiguration configuration = new SimpleXlsxReportConfiguration();
	  configuration.setOnePagePerSheet(false);
	  exporter.setConfiguration(configuration);

	  exporter.exportReport();

	  System.err.println("XLSX creation time : " + (System.currentTimeMillis() - start));
	}
	

	
	@SuppressWarnings({ "rawtypes", "unchecked", "deprecation" })
	public void test() {

		Map parameters = new HashMap();
	    parameters.put("TITULO", "PAISES");
	    parameters.put("FECHA", new java.util.Date());
		
	    JasperReport report;
		try {
			report = JasperCompileManager.compileReport("C:\\Users\\Edwin\\Documents\\documentacion Agregadores claro\\reportes\\DepuraracionUnitariaReport.jrxml");
			JasperPrint print = JasperFillManager.fillReport(report, parameters);
			
			// Exporta el informe a PDF
			String destFileNamePdf = "C:\\Users\\Edwin\\Documents\\documentacion Agregadores claro\\reportes\\reporte1.pdf";
			
			// Creación del PDF
			JasperExportManager.exportReportToPdfFile(print, destFileNamePdf);
			
			// Otras importaciones
			// Exporta el informe a HTML
			JasperExportManager.exportReportToHtmlFile(print, destFileNamePdf);
			
			// Exporta el informe a excel
			OutputStream ouputStream = new FileOutputStream(new File("C:\\Users\\Edwin\\Documents\\documentacion Agregadores claro\\reportes\\catalog.xls"));
			ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
			JRXlsExporter exporterXLS = new JRXlsExporter();
			exporterXLS.setParameter(JRXlsExporterParameter.JASPER_PRINT, print);
			exporterXLS.setParameter(JRXlsExporterParameter.OUTPUT_STREAM,byteArrayOutputStream);
			exporterXLS.exportReport();
			ouputStream.write(byteArrayOutputStream.toByteArray());
			ouputStream.flush();
			ouputStream.close();
			
			// Exporta el informe a csv
			String destFileNamePdf2 = "C:\\Users\\Edwin\\Documents\\documentacion Agregadores claro\\reportes\\reporte1.csv";
			JRCsvExporter exporter = new JRCsvExporter();
			File destFile = new File(destFileNamePdf2);
			exporter.setParameter(JRExporterParameter.JASPER_PRINT, print);
			exporter.setParameter(JRExporterParameter.OUTPUT_FILE_NAME,	destFile.toString());
			exporter.exportReport();
			
			// Exporta el informe a rtf
			OutputStream ouputStream2 = new FileOutputStream(new File("C:\\Users\\Edwin\\Documents\\documentacion Agregadores claro\\reportes\\catalog.rtf"));
			ByteArrayOutputStream byteArrayOutputStream2 = new ByteArrayOutputStream();
			JRRtfExporter exporter2 = new JRRtfExporter();
			exporter2.setParameter(JRExporterParameter.JASPER_PRINT, print);
			exporter2.setParameter(JRExporterParameter.OUTPUT_STREAM, ouputStream2);
			exporter2.exportReport();
			ouputStream2.write(byteArrayOutputStream2.toByteArray());
			ouputStream2.flush();
			ouputStream2.close();

		} catch (Exception e) {
			System.out.println("Error" + e);
		}
	}
	

	/**
	 * 
	 * @param URL
	 * @throws Exception
	 */
	public synchronized void showReport() throws Exception{
		Map<String, Object> parameters = new HashMap<String, Object>();
	    parameters.put("TITULO", "PAISES");
	    parameters.put("FECHA", new java.util.Date());
		
		
		InputStream         in                  = null;
		JasperReport        reporte             = null;
		JRPdfExporter       exporterPDF         = null;
		JasperPrint         jasperPrint         = null;
		ServletOutputStream servletOutputStream = null;
		try{
			System.out.println("Imprimiendo Reporte...");
			reporte = JasperCompileManager.compileReport("C:\\Users\\Edwin\\Documents\\documentacion Agregadores claro\\reportes\\DepuraracionUnitariaReport.jrxml");
			jasperPrint = JasperFillManager.fillReport(reporte, parameters, new JREmptyDataSource());
			
			exporterPDF = new JRPdfExporter();	
			
			//jasperPrint=JasperFillManager.fillReport(reporte, parameters,new JREmptyDataSource());
			
			/*if(this.tipoDataSource==1)
				jasperPrint=JasperFillManager.fillReport(reporte, parameters,new JREmptyDataSource());
			if(this.tipoDataSource==2)
				jasperPrint = JasperFillManager.fillReport(reporte, parameters,new JRBeanCollectionDataSource(this.collecion));*/
			
			exporterPDF.setParameter(JRExporterParameter.JASPER_PRINT,	jasperPrint);
			servletOutputStream = obtenerServletOutputStream("Content-disposition", "DepuraracionUnitariaReport.pdf");
			exporterPDF.setParameter(JRExporterParameter.OUTPUT_STREAM,	servletOutputStream);
			exporterPDF.exportReport();		
			FacesContext.getCurrentInstance().getApplication().getStateManager().saveView(FacesContext.getCurrentInstance());
			FacesContext.getCurrentInstance().responseComplete();			
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			
			cerrarServletOutputStream(servletOutputStream);
			
			servletOutputStream = null;
			if(in!=null){
				in.close();
				in = null;
			}
			reporte             = null;
			exporterPDF         = null;
			jasperPrint         = null;
		}		
	}
	
	 public StreamedContent getStream() throws IOException {
	        FacesContext context = FacesContext.getCurrentInstance();

	        if (context.getCurrentPhaseId() == PhaseId.RENDER_RESPONSE) {
	            // So, we're rendering the HTML. Return a stub StreamedContent so that it will generate right URL.
	            return new DefaultStreamedContent();
	        } else {
	            // So, browser is requesting the media. Return a real StreamedContent with the media bytes.
	            
	            File reporte = new File("C:\\Users\\Edwin\\Documents\\documentacion Agregadores claro\\reportes\\reporte1.pdf");
	            return new DefaultStreamedContent(new ByteArrayInputStream(FileUtils.readFileToByteArray(reporte)) );
	        }
	    }
	
	/**
	 * 
	 * @param content
	 * @param fileAttachment
	 * @return
	 * @throws Exception
	 */
	private ServletOutputStream obtenerServletOutputStream(String content, String fileAttachment) throws Exception{
	      ServletOutputStream servletOutputStream;
		  try{		
			 HttpServletResponse httpServletResponse = (HttpServletResponse) FacesContext.getCurrentInstance().getExternalContext().getResponse();
			 httpServletResponse.setContentType("application/pdf");
			 httpServletResponse.addHeader(content, (true?"inline":"attachment")+"; filename="+ fileAttachment);			 
			 servletOutputStream = httpServletResponse.getOutputStream();
			} catch (Exception e) {
				throw new Exception("Error en la clase ReportFactory: "+ e.getMessage(), e.getCause());
			}
			return servletOutputStream;
	}
	
	/**
	 * 
	 * @param servletOutputStream
	 * @throws Exception
	 */
	private void cerrarServletOutputStream(ServletOutputStream servletOutputStream) throws Exception {
		try {			
			if(servletOutputStream!=null){
				servletOutputStream.flush();
		    	servletOutputStream.close();
		    }
		} catch (Exception e) {
			 throw new Exception("Error en la clase ReportFactory: "+ e.getMessage(), e.getCause());
		}    
	}

}