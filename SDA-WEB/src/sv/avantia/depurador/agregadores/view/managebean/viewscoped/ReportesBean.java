package sv.avantia.depurador.agregadores.view.managebean.viewscoped;


import java.util.HashMap;
import java.util.Map;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import sv.avantia.depurador.agregadores.utils.AccionesReportesBean;

@ManagedBean
@ViewScoped
public class ReportesBean extends AccionesReportesBean {
	private final String COMPILE_FILE_NAME = "report6";

	@Override
	protected String getCompileFileName() {
		return COMPILE_FILE_NAME;
	}

	@Override
	protected Map<String, Object> getReportParameters() {
		Map<String, Object> reportParameters = new HashMap<String, Object>();
		reportParameters.put("nombre",
						"Claro depurador de agregadores a continuacion se muestran los numeros preocesados:");
		reportParameters.put("numeros", "50370170722 \n 50370172230");
		return reportParameters;
	}

	public void execute() {
		try 
		{
			prepareReport();
		} 
		catch (Exception e) {
			System.err.println("error*********************************");
		}
	}

}