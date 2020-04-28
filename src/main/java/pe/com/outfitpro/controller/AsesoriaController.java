package pe.com.outfitpro.controller;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;

import pe.com.outfitpro.entity.Asesoria;
import pe.com.outfitpro.service.IAsesoriaService;

@Named
@RequestScoped
public class AsesoriaController implements Serializable {

	private static final long serialVersionUID = 1L;
	@Inject
	private IAsesoriaService service;
	private Asesoria objeto;
	private List<Asesoria> lista;
	
	@PostConstruct
	public void init() {
		this.lista = new ArrayList<Asesoria>();
		this.objeto = new Asesoria();
		this.listar();
	}
	
	public String nuevoAsesoria() {
		this.setAsesoria(new Asesoria());
		return "asesoria.xhtml";
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
	
	public void eliminar(Asesoria objeto) {
		try {
			service.eliminar(objeto.getId());
			listar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}
	
	public Asesoria getAsesoria() {
		return objeto;
	}

	public void setAsesoria(Asesoria objeto) {
		this.objeto = objeto;
	}

	public List<Asesoria> getLista() {
		return lista;
	}

	public void setLista(List<Asesoria> lista) {
		this.lista = lista;
	}
}
