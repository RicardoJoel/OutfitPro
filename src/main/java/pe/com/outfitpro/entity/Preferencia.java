package pe.com.outfitpro.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="preferencia")
public class Preferencia extends Master implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name="explicita", nullable=false)
	private Boolean explicita;
	
	@ManyToOne @JoinColumn(name="tallaId", nullable=true)
	private Talla talla;
	
	@ManyToOne @JoinColumn(name="colorId", nullable=true)
	private Color color;
	
	@ManyToOne @JoinColumn(name="marcaId", nullable=true)
	private Marca marca;
	
	@ManyToOne @JoinColumn(name="tipoPrendaId", nullable=false)
	private TipoPrenda tipoPrenda;
	
	@ManyToOne @JoinColumn(name="clienteId", nullable=false)
	private Cliente cliente;
	
	public Preferencia() {
		super();
	}

	public Preferencia(Boolean explicita, Talla talla, Color color, Marca marca, TipoPrenda tipoPrenda,
			Cliente cliente) {
		super();
		this.explicita = explicita;
		this.talla = talla;
		this.color = color;
		this.marca = marca;
		this.tipoPrenda = tipoPrenda;
		this.cliente = cliente;
	}

	public Boolean getExplicita() {
		return explicita;
	}

	public void setExplicita(Boolean explicita) {
		this.explicita = explicita;
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

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
}
