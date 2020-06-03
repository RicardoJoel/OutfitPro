package pe.com.outfitpro.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;
import javax.servlet.http.Part;

import org.apache.commons.io.FilenameUtils;

import pe.com.outfitpro.entity.Asesor;
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
	private IUbigeoService srvUbigeo;
	@Inject
	private IPerfilService srvPerfil;
	
	private Asesor asesor;
	private Ubigeo ubigeo;

	private List<Asesor> listaAsesor;
	private List<Ubigeo> listaUbigeo;

	@PostConstruct
	public void init() {
		this.asesor = new Asesor();
		this.ubigeo = new Ubigeo();
		this.listaAsesor = new ArrayList<Asesor>();
		this.listaUbigeo = new ArrayList<Ubigeo>();
		this.listarAsesores();
		this.listarUbigeos();
		this.asesor.setPerfil(srvPerfil.buscarPorNombre("Asesor"));
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

	public List<Ubigeo> getListaUbigeo() {
		return listaUbigeo;
	}

	public void setListaUbigeo(List<Ubigeo> listaUbigeo) {
		this.listaUbigeo = listaUbigeo;
	}

	/* Guardado de imagen */
	
	private Part file;
	private String folder = "D:\\Ricardo\\sts-workspace2\\OutfitPro\\src\\main\\webapp\\resources\\img\\asesores";

	public Part getFile() {
		return file;
	}

	public void setFile(Part file) {
		this.file = file;
	}
	
	public void guardarFile() {
		if (file == null) return;
		try (InputStream input = file.getInputStream()) {
			String ext = FilenameUtils.getExtension(file.getName());
			File tempFile = File.createTempFile("asr", ext, new File(folder));
	        String fileName = tempFile.getName();
	        tempFile.delete();
			Files.copy(input, new File(folder, fileName).toPath());
	        asesor.setImagen(tempFile.toPath().toString());
	    }
	    catch (IOException ex) {
	        ex.printStackTrace();
	    }
	}
}
