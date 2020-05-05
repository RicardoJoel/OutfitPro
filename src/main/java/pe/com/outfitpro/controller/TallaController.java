package pe.com.outfitpro.controller;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;

import pe.com.outfitpro.entity.Talla;
import pe.com.outfitpro.entity.TipoPrenda;
import pe.com.outfitpro.service.ITallaService;
import pe.com.outfitpro.service.ITipoPrendaService;

@Named
@RequestScoped
public class TallaController implements Serializable {

	private static final long serialVersionUID = 1L;
	@Inject
	private ITallaService srvTalla;
	@Inject
	private ITipoPrendaService srvTipoPrenda;
	
	private Talla talla;
	private TipoPrenda tipoPrenda;
	
	private List<Talla> listaTalla;
	private List<TipoPrenda> listaTipoPrenda;
	
	@PostConstruct
	public void init() {
		this.talla = new Talla();
		this.tipoPrenda = new TipoPrenda();
		this.listaTalla = new ArrayList<Talla>();
		this.listaTipoPrenda = new ArrayList<TipoPrenda>();
		this.listarTallas();
		this.listarTipoPrendas();
	}
	
	public String nuevo() {
		this.setTalla(new Talla());
		return "talla.xhtml";
	}

	public String editar(Talla talla) {
		this.setTalla(talla);
		return "talla.xhtml";
	}

	public void limpiar() {
		this.init();
	}
	
	public void insertar() {
		try {
			srvTalla.insertar(talla);
			limpiar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}

	public void eliminar(Talla talla) {
		try {
			srvTalla.eliminar(talla.getId());
			listarTallas();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}

	public void listarTallas() {
		try {
			listaTalla = srvTalla.listar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}
	
	public void listarTipoPrendas() {
		try {
			listaTipoPrenda = srvTipoPrenda.listar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}

	public Talla getTalla() {
		return talla;
	}

	public void setTalla(Talla talla) {
		this.talla = talla;
	}

	public TipoPrenda getTipoPrenda() {
		return tipoPrenda;
	}

	public void setTipoPrenda(TipoPrenda tipoPrenda) {
		this.tipoPrenda = tipoPrenda;
	}

	public List<Talla> getListaTalla() {
		return listaTalla;
	}

	public void setListaTalla(List<Talla> listaTalla) {
		this.listaTalla = listaTalla;
	}

	public List<TipoPrenda> getListaTipoPrenda() {
		return listaTipoPrenda;
	}

	public void setListaTipoPrenda(List<TipoPrenda> listaTipoPrenda) {
		this.listaTipoPrenda = listaTipoPrenda;
	}
}
