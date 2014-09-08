package sv.avantia.depurador.agregadores.utils;

import java.io.Serializable;
import java.util.List;

import javax.faces.component.UIComponent;

import org.primefaces.component.menuitem.MenuItem;
import org.primefaces.model.DefaultMenuModel;
import org.primefaces.model.MenuModel;
import org.primefaces.component.submenu.Submenu;

/**
 * Clase para generar el {@link MenuModel}
 * 
 * @author Edwin Mejia - Avantia Consultores
 * @version 1.0
 * */
public class MenuControllerT implements Serializable
{
	private static final long serialVersionUID = 1L;
	private MenuModel model;
	protected String key = "MENU";

	/**
	 * Constructor que Arma el Menu
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @throws Exception
	 * */
	public MenuControllerT(List<MenuT> menus) throws Exception
	{
		try
		{
			 setModel(new DefaultMenuModel());
			 
			 for(MenuT menu: menus)
			 {
				  // Verificando 1)
					Submenu submenu = createPadre(menu, true);
					
					 //verificamos si el padre pudo ser creado
					if(submenu != null)
					{
					   getModel().addSubmenu(submenu);
					}
					else
					{
					    //Verificando 2) verificamos si es un padre que tiene otro padre pero no url   
						Submenu submenuChild = createPadre(menu, false);
						
						//Tenemos que buscar al padre para agregarle el submenu
						Submenu submenuPadre = (Submenu) findItemMenu(getModel().getContents(),getId(menu.getIdMenuPadre()));
						if(submenuChild != null)
						{
							submenuPadre.getChildren().add(submenuChild);
						}
						else
						{
							submenuPadre.getChildren().add(createMenuItem(menu));
						}
					}				
			 }
		}
		catch(Exception e)
		{
			throw e;
		}
	}


	/**
	 * Metodo que genera un contenedor padre
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @param menu
	 * @param validarPadre
	 * @return {@link Submenu}
	 * @throws Exception
	 * */
	private Submenu createPadre(MenuT menu, boolean validarPadre) throws Exception 
	{
		// verificamos si tiene padre o url
		if ((menu.getIdMenuPadre() == null) == validarPadre && (menu.getUrl() == null)) {
			  return createSubMenu(menu);
		}
		return null;
	}

	/**
	 * Metodo que crea el SubMenu para el padre
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @param menu
	 * @return {@link Submenu}
	 * @throws Exception
	 * */
	private Submenu createSubMenu(MenuT menu) throws Exception 
	{
		Submenu submenu = new Submenu();
		try
		{
			submenu.setLabel(menu.getNombre());
			submenu.setId(getId(menu.getId()));
			return submenu;
		}
		catch(Exception e)
		{
			throw new Exception("Error al crear submenu");
		}
	}

	/**
	 * Metodo en el que buscara la opcion dentro de la lista suministrada esto
	 * para saber donde se agregara el subMenu creado
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @param opciones
	 * @param idOpcion
	 * @return {@link UIComponent}
	 * */
	private UIComponent findItemMenu(List<UIComponent> opciones, String idOpcion) 
	{	
		UIComponent component = null;
		if (!opciones.isEmpty()) 
		{
			for (UIComponent i : opciones) 
			{
			  if(i.getId() != null)
			  {	
				if (i.getId().equals(idOpcion)) 
				{
					return i;
				} 
				else 
				{
					if (i.getChildCount() > 0) 
					{
						component = findItemMenu(i.getChildren(), idOpcion);
					}
				}
			  }
			}
		}
		return component;
	}

	/**
	 * Metodo para crear un menu item desde los datos suministrados por el
	 * objeto {@link MenuT}
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @param menu
	 * @return {@link MenuItem}
	 * */
	private MenuItem createMenuItem(MenuT menu) throws Exception
	{
		MenuItem item = new MenuItem();
		try 
		{
			item = new MenuItem();
			item.setValue(menu.getNombre());
			item.setUrl(menu.getUrl());
			return item;
		}
		catch(Exception e)
		{
			throw new Exception("Error al crear Item");
		}
	}
	
	/**
	 * Metodo que genera el Id para para la identificacion del objeto creado
	 * dentro del modelo del menu
	 * 
	 * @author Edwin Mejia - Avantia Consultores
	 * @param valor
	 * @return {@link String}
	 * */
	private String getId(String valor){
		return key.concat(valor);
	}

	public MenuModel getModel() {
		return model;
	}

	public void setModel(MenuModel model) {
		this.model = model;
	}	
}