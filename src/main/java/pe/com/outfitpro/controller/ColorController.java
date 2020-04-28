package pe.com.outfitpro.controller;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;

import pe.com.outfitpro.entity.Color;
import pe.com.outfitpro.service.IColorService;

@Named
@RequestScoped
public class ColorController implements Serializable {

	private static final long serialVersionUID = 1L;
	@Inject
	private IColorService service;
	private Color objeto;
	private List<Color> lista;
	
	@PostConstruct
	public void init() {
		this.lista = new ArrayList<Color>();
		this.objeto = new Color();
		this.listar();
	}
	
	public String nuevoColor() {
		this.setColor(new Color());
		return "color.xhtml";
	}

	public void insertar() {
		try {
			objeto.setIdUsuarioCreacion(1);
			service.insertar(objeto);
			limpiar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}
	
	public void listar() {
		try {
			lista = service.listar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}
	
	public void limpiar() {
		this.init();
	}
	
	public void eliminar(Color objeto) {
		try {
			service.eliminar(objeto.getId());
			listar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}
	
	public Color getColor() {
		return objeto;
	}

	public void setColor(Color objeto) {
		this.objeto = objeto;
	}

	public List<Color> getLista() {
		return lista;
	}

	public void setLista(List<Color> lista) {
		this.lista = lista;
	}
}
