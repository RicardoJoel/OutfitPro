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
	private IPerfilService srvPerfil;
	private Perfil perfil;
	private List<Perfil> listaPerfil;
	
	@PostConstruct
	public void init() {
		this.perfil = new Perfil();
		this.listaPerfil = new ArrayList<Perfil>();
		this.listarPerfiles();
	}
	
	public String nuevo() {
		this.setPerfil(new Perfil());
		return "perfil.xhtml";
	}

	public String editar(Perfil perfil) {
		this.setPerfil(perfil);
		return "perfil.xhtml";
	}
	
	public void limpiar() {
		this.init();
	}
	
	public void insertar() {
		try {
			srvPerfil.insertar(perfil);
			limpiar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}	

	public void eliminar(Perfil perfil) {
		try {
			srvPerfil.eliminar(perfil.getId());
			listarPerfiles();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}
	
	public void listarPerfiles() {
		try {
			listaPerfil = srvPerfil.listar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}
	
	public Perfil getPerfil() {
		return perfil;
	}

	public void setPerfil(Perfil perfil) {
		this.perfil = perfil;
	}

	public List<Perfil> getListaPerfil() {
		return listaPerfil;
	}

	public void setListaPerfil(List<Perfil> listaPerfil) {
		this.listaPerfil = listaPerfil;
	}
}
