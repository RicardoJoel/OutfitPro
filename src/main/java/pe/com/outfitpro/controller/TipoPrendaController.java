package pe.com.outfitpro.controller;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;

import pe.com.outfitpro.entity.TipoPrenda;
import pe.com.outfitpro.service.ITipoPrendaService;

@Named
@RequestScoped
public class TipoPrendaController implements Serializable {

	private static final long serialVersionUID = 1L;
	@Inject
	private ITipoPrendaService service;
	private TipoPrenda objeto;
	private List<TipoPrenda> lista;
	
	@PostConstruct
	public void init() {
		this.lista = new ArrayList<TipoPrenda>();
		this.objeto = new TipoPrenda();
		this.listar();
	}
	
	public String nuevoTipoPrenda() {
		this.setTipoPrenda(new TipoPrenda());
		return "tipoPrenda.xhtml";
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
	
	public void eliminar(TipoPrenda objeto) {
		try {
			service.eliminar(objeto.getId());
			listar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}
	
	public TipoPrenda getTipoPrenda() {
		return objeto;
	}

	public void setTipoPrenda(TipoPrenda objeto) {
		this.objeto = objeto;
	}

	public List<TipoPrenda> getLista() {
		return lista;
	}

	public void setLista(List<TipoPrenda> lista) {
		this.lista = lista;
	}
}
