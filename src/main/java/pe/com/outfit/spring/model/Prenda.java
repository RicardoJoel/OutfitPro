package pe.com.outfit.spring.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="prenda")
public class Prenda extends Master implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name="nombre", nullable=false, length=100)
	private String nombre;
	
	@Column(name="descripcion", nullable=true, length=500)
	private String descripcion;
	
	@Column(name="imagen", nullable=true, length=500)
	private String imagen;
	
	@Column(name="genero", nullable=false, length=100)
	private String genero;
	
	@Column(name="precio", nullable=false)
	private float precio;
	
	@Column(name="stock", nullable=false)
	private int stock;
	
	@ManyToOne @JoinColumn(name="tallaId", nullable=false)
	private Talla talla;
	
	@ManyToOne @JoinColumn(name="colorId", nullable=false)
	private Color color;
	
	@ManyToOne @JoinColumn(name="marcaId", nullable=false)
	private Marca marca;
	
	@ManyToOne @JoinColumn(name="comercioId", nullable=false)
	private Comercio comercio;
	
	@ManyToOne @JoinColumn(name="tipoPrendaId", nullable=false)
	private TipoPrenda tipoPrenda;
	
	@ManyToOne @JoinColumn(name="descuentoId", nullable=true)
	private Descuento descuento;
	
	public Prenda() {
		super();
	}

	public Prenda(String nombre, String descripcion, String imagen, String genero, float precio, int stock, 
			Talla talla, Color color, Marca marca, Comercio comercio, TipoPrenda tipoPrenda, Descuento descuento) {
		super();
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.imagen = imagen;
		this.genero = genero;
		this.precio = precio;
		this.stock = stock;
		this.talla = talla;
		this.color = color;
		this.marca = marca;
		this.comercio = comercio;
		this.tipoPrenda = tipoPrenda;
		this.descuento = descuento;
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

	public String getImagen() {
		return imagen;
	}

	public void setImagen(String imagen) {
		this.imagen = imagen;
	}
	
	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
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

	public TipoPrenda getTipoPrenda() {
		return tipoPrenda;
	}

	public void setTipoPrenda(TipoPrenda tipoPrenda) {
		this.tipoPrenda = tipoPrenda;
	}

	public Descuento getDescuento() {
		return descuento;
	}

	public void setDescuento(Descuento descuento) {
		this.descuento = descuento;
	}
}
