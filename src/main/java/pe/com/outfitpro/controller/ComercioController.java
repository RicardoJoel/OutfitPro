package pe.com.outfitpro.controller;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;

import pe.com.outfitpro.entity.Comercio;
import pe.com.outfitpro.service.IComercioService;

@Named
@RequestScoped
public class ComercioController implements Serializable {

	private static final long serialVersionUID = 1L;
	@Inject
	private IComercioService service;
	private Comercio objeto;
	private List<Comercio> lista;
	
	@PostConstruct
	public void init() {
		this.lista = new ArrayList<Comercio>();
		this.objeto = new Comercio();
		this.listar();
	}
	
	public String nuevoComercio() {
		this.setComercio(new Comercio());
		return "comercio.xhtml";
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
	
	public void eliminar(Comercio objeto) {
		try {
			service.eliminar(objeto.getId());
			listar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}
	
	public Comercio getComercio() {
		return objeto;
	}

	public void setComercio(Comercio objeto) {
		this.objeto = objeto;
	}

	public List<Comercio> getLista() {
		return lista;
	}

	public void setLista(List<Comercio> lista) {
		this.lista = lista;
	}
}
