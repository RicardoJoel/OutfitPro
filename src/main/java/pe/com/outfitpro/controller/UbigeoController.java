package pe.com.outfitpro.controller;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;

import pe.com.outfitpro.entity.Ubigeo;
import pe.com.outfitpro.service.IUbigeoService;

@Named
@RequestScoped
public class UbigeoController implements Serializable {

	private static final long serialVersionUID = 1L;
	@Inject
	private IUbigeoService service;
	private Ubigeo objeto;
	private List<Ubigeo> lista;
	
	@PostConstruct
	public void init() {
		this.lista = new ArrayList<Ubigeo>();
		this.objeto = new Ubigeo();
		this.listar();
	}
	
	public String nuevoUbigeo() {
		this.setUbigeo(new Ubigeo());
		return "ubigeo.xhtml";
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
	
	public void eliminar(Ubigeo objeto) {
		try {
			service.eliminar(objeto.getId());
			listar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}
	
	public Ubigeo getUbigeo() {
		return objeto;
	}

	public void setUbigeo(Ubigeo objeto) {
		this.objeto = objeto;
	}

	public List<Ubigeo> getLista() {
		return lista;
	}

	public void setLista(List<Ubigeo> lista) {
		this.lista = lista;
	}
}
