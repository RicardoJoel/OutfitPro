package pe.com.outfitpro.controller;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;

import pe.com.outfitpro.entity.Descuento;
import pe.com.outfitpro.service.IDescuentoService;

@Named
@RequestScoped
public class DescuentoController implements Serializable {

	private static final long serialVersionUID = 1L;
	@Inject
	private IDescuentoService srvDescuento;
	private Descuento descuento;
	private List<Descuento> listaDescuento;
	
	@PostConstruct
	public void init() {
		this.descuento = new Descuento();
		this.listaDescuento = new ArrayList<Descuento>();
		this.listarDescuentos();
	}
	
	public String nuevo() {
		this.setDescuento(new Descuento());
		return "descuento.xhtml";
	}

	public String editar(Descuento descuento) {
		this.setDescuento(descuento);
		return "descuento.xhtml";
	}

	public void limpiar() {
		this.init();
	}
	
	public void insertar() {
		try {
			srvDescuento.insertar(descuento);
			limpiar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}

	public void eliminar(Descuento descuento) {
		try {
			srvDescuento.eliminar(descuento.getId());
			listarDescuentos();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}

	public void listarDescuentos() {
		try {
			listaDescuento = srvDescuento.listar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}
	
	public Descuento getDescuento() {
		return descuento;
	}

	public void setDescuento(Descuento descuento) {
		this.descuento = descuento;
	}

	public List<Descuento> getListaDescuento() {
		return listaDescuento;
	}

	public void setListaDescuento(List<Descuento> listaDescuento) {
		this.listaDescuento = listaDescuento;
	}

}
