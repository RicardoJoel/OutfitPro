package pe.com.outfitpro.controller;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;

import pe.com.outfitpro.entity.Detalle;
import pe.com.outfitpro.service.IDetalleService;

@Named
@RequestScoped
public class DetalleController implements Serializable {

	private static final long serialVersionUID = 1L;
	@Inject
	private IDetalleService service;
	private Detalle objeto;
	private List<Detalle> lista;
	
	@PostConstruct
	public void init() {
		this.lista = new ArrayList<Detalle>();
		this.objeto = new Detalle();
		this.listar();
	}
	
	public String nuevoDetalle() {
		this.setDetalle(new Detalle());
		return "detalle.xhtml";
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
	
	public void eliminar(Detalle objeto) {
		try {
			service.eliminar(objeto.getId());
			listar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}
	
	public Detalle getDetalle() {
		return objeto;
	}

	public void setDetalle(Detalle objeto) {
		this.objeto = objeto;
	}

	public List<Detalle> getLista() {
		return lista;
	}

	public void setLista(List<Detalle> lista) {
		this.lista = lista;
	}
}
