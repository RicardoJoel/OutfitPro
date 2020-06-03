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

import pe.com.outfitpro.entity.Color;
import pe.com.outfitpro.entity.Comercio;
import pe.com.outfitpro.entity.Descuento;
import pe.com.outfitpro.entity.Marca;
import pe.com.outfitpro.entity.Prenda;
import pe.com.outfitpro.entity.Talla;
import pe.com.outfitpro.entity.TipoPrenda;
import pe.com.outfitpro.service.IColorService;
import pe.com.outfitpro.service.IComercioService;
import pe.com.outfitpro.service.IDescuentoService;
import pe.com.outfitpro.service.IMarcaService;
import pe.com.outfitpro.service.IPrendaService;
import pe.com.outfitpro.service.ITallaService;
import pe.com.outfitpro.service.ITipoPrendaService;

@Named
@RequestScoped
public class PrendaController implements Serializable {

	private static final long serialVersionUID = 1L;
	@Inject
	private IPrendaService srvPrenda;
	@Inject
	private ITallaService srvTalla;
	@Inject
	private IColorService srvColor;
	@Inject
	private IMarcaService srvMarca;
	@Inject
	private IComercioService srvComercio;
	@Inject
	private IDescuentoService srvDescuento;
	@Inject
	private ITipoPrendaService srvTipoPrenda;
	
	private Prenda prenda;
	private Talla talla;
	private Color color;
	private Marca marca;
	private Comercio comercio;
	private Descuento descuento;
	private TipoPrenda tipoPrenda;
	
	private List<Prenda> listaPrenda;
	private List<Talla> listaTalla;
	private List<Color> listaColor;
	private List<Marca> listaMarca;
	private List<Comercio> listaComercio;
	private List<Descuento> listaDescuento;
	private List<TipoPrenda> listaTipoPrenda;
	
	@PostConstruct
	public void init() {
		this.prenda = new Prenda();
		this.talla = new Talla();
		this.color = new Color();
		this.marca = new Marca();
		this.comercio = new Comercio();
		this.descuento = new Descuento();
		this.tipoPrenda = new TipoPrenda();
		this.listaPrenda = new ArrayList<Prenda>();
		this.listaTalla = new ArrayList<Talla>();
		this.listaColor = new ArrayList<Color>();
		this.listaMarca = new ArrayList<Marca>();
		this.listaComercio = new ArrayList<Comercio>();
		this.listaDescuento = new ArrayList<Descuento>();
		this.listaTipoPrenda = new ArrayList<TipoPrenda>();
		this.listarPrendas();
		this.listarTallas();
		this.listarColores();
		this.listarMarcas();
		this.listarComercios();
		this.listarDescuentos();
		this.listarTipoPrendas();
	}
	
	public String nuevo() {
		this.setPrenda(new Prenda());
		return "prenda.xhtml";
	}

	public String editar(Prenda prenda) {
		this.setPrenda(prenda);
		return "prenda.xhtml";
	}

	public void limpiar() {
		this.init();
	}
	
	public void insertar() {
		try {
			srvPrenda.insertar(prenda);
			limpiar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}

	public void eliminar(Prenda prenda) {
		try {
			srvPrenda.eliminar(prenda.getId());
			listarPrendas();
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

	public void listarComercios() {
		try {
			listaComercio = srvComercio.listar();
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

	public void listarTipoPrendas() {
		try {
			listaTipoPrenda = srvTipoPrenda.listar();
		}
		catch (Exception ex) {
			ex.getMessage();
		}
	}
	
	public Prenda getPrenda() {
		return prenda;
	}

	public void setPrenda(Prenda prenda) {
		this.prenda = prenda;
	}

	public TipoPrenda getTipoPrenda() {
		return tipoPrenda;
	}

	public void setTipoPrenda(TipoPrenda tipoPrenda) {
		this.tipoPrenda = tipoPrenda;
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

	public Comercio getComercio() {
		return comercio;
	}

	public void setComercio(Comercio comercio) {
		this.comercio = comercio;
	}

	public Descuento getDescuento() {
		return descuento;
	}

	public void setDescuento(Descuento descuento) {
		this.descuento = descuento;
	}

	public List<Prenda> getListaPrenda() {
		return listaPrenda;
	}

	public void setListaPrenda(List<Prenda> listaPrenda) {
		this.listaPrenda = listaPrenda;
	}

	public List<TipoPrenda> getListaTipoPrenda() {
		return listaTipoPrenda;
	}

	public void setListaTipoPrenda(List<TipoPrenda> listaTipoPrenda) {
		this.listaTipoPrenda = listaTipoPrenda;
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

	public List<Comercio> getListaComercio() {
		return listaComercio;
	}

	public void setListaComercio(List<Comercio> listaComercio) {
		this.listaComercio = listaComercio;
	}
	
	public List<Descuento> getListaDescuento() {
		return listaDescuento;
	}

	public void setListaDescuento(List<Descuento> listaDescuento) {
		this.listaDescuento = listaDescuento;
	}

	/* Guardado de imagen */
	
	private Part file;
	private String folder = "D:\\Ricardo\\sts-workspace2\\OutfitPro\\src\\main\\webapp\\resources\\img\\prendas";

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
			File tempFile = File.createTempFile("prd", ext, new File(folder));
	        String fileName = tempFile.getName();
	        tempFile.delete();
			Files.copy(input, new File(folder, fileName).toPath());
	        prenda.setImagen(tempFile.toPath().toString());
	    }
	    catch (IOException ex) {
	        ex.printStackTrace();
	    }
	}
}
