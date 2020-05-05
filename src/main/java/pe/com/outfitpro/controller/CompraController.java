package pe.com.outfitpro.controller;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;

import pe.com.outfitpro.entity.Compra;
import pe.com.outfitpro.entity.Cliente;
import pe.com.outfitpro.service.ICompraService;
import pe.com.outfitpro.service.IClienteService;

@Named
@RequestScoped
public class CompraController implements Serializable {

	private static final long serialVersionUID = 1L;
	@Inject
	private ICompraService srvCompra;
	@Inject
	private IClienteService srvCliente;
	
	private Compra compra;
	private Cliente cliente;
	
	private List<Compra> listaCompra;
	private List<Cliente> listaCliente;
	
	@PostConstruct
	public void init() {
		this.compra = new Compra();
		this.cliente = new Cliente();
		this.listaCompra = new ArrayList<Compra>();
		this.listaCliente = new ArrayList<Cliente>();
		this.listarCompras();
		this.listarClientes();
	}
	
	public String nuevo() {
		this.setCompra(new Compra());
		return "compra.xhtml";
	}

	public String editar(Compra compra) {
		this.setCompra(compra);
		return "compra.xhtml";
	}

	public void limpiar() {
		this.init();
	}
	
	public void insertar() {
		try {
			srvCompra.insertar(compra);
			limpiar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}

	public void eliminar(Compra compra) {
		try {
			srvCompra.eliminar(compra.getId());
			listarCompras();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}

	public void listarCompras() {
		try {
			listaCompra = srvCompra.listar();
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
	
	public Compra getCompra() {
		return compra;
	}

	public void setCompra(Compra compra) {
		this.compra = compra;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public List<Compra> getListaCompra() {
		return listaCompra;
	}

	public void setListaCompra(List<Compra> listaCompra) {
		this.listaCompra = listaCompra;
	}

	public List<Cliente> getListaCliente() {
		return listaCliente;
	}

	public void setListaCliente(List<Cliente> listaCliente) {
		this.listaCliente = listaCliente;
	}
	
}
