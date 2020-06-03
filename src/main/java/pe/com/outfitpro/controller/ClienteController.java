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

import pe.com.outfitpro.entity.Cliente;
import pe.com.outfitpro.entity.Ubigeo;
import pe.com.outfitpro.service.IClienteService;
import pe.com.outfitpro.service.IPerfilService;
import pe.com.outfitpro.service.IUbigeoService;

@Named
@RequestScoped
public class ClienteController implements Serializable {

	private static final long serialVersionUID = 1L;	
	@Inject
	private IClienteService srvCliente;
	@Inject
	private IUbigeoService srvUbigeo;
	@Inject
	private IPerfilService srvPerfil;
	
	private Cliente cliente;
	private Ubigeo ubigeo;

	private List<Cliente> listaCliente;
	private List<Ubigeo> listaUbigeo;

	@PostConstruct
	public void init() {
		this.cliente = new Cliente();
		this.ubigeo = new Ubigeo();
		this.listaCliente = new ArrayList<Cliente>();
		this.listaUbigeo = new ArrayList<Ubigeo>();
		this.listarClientes();
		this.listarUbigeos();
		this.cliente.setPerfil(srvPerfil.buscarPorNombre("Cliente"));
	}
	
	public String nuevo() {
		this.setCliente(new Cliente());
		this.getCliente().setNumAsesLibres(5);
		return "cliente.xhtml";
	}

	public String editar(Cliente cliente) {
		this.setCliente(cliente);
		return "cliente.xhtml";
	}

	public void limpiar() {
		this.init();
	}
	
	public void insertar() {
		try {
			srvCliente.insertar(cliente);
			limpiar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}

	public void eliminar(Cliente cliente) {
		try {
			srvCliente.eliminar(cliente.getId());
			listarClientes();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}

	public void listarClientes() {
		try {
			listaCliente = srvCliente.listar();
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
	
	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	
	public Ubigeo getUbigeo() {
		return ubigeo;
	}

	public void setUbigeo(Ubigeo ubigeo) {
		this.ubigeo = ubigeo;
	}

	public List<Cliente> getListaCliente() {
		return listaCliente;
	}

	public void setListaCliente(List<Cliente> listaCliente) {
		this.listaCliente = listaCliente;
	}

	public List<Ubigeo> getListaUbigeo() {
		return listaUbigeo;
	}

	public void setListaUbigeo(List<Ubigeo> listaUbigeo) {
		this.listaUbigeo = listaUbigeo;
	}

	/* Guardado de imagen */
	
	private Part file;
	private String folder = "D:\\Ricardo\\sts-workspace2\\OutfitPro\\src\\main\\webapp\\resources\\img\\clientes";

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
	        cliente.setImagen(tempFile.toPath().toString());
	    }
	    catch (IOException ex) {
	        ex.printStackTrace();
	    }
	}
}
