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
	private ITipoPrendaService srvTipoPrenda;
	private TipoPrenda tipoPrenda;
	private List<TipoPrenda> listaTipoPrenda;
	
	@PostConstruct
	public void init() {
		this.tipoPrenda = new TipoPrenda();
		this.listaTipoPrenda = new ArrayList<TipoPrenda>();
		this.listarTipoPrendas();
	}
	
	public String nuevo() {
		this.setTipoPrenda(new TipoPrenda());
		return "tipoPrenda.xhtml";
	}

	public String editar(TipoPrenda tipoPrenda) {
		this.setTipoPrenda(tipoPrenda);
		return "tipoPrenda.xhtml";
	}

	public void limpiar() {
		this.init();
	}
	
	public void insertar() {
		try {
			srvTipoPrenda.insertar(tipoPrenda);
			limpiar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}
	
	public void eliminar(TipoPrenda tipoPrenda) {
		try {
			srvTipoPrenda.eliminar(tipoPrenda.getId());
			listarTipoPrendas();
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

	public TipoPrenda getTipoPrenda() {
		return tipoPrenda;
	}

	public void setTipoPrenda(TipoPrenda tipoPrenda) {
		this.tipoPrenda = tipoPrenda;
	}

	public List<TipoPrenda> getListaTipoPrenda() {
		return listaTipoPrenda;
	}

	public void setListaTipoPrenda(List<TipoPrenda> listaTipoPrenda) {
		this.listaTipoPrenda = listaTipoPrenda;
	}
}
