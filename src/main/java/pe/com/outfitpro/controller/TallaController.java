package pe.com.outfitpro.controller;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;

import pe.com.outfitpro.entity.Talla;
import pe.com.outfitpro.service.ITallaService;

@Named
@RequestScoped
public class TallaController implements Serializable {

	private static final long serialVersionUID = 1L;
	@Inject
	private ITallaService service;
	private Talla objeto;
	private List<Talla> lista;
	
	@PostConstruct
	public void init() {
		this.lista = new ArrayList<Talla>();
		this.objeto = new Talla();
		this.listar();
	}
	
	public String nuevoTalla() {
		this.setTalla(new Talla());
		return "talla.xhtml";
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
	
	public void eliminar(Talla objeto) {
		try {
			service.eliminar(objeto.getId());
			listar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}
	
	public Talla getTalla() {
		return objeto;
	}

	public void setTalla(Talla objeto) {
		this.objeto = objeto;
	}

	public List<Talla> getLista() {
		return lista;
	}

	public void setLista(List<Talla> lista) {
		this.lista = lista;
	}
}
