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
	private IComercioService srvComercio;
	private Comercio comercio;
	private List<Comercio> listaComercio;
	
	@PostConstruct
	public void init() {
		this.comercio = new Comercio();
		this.listaComercio = new ArrayList<Comercio>();
		this.listarComercios();
	}
	
	public String nuevo() {
		this.setComercio(new Comercio());
		return "comercio.xhtml";
	}

	public String editar(Comercio comercio) {
		this.setComercio(comercio);
		return "comercio.xhtml";
	}

	public void limpiar() {
		this.init();
	}
	
	public void insertar() {
		try {
			srvComercio.insertar(comercio);
			limpiar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}

	public void eliminar(Comercio comercio) {
		try {
			srvComercio.eliminar(comercio.getId());
			listarComercios();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}

	public void listarComercios() {
		try {
			listaComercio = srvComercio.listar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}
	
	public Comercio getComercio() {
		return comercio;
	}

	public void setComercio(Comercio comercio) {
		this.comercio = comercio;
	}

	public List<Comercio> getListaComercio() {
		return listaComercio;
	}

	public void setListaComercio(List<Comercio> listaComercio) {
		this.listaComercio = listaComercio;
	}
	
}
