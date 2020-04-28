package pe.com.outfitpro.controller;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;

import pe.com.outfitpro.entity.Preferencia;
import pe.com.outfitpro.service.IPreferenciaService;

@Named
@RequestScoped
public class PreferenciaController implements Serializable {

	private static final long serialVersionUID = 1L;
	@Inject
	private IPreferenciaService service;
	private Preferencia objeto;
	private List<Preferencia> lista;
	
	@PostConstruct
	public void init() {
		this.lista = new ArrayList<Preferencia>();
		this.objeto = new Preferencia();
		this.listar();
	}
	
	public String nuevoPreferencia() {
		this.setPreferencia(new Preferencia());
		return "preferencia.xhtml";
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
	
	public void eliminar(Preferencia objeto) {
		try {
			service.eliminar(objeto.getId());
			listar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}
	
	public Preferencia getPreferencia() {
		return objeto;
	}

	public void setPreferencia(Preferencia objeto) {
		this.objeto = objeto;
	}

	public List<Preferencia> getLista() {
		return lista;
	}

	public void setLista(List<Preferencia> lista) {
		this.lista = lista;
	}
}
