package pe.com.outfitpro.controller;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;

import pe.com.outfitpro.entity.Marca;
import pe.com.outfitpro.service.IMarcaService;

@Named
@RequestScoped
public class MarcaController implements Serializable {

	private static final long serialVersionUID = 1L;
	@Inject
	private IMarcaService service;
	private Marca objeto;
	private List<Marca> lista;
	
	@PostConstruct
	public void init() {
		this.lista = new ArrayList<Marca>();
		this.objeto = new Marca();
		this.listar();
	}
	
	public String nuevaMarca() {
		this.setMarca(new Marca());
		return "marca.xhtml";
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
	
	public void eliminar(Marca objeto) {
		try {
			service.eliminar(objeto.getCodigo());
			listar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}
	
	public Marca getMarca() {
		return objeto;
	}

	public void setMarca(Marca objeto) {
		this.objeto = objeto;
	}

	public List<Marca> getLista() {
		return lista;
	}

	public void setLista(List<Marca> lista) {
		this.lista = lista;
	}
}
