package sv.avantia.depurador.agregadores.utils;

import java.io.Serializable;

/**
 * Objeto con los datos para la creacion del Model en el {@link MenuControllerT}
 * 
 * @author Edwin Mejia - Avantia Consultores
 * @version 1.0
 * */
public class MenuT implements Serializable 
{
	private static final long serialVersionUID = 1L;
	private String id;
	private String nombre;
	private String idMenuPadre;
	private String url;

	public MenuT(String id, String nombre, String idMenuPadre, String url) 
	{
		this.id = id;
		this.nombre = nombre;
		this.idMenuPadre = idMenuPadre;
		this.url = url;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getIdMenuPadre() {
		return idMenuPadre;
	}

	public void setIdMenuPadre(String idMenuPadre) {
		this.idMenuPadre = idMenuPadre;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
}
