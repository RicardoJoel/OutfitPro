package pe.com.outfitpro.controller;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;

import pe.com.outfitpro.entity.Cliente;
import pe.com.outfitpro.entity.Color;
import pe.com.outfitpro.entity.Marca;
import pe.com.outfitpro.entity.Preferencia;
import pe.com.outfitpro.entity.Talla;
import pe.com.outfitpro.entity.TipoPrenda;
import pe.com.outfitpro.service.IClienteService;
import pe.com.outfitpro.service.IColorService;
import pe.com.outfitpro.service.IMarcaService;
import pe.com.outfitpro.service.IPreferenciaService;
import pe.com.outfitpro.service.ITallaService;
import pe.com.outfitpro.service.ITipoPrendaService;

@Named
@RequestScoped
public class PreferenciaController implements Serializable {

	private static final long serialVersionUID = 1L;
	@Inject
	private IPreferenciaService srvPreferencia;
	@Inject
	private ITipoPrendaService srvTipoPrenda;
	@Inject
	private IClienteService srvCliente;
	@Inject
	private ITallaService srvTalla;
	@Inject
	private IColorService srvColor;
	@Inject
	private IMarcaService srvMarca;
	
	private Preferencia preferencia;
	private TipoPrenda tipoPrenda;
	private Cliente cliente;
	private Talla talla;
	private Color color;
	private Marca marca;
	
	private List<Preferencia> listaPreferencia;
	private List<TipoPrenda> listaTipoPrenda;
	private List<Cliente> listaCliente;
	private List<Talla> listaTalla;
	private List<Color> listaColor;
	private List<Marca> listaMarca;
	
	@PostConstruct
	public void init() {
		this.preferencia = new Preferencia();
		this.tipoPrenda = new TipoPrenda();
		this.cliente = new Cliente();
		this.talla = new Talla();
		this.color = new Color();
		this.marca = new Marca();
		this.listaPreferencia = new ArrayList<Preferencia>();
		this.listaTipoPrenda = new ArrayList<TipoPrenda>();
		this.listaCliente = new ArrayList<Cliente>();
		this.listaTalla = new ArrayList<Talla>();
		this.listaColor = new ArrayList<Color>();
		this.listaMarca = new ArrayList<Marca>();
		this.listarPreferencias();
		this.listarTipoPrendas();
		this.listarClientes();
		this.listarTallas();
		this.listarColores();
		this.listarMarcas();
	}
	
	public String nuevo() {
		this.setPreferencia(new Preferencia());
		return "preferencia.xhtml";
	}

	public String editar(Preferencia preferencia) {
		this.setPreferencia(preferencia);
		return "preferencia.xhtml";
	}

	public void limpiar() {
		this.init();
	}
	
	public void insertar() {
		try {
			srvPreferencia.insertar(preferencia);
			limpiar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}

	public void eliminar(Preferencia preferencia) {
		try {
			srvPreferencia.eliminar(preferencia.getId());
			listarPreferencias();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}

	public void listarPreferencias() {
		try {
			listaPreferencia = srvPreferencia.listar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}
	
	public void listarTipoPrendas() {
		try {
			listaTipoPrenda = srvTipoPrenda.listar();
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
	
	public void listarTallas() {
		try {
			listaTalla = srvTalla.listar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}
	
	public void listarColores() {
		try {
			listaColor = srvColor.listar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}
	
	public void listarMarcas() {
		try {
			listaMarca = srvMarca.listar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}
	
	public Preferencia getPreferencia() {
		return preferencia;
	}

	public void setPreferencia(Preferencia preferencia) {
		this.preferencia = preferencia;
	}

	public TipoPrenda getTipoPrenda() {
		return tipoPrenda;
	}

	public void setTipoPrenda(TipoPrenda tipoPrenda) {
		this.tipoPrenda = tipoPrenda;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public Talla getTalla() {
		return talla;
	}

	public void setTalla(Talla talla) {
		this.talla = talla;
	}

	public Color getColor() {
		return color;
	}

	public void setColor(Color color) {
		this.color = color;
	}

	public Marca getMarca() {
		return marca;
	}

	public void setMarca(Marca marca) {
		this.marca = marca;
	}

	public List<Preferencia> getListaPreferencia() {
		return listaPreferencia;
	}

	public void setListaPreferencia(List<Preferencia> listaPreferencia) {
		this.listaPreferencia = listaPreferencia;
	}

	public List<TipoPrenda> getListaTipoPrenda() {
		return listaTipoPrenda;
	}

	public void setListaTipoPrenda(List<TipoPrenda> listaTipoPrenda) {
		this.listaTipoPrenda = listaTipoPrenda;
	}

	public List<Cliente> getListaCliente() {
		return listaCliente;
	}

	public void setListaCliente(List<Cliente> listaCliente) {
		this.listaCliente = listaCliente;
	}

	public List<Talla> getListaTalla() {
		return listaTalla;
	}

	public void setListaTalla(List<Talla> listaTalla) {
		this.listaTalla = listaTalla;
	}

	public List<Color> getListaColor() {
		return listaColor;
	}

	public void setListaColor(List<Color> listaColor) {
		this.listaColor = listaColor;
	}

	public List<Marca> getListaMarca() {
		return listaMarca;
	}

	public void setListaMarca(List<Marca> listaMarca) {
		this.listaMarca = listaMarca;
	}

}
