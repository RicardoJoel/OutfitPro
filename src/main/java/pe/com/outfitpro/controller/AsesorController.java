package pe.com.outfitpro.controller;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;

import pe.com.outfitpro.entity.Asesor;
import pe.com.outfitpro.entity.Perfil;
import pe.com.outfitpro.entity.Ubigeo;
import pe.com.outfitpro.service.IAsesorService;
import pe.com.outfitpro.service.IPerfilService;
import pe.com.outfitpro.service.IUbigeoService;

@Named
@RequestScoped
public class AsesorController implements Serializable {

	private static final long serialVersionUID = 1L;	
	@Inject
	private IAsesorService srvAsesor;
	@Inject
	private IPerfilService srvPerfil;
	@Inject
	private IUbigeoService srvUbigeo;
	
	private Asesor asesor;
	private Perfil perfil;
	private Ubigeo ubigeo;

	private List<Asesor> listaAsesor;
	private List<Perfil> listaPerfil;
	private List<Ubigeo> listaUbigeo;

	@PostConstruct
	public void init() {
		this.asesor = new Asesor();
		this.perfil = new Perfil();
		this.ubigeo = new Ubigeo();
		this.listaAsesor = new ArrayList<Asesor>();
		this.listaPerfil = new ArrayList<Perfil>();
		this.listaUbigeo = new ArrayList<Ubigeo>();
		this.listarAsesores();
		this.listarPerfiles();
		this.listarUbigeos();
	}
	
	public String nuevo() {
		this.setAsesor(new Asesor());
		return "asesor.xhtml";
	}

	public String editar(Asesor asesor) {
		this.setAsesor(asesor);
		return "asesor.xhtml";
	}

	public void limpiar() {
		this.init();
	}
	
	public void insertar() {
		try {
			srvAsesor.insertar(asesor);
			limpiar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}

	public void eliminar(Asesor asesor) {
		try {
			srvAsesor.eliminar(asesor.getId());
			listarAsesores();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}

	public void listarAsesores() {
		try {
			listaAsesor = srvAsesor.listar();
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
	
	public void listarUbigeos() {
		try {
			listaUbigeo = srvUbigeo.listar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}
	
	public Asesor getAsesor() {
		return asesor;
	}

	public void setAsesor(Asesor asesor) {
		this.asesor = asesor;
	}

	public Perfil getPerfil() {
		return perfil;
	}

	public void setPerfil(Perfil perfil) {
		this.perfil = perfil;
	}

	public Ubigeo getUbigeo() {
		return ubigeo;
	}

	public void setUbigeo(Ubigeo ubigeo) {
		this.ubigeo = ubigeo;
	}

	public List<Asesor> getListaAsesor() {
		return listaAsesor;
	}

	public void setListaAsesor(List<Asesor> listaAsesor) {
		this.listaAsesor = listaAsesor;
	}

	public List<Perfil> getListaPerfil() {
		return listaPerfil;
	}

	public void setListaPerfil(List<Perfil> listaPerfil) {
		this.listaPerfil = listaPerfil;
	}

	public List<Ubigeo> getListaUbigeo() {
		return listaUbigeo;
	}

	public void setListaUbigeo(List<Ubigeo> listaUbigeo) {
		this.listaUbigeo = listaUbigeo;
	}
	
}
