package pe.com.outfitpro.controller;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;

import pe.com.outfitpro.entity.Descuento;
import pe.com.outfitpro.service.IDescuentoService;

@Named
@RequestScoped
public class DescuentoController implements Serializable {

	private static final long serialVersionUID = 1L;
	@Inject
	private IDescuentoService service;
	private Descuento objeto;
	private List<Descuento> lista;
	
	@PostConstruct
	public void init() {
		this.lista = new ArrayList<Descuento>();
		this.objeto = new Descuento();
		this.listar();
	}
	
	public String nuevoDescuento() {
		this.setDescuento(new Descuento());
		return "descuento.xhtml";
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
	
	public void eliminar(Descuento objeto) {
		try {
			service.eliminar(objeto.getId());
			listar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}
	
	public Descuento getDescuento() {
		return objeto;
	}

	public void setDescuento(Descuento objeto) {
		this.objeto = objeto;
	}

	public List<Descuento> getLista() {
		return lista;
	}

	public void setLista(List<Descuento> lista) {
		this.lista = lista;
	}
}
