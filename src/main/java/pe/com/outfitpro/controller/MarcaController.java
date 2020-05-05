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
	private IMarcaService srvMarca;
	private Marca marca;
	private List<Marca> listaMarca;
	
	@PostConstruct
	public void init() {
		this.marca = new Marca();
		this.listaMarca = new ArrayList<Marca>();
		this.listarMarcas();
	}
	
	public String nuevo() {
		this.setMarca(new Marca());
		return "marca.xhtml";
	}

	public String editar(Marca marca) {
		this.setMarca(marca);
		return "marca.xhtml";
	}

	public void limpiar() {
		this.init();
	}
	
	public void insertar() {
		try {
			srvMarca.insertar(marca);
			limpiar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}

	public void eliminar(Marca marca) {
		try {
			srvMarca.eliminar(marca.getId());
			listarMarcas();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}

	public void listarMarcas() {
		try {
			listaMarca = srvMarca.listar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}

	public Marca getMarca() {
		return marca;
	}

	public void setMarca(Marca marca) {
		this.marca = marca;
	}

	public List<Marca> getListaMarca() {
		return listaMarca;
	}

	public void setListaMarca(List<Marca> listaMarca) {
		this.listaMarca = listaMarca;
	}
	
}
