package pe.com.outfitpro.controller;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;

import pe.com.outfitpro.entity.Prenda;
import pe.com.outfitpro.service.IPrendaService;

@Named
@RequestScoped
public class PrendaController implements Serializable {

	private static final long serialVersionUID = 1L;
	@Inject
	private IPrendaService service;
	private Prenda objeto;
	private List<Prenda> lista;
	
	@PostConstruct
	public void init() {
		this.lista = new ArrayList<Prenda>();
		this.objeto = new Prenda();
		this.listar();
	}
	
	public String nuevoPrenda() {
		this.setPrenda(new Prenda());
		return "prenda.xhtml";
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
	
	public void eliminar(Prenda objeto) {
		try {
			service.eliminar(objeto.getId());
			listar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}
	
	public Prenda getPrenda() {
		return objeto;
	}

	public void setPrenda(Prenda objeto) {
		this.objeto = objeto;
	}

	public List<Prenda> getLista() {
		return lista;
	}

	public void setLista(List<Prenda> lista) {
		this.lista = lista;
	}
}
