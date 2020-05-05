package pe.com.outfitpro.controller;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;

import pe.com.outfitpro.entity.Cliente;
import pe.com.outfitpro.entity.Perfil;
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
	private IPerfilService srvPerfil;
	@Inject
	private IUbigeoService srvUbigeo;
	
	private Cliente cliente;
	private Perfil perfil;
	private Ubigeo ubigeo;

	private List<Cliente> listaCliente;
	private List<Perfil> listaPerfil;
	private List<Ubigeo> listaUbigeo;

	@PostConstruct
	public void init() {
		this.cliente = new Cliente();
		this.perfil = new Perfil();
		this.ubigeo = new Ubigeo();
		this.listaCliente = new ArrayList<Cliente>();
		this.listaPerfil = new ArrayList<Perfil>();
		this.listaUbigeo = new ArrayList<Ubigeo>();
		this.listarClientes();
		this.listarPerfiles();
		this.listarUbigeos();
	}
	
	public String nuevo() {
		this.setCliente(new Cliente());
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
	
	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
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

	public List<Cliente> getListaCliente() {
		return listaCliente;
	}

	public void setListaCliente(List<Cliente> listaCliente) {
		this.listaCliente = listaCliente;
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
