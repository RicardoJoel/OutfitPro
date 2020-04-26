package pe.com.outfitpro.controller;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;

import pe.com.outfitpro.entity.Perfil;
import pe.com.outfitpro.service.IPerfilService;

@Named
@RequestScoped
public class PerfilController implements Serializable {

	private static final long serialVersionUID = 1L;
	@Inject
	private IPerfilService service;
	private Perfil objeto;
	private List<Perfil> lista;
	
	@PostConstruct
	public void init() {
		this.lista = new ArrayList<Perfil>();
		this.objeto = new Perfil();
		this.listar();
	}
	
	public String nuevoPerfil() {
		this.setPerfil(new Perfil());
		return "perfil.xhtml";
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
	
	public void eliminar(Perfil objeto) {
		try {
			service.eliminar(objeto.getId());
			listar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}
	
	public Perfil getPerfil() {
		return objeto;
	}

	public void setPerfil(Perfil objeto) {
		this.objeto = objeto;
	}

	public List<Perfil> getLista() {
		return lista;
	}

	public void setLista(List<Perfil> lista) {
		this.lista = lista;
	}
}
