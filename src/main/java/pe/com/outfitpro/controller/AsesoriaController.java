package pe.com.outfitpro.controller;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;

import pe.com.outfitpro.entity.Asesoria;
import pe.com.outfitpro.entity.Cliente;
import pe.com.outfitpro.entity.Asesor;
import pe.com.outfitpro.service.IAsesoriaService;
import pe.com.outfitpro.service.IClienteService;
import pe.com.outfitpro.service.IAsesorService;

@Named
@RequestScoped
public class AsesoriaController implements Serializable {

	private static final long serialVersionUID = 1L;
	@Inject
	private IAsesoriaService srvAsesoria;
	@Inject
	private IClienteService srvCliente;
	@Inject
	private IAsesorService srvAsesor;
	
	private Asesoria asesoria;
	private Cliente cliente;
	private Asesor asesor;
	
	private List<Asesoria> listaAsesoria;
	private List<Cliente> listaCliente;
	private List<Asesor> listaAsesor;
	
	@PostConstruct
	public void init() {
		this.asesoria = new Asesoria();
		this.cliente = new Cliente();
		this.asesor = new Asesor();
		this.listaAsesoria = new ArrayList<Asesoria>();
		this.listaCliente = new ArrayList<Cliente>();
		this.listaAsesor = new ArrayList<Asesor>();
		this.listarAsesorias();
		this.listarClientes();
		this.listarAsesores();
	}
	
	public String nuevo() {
		this.setAsesoria(new Asesoria());
		return "asesoria.xhtml";
	}

	public String editar(Asesoria asesoria) {
		this.setAsesoria(asesoria);
		return "asesoria.xhtml";
	}

	public void limpiar() {
		this.init();
	}
	
	public void insertar() {
		try {
			srvAsesoria.insertar(asesoria);
			limpiar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}

	public void eliminar(Asesoria asesoria) {
		try {
			srvAsesoria.eliminar(asesoria.getId());
			listarAsesorias();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}

	public void listarAsesorias() {
		try {
			listaAsesoria = srvAsesoria.listar();
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
	
	public void listarAsesores() {
		try {
			listaAsesor = srvAsesor.listar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}
	
	public Asesoria getAsesoria() {
		return asesoria;
	}

	public void setAsesoria(Asesoria asesoria) {
		this.asesoria = asesoria;
	}
	
	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	
	public Asesor getAsesor() {
		return asesor;
	}

	public void setAsesor(Asesor asesor) {
		this.asesor = asesor;
	}

	public List<Asesoria> getListaAsesoria() {
		return listaAsesoria;
	}

	public void setListaAsesoria(List<Asesoria> listaAsesoria) {
		this.listaAsesoria = listaAsesoria;
	}
	
	public List<Cliente> getListaCliente() {
		return listaCliente;
	}

	public void setListaCliente(List<Cliente> listaCliente) {
		this.listaCliente = listaCliente;
	}
	
	public List<Asesor> getListaAsesor() {
		return listaAsesor;
	}

	public void setListaAsesor(List<Asesor> listaAsesor) {
		this.listaAsesor = listaAsesor;
	}

}
