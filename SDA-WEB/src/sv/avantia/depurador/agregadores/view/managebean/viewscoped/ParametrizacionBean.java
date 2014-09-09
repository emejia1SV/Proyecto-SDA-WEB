package sv.avantia.depurador.agregadores.view.managebean.viewscoped;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;

import org.primefaces.event.FlowEvent;

@ManagedBean
@ViewScoped
public class ParametrizacionBean implements Serializable {

	private static final long serialVersionUID = 1L;
	private String tab="x";
	private final String  TAB_="tab";
    private final String  TAB_1="1";
    private final String  TAB_2="2";
    private final String  TAB_3="3";
    private final String  TAB_4="4";
	 
	/**
	 * Metodo {@link PostConstruct}
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * */
	@PostConstruct
	public void init() 
	{
		
	}
	
	/**
	 * implementar cambio de tas
	 * */
	public String onFlowProcessx(FlowEvent event){
        FacesContext fx = FacesContext.getCurrentInstance();
        String tabGo = event.getNewStep();
        String tabBack = event.getOldStep();
        tabGo = tabGo.replace(TAB_, "");
        tabBack = tabBack.replace(TAB_, "");
        int d =  getTiempoTranscurrido(new Date());
        /////del tab 1 al tab 2
        if(tabBack.equals(TAB_1)&&tabGo.equals(TAB_2)){
           if(d >=50) {
             tab=TAB_3;  
             //doClean();
             return TAB_+TAB_3; 
           }if(d>=100){
             tab=TAB_4;  
             //seguimientoManagedBean2.doClean();
             return TAB_+TAB_4;  
           }else{
            return event.getNewStep();
           }
           
        }
        /*/////del tab 2 al tab 3
        if(tabBack.equals(TAB_2)&&tabGo.equals(TAB_3)){
            if(d<= 21) {
            getGenerateMessage("error", "labels_curso_confirm_seguimiento1", FacesMessage.SEVERITY_WARN, fx);
           
            return event.getOldStep();
            }else{
              tab=TAB_3;  
              doClean();
              return event.getNewStep();
            }     
        }
        /////del tab 3 al tab 4
        if(tabBack.equals(TAB_3)&&tabGo.equals(TAB_4)){
           if (d > 21 && d <= 90) {
            getGenerateMessage("error", "labels_curso_confirm_seguimiento2", FacesMessage.SEVERITY_WARN, fx);
            return event.getOldStep();
           }else{
              tab=TAB_4;  
              seguimientoManagedBean2.doClean();
              return event.getNewStep(); 
           }         
        }if(tabBack.equals(TAB_4)&&tabGo.equals(TAB_5)){
           if(d>90&&d<=180){
              getGenerateMessage("error", "labels_curso_confirm_seguimiento3", FacesMessage.SEVERITY_WARN, fx);
              return event.getOldStep();
           }else{
             tab=TAB_4;  
             seguimientoManagedBean2.doClean();
             return event.getNewStep();   
           } 
        }*/
    
        tab=event.getNewStep();
        tab=tabGo.replace(TAB_,"");
        return event.getNewStep();
    }
    
	public Integer getTiempoTranscurrido(Date fecha) {
        SimpleDateFormat fm = new SimpleDateFormat("dd/MM/yyyy");
        Long date = new Date().getTime() - fecha.getTime();
        date = (date / (3600 * 24 * 1000));
        return date.intValue();
    }
}
