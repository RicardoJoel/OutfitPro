package pe.com.outfitpro.controller;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;

import pe.com.outfitpro.entity.Compra;
import pe.com.outfitpro.service.ICompraService;

@Named
@RequestScoped
public class CompraController implements Serializable {

	private static final long serialVersionUID = 1L;
	@Inject
	private ICompraService service;
	private Compra objeto;
	private List<Compra> lista;
	
	@PostConstruct
	public void init() {
		this.lista = new ArrayList<Compra>();
		this.objeto = new Compra();
		this.listar();
	}
	
	public String nuevoCompra() {
		this.setCompra(new Compra());
		return "compra.xhtml";
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
	
	public void eliminar(Compra objeto) {
		try {
			service.eliminar(objeto.getId());
			listar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}
	
	public Compra getCompra() {
		return objeto;
	}

	public void setCompra(Compra objeto) {
		this.objeto = objeto;
	}

	public List<Compra> getLista() {
		return lista;
	}

	public void setLista(List<Compra> lista) {
		this.lista = lista;
	}
}
