package pe.com.outfitpro.controller;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;

import pe.com.outfitpro.entity.MetodoPago;
import pe.com.outfitpro.service.IMetodoPagoService;

@Named
@RequestScoped
public class MetodoPagoController implements Serializable {

	private static final long serialVersionUID = 1L;
	@Inject
	private IMetodoPagoService service;
	private MetodoPago objeto;
	private List<MetodoPago> lista;
	
	@PostConstruct
	public void init() {
		this.lista = new ArrayList<MetodoPago>();
		this.objeto = new MetodoPago();
		this.listar();
	}
	
	public String nuevoMetodoPago() {
		this.setMetodoPago(new MetodoPago());
		return "metodoPago.xhtml";
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
	
	public void eliminar(MetodoPago objeto) {
		try {
			service.eliminar(objeto.getId());
			listar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}
	
	public MetodoPago getMetodoPago() {
		return objeto;
	}

	public void setMetodoPago(MetodoPago objeto) {
		this.objeto = objeto;
	}

	public List<MetodoPago> getLista() {
		return lista;
	}

	public void setLista(List<MetodoPago> lista) {
		this.lista = lista;
	}
}
