package pe.com.outfitpro.entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="prenda")
public class Prenda extends Seguridad implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Column(name="nombre", nullable=false, length=500)
	private String nombre;
	
	@Column(name="descripcion", nullable=false, length=500)
	private String descripcion;
	
	@Column(name="modelo", nullable=false, length=100)
	private String modelo;
	
	@Column(name="genero", nullable=false, length=100)
	private String genero;
	
	@Column(name="color", nullable=false, length=100)
	private String color;
	
	@Column(name="talla", nullable=false, length=100)
	private String talla;
	
	@Column(name="precio", nullable=false)
	private float precio;
	
	@Column(name="stock", nullable=false)
	private int stock;
	
	@ManyToOne(optional=false, cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	private Marca marca = new Marca();
	
	@ManyToOne(optional=false, cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	private Comercio comercio = new Comercio();
	
	@ManyToOne(optional=false, cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	private TipoPrenda tipoPrenda = new TipoPrenda();
	
	public Prenda() {
		super();
	}

	public Prenda(String nombre, String descripcion, String modelo, String genero, String color, String talla,
			float precio, int stock, Marca marca, Comercio comercio, TipoPrenda tipoPrenda) {
		super();
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.modelo = modelo;
		this.genero = genero;
		this.color = color;
		this.talla = talla;
		this.precio = precio;
		this.stock = stock;
		this.marca = marca;
		this.comercio = comercio;
		this.tipoPrenda = tipoPrenda;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getModelo() {
		return modelo;
	}

	public void setModelo(String modelo) {
		this.modelo = modelo;
	}
	
	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}
	
	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}
	
	public String getTalla() {
		return talla;
	}

	public void setTalla(String talla) {
		this.talla = talla;
	}

	public float getPrecio() {
		return precio;
	}

	public void setPrecio(float precio) {
		this.precio = precio;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
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

	public TipoPrenda getTipoPrenda() {
		return tipoPrenda;
	}

	public void setTipoPrenda(TipoPrenda tipoPrenda) {
		this.tipoPrenda = tipoPrenda;
	}

}
