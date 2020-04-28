package pe.com.outfitpro.entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="preferencia")
public class Preferencia extends Seguridad implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Column(name="explicita", nullable=false)
	private Boolean explicita = true;
	
	@Column(name="genero", nullable=false, length=100)
	private String genero;
	
	@ManyToOne(optional=true, cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	private Talla talla;
	
	@ManyToOne(optional=true, cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	private Color color;
	
	@ManyToOne(optional=true, cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	private Marca marca;
	
	@ManyToOne(optional=false, cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	private TipoPrenda tipoPrenda = new TipoPrenda();
	
	@ManyToOne(optional=false, cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	private Usuario usuario = new Usuario();
	
	public Preferencia() {
		super();
	}

	public Preferencia(Boolean explicita, String genero, Talla talla, Color color, Marca marca, TipoPrenda tipoPrenda, Usuario usuario) {
		super();
		this.explicita = explicita;
		this.genero = genero;
		this.talla = talla;
		this.color = color;
		this.marca = marca;
		this.tipoPrenda = tipoPrenda;
		this.usuario = usuario;
	}

	public Boolean getExplicita() {
		return explicita;
	}

	public void setExplicita(Boolean explicita) {
		this.explicita = explicita;
	}

	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
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

	public TipoPrenda getTipoPrenda() {
		return tipoPrenda;
	}

	public void setTipoPrenda(TipoPrenda tipoPrenda) {
		this.tipoPrenda = tipoPrenda;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
}
