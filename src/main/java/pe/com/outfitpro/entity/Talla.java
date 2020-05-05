package pe.com.outfitpro.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="talla")
public class Talla extends Master implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Column(name="detalle", nullable=false, length=100)
	private String detalle;
	
	@ManyToOne @JoinColumn(name="tipoPrendaId", nullable=false)
	private TipoPrenda tipoPrenda;
	
	public Talla() {
		super();
	}

	public Talla(String detalle, TipoPrenda tipoPrenda) {
		super();
		this.detalle = detalle;
		this.tipoPrenda = tipoPrenda;
	}

	public String getDetalle() {
		return detalle;
	}

	public void setDetalle(String detalle) {
		this.detalle = detalle;
	}

	public TipoPrenda getTipoPrenda() {
		return tipoPrenda;
	}

	public void setTipoPrenda(TipoPrenda tipoPrenda) {
		this.tipoPrenda = tipoPrenda;
	}
}
