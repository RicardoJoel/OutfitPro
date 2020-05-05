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
	private IColorService srvColor;
	private Color color;
	private List<Color> listaColor;
	
	@PostConstruct
	public void init() {
		this.color = new Color();
		this.listaColor = new ArrayList<Color>();
		this.listarColores();
	}
	
	public String nuevo() {
		this.setColor(new Color());
		return "color.xhtml";
	}

	public String editar(Color color) {
		this.setColor(color);
		return "color.xhtml";
	}

	public void limpiar() {
		this.init();
	}
	
	public void insertar() {
		try {
			srvColor.insertar(color);
			limpiar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}

	public void eliminar(Color color) {
		try {
			srvColor.eliminar(color.getId());
			listarColores();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}

	public void listarColores() {
		try {
			listaColor = srvColor.listar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}

	public Color getColor() {
		return color;
	}

	public void setColor(Color color) {
		this.color = color;
	}

	public List<Color> getListaColor() {
		return listaColor;
	}

	public void setListaColor(List<Color> listaColor) {
		this.listaColor = listaColor;
	}
}
