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
	private IUbigeoService srvUbigeo;
	private Ubigeo ubigeo;
	private List<Ubigeo> listaUbigeo;
	
	@PostConstruct
	public void init() {
		this.ubigeo = new Ubigeo();
		this.listaUbigeo = new ArrayList<Ubigeo>();
		this.listarUbigeos();
	}
	
	public String nuevo() {
		this.setUbigeo(new Ubigeo());
		return "ubigeo.xhtml";
	}

	public String editar(Ubigeo ubigeo) {
		this.setUbigeo(ubigeo);
		return "ubigeo.xhtml";
	}
	
	public void limpiar() {
		this.init();
	}
	
	public void insertar() {
		try {
			srvUbigeo.insertar(ubigeo);
			limpiar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}
	
	public void eliminar(Ubigeo ubigeo) {
		try {
			srvUbigeo.eliminar(ubigeo.getId());
			listarUbigeos();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}
	
	public void listarUbigeos() {
		try {
			listaUbigeo = srvUbigeo.listar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}

	public Ubigeo getUbigeo() {
		return ubigeo;
	}

	public void setUbigeo(Ubigeo ubigeo) {
		this.ubigeo = ubigeo;
	}

	public List<Ubigeo> getListaUbigeo() {
		return listaUbigeo;
	}

	public void setListaUbigeo(List<Ubigeo> listaUbigeo) {
		this.listaUbigeo = listaUbigeo;
	}
}
