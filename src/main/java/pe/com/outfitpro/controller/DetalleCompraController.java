package pe.com.outfitpro.controller;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;

import pe.com.outfitpro.entity.DetalleCompra;
import pe.com.outfitpro.entity.Prenda;
import pe.com.outfitpro.entity.Compra;
import pe.com.outfitpro.service.IDetalleCompraService;
import pe.com.outfitpro.service.IPrendaService;
import pe.com.outfitpro.service.ICompraService;

@Named
@RequestScoped
public class DetalleCompraController implements Serializable {

	private static final long serialVersionUID = 1L;
	@Inject
	private IDetalleCompraService srvDetalleCompra;
	@Inject
	private ICompraService srvCompra;
	@Inject
	private IPrendaService srvPrenda;
	
	private DetalleCompra detalleCompra;
	private Compra compra;
	private Prenda prenda;
	
	private List<DetalleCompra> listaDetalleCompra;
	private List<Compra> listaCompra;
	private List<Prenda> listaPrenda;
	
	@PostConstruct
	public void init() {
		this.detalleCompra = new DetalleCompra();
		this.compra = new Compra();
		this.prenda = new Prenda();
		this.listaDetalleCompra = new ArrayList<DetalleCompra>();
		this.listaCompra = new ArrayList<Compra>();
		this.listaPrenda = new ArrayList<Prenda>();
		this.listarDetalleCompras();
		this.listarCompras();
		this.listarPrendas();
	}
	
	public String nuevo() {
		this.setDetalleCompra(new DetalleCompra());
		return "detalleCompra.xhtml";
	}

	public String editar(DetalleCompra detalleCompra) {
		this.setDetalleCompra(detalleCompra);
		return "detalleCompra.xhtml";
	}

	public void limpiar() {
		this.init();
	}
	
	public void insertar() {
		try {
			srvDetalleCompra.insertar(detalleCompra);
			limpiar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}

	public void eliminar(DetalleCompra detalleCompra) {
		try {
			srvDetalleCompra.eliminar(detalleCompra.getId());
			listarDetalleCompras();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}

	public void listarDetalleCompras() {
		try {
			listaDetalleCompra = srvDetalleCompra.listar();
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
	
	public void listarPrendas() {
		try {
			listaPrenda = srvPrenda.listar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}
	
	public DetalleCompra getDetalleCompra() {
		return detalleCompra;
	}

	public void setDetalleCompra(DetalleCompra detalleCompra) {
		this.detalleCompra = detalleCompra;
	}

	public Compra getCompra() {
		return compra;
	}

	public void setCompra(Compra compra) {
		this.compra = compra;
	}

	public Prenda getPrenda() {
		return prenda;
	}

	public void setPrenda(Prenda prenda) {
		this.prenda = prenda;
	}

	public List<DetalleCompra> getListaDetalleCompra() {
		return listaDetalleCompra;
	}

	public void setListaDetalleCompra(List<DetalleCompra> listaDetalleCompra) {
		this.listaDetalleCompra = listaDetalleCompra;
	}

	public List<Compra> getListaCompra() {
		return listaCompra;
	}

	public void setListaCompra(List<Compra> listaCompra) {
		this.listaCompra = listaCompra;
	}

	public List<Prenda> getListaPrenda() {
		return listaPrenda;
	}

	public void setListaPrenda(List<Prenda> listaPrenda) {
		this.listaPrenda = listaPrenda;
	}
	
}
