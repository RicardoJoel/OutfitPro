package pe.com.outfitpro.entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="detalle")
public class Detalle extends Seguridad implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Column(name="cantidad", nullable=false)
	private int cantidad;
	
	@Column(name="subtotal", nullable=false)
	private float subtotal;
	
	@Column(name="montodesc", nullable=false)
	private float montoDesc;
	
	@Column(name="subtotalfinal", nullable=false)
	private float subtotalFinal;
	
	@Column(name="igv", nullable=false)
	private float IGV;
	
	@ManyToOne(optional=false, cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	private Compra compra;
	
	@ManyToOne(optional=false, cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	private Prenda prenda;
	
	@ManyToOne(optional=true, cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	private Descuento descuento;
	
	public Detalle() {
		super();
	}

	public Detalle(int cantidad, float subtotal, float montoDesc, float subtotalFinal, float IGV, Compra compra,
			Prenda prenda, Descuento descuento) {
		super();
		this.cantidad = cantidad;
		this.subtotal = subtotal;
		this.montoDesc = montoDesc;
		this.subtotalFinal = subtotalFinal;
		this.IGV = IGV;
		this.compra = compra;
		this.prenda = prenda;
		this.descuento = descuento;
	}

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public float getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(float subtotal) {
		this.subtotal = subtotal;
	}

	public float getMontoDesc() {
		return montoDesc;
	}

	public void setMontoDesc(float montoDesc) {
		this.montoDesc = montoDesc;
	}

	public float getSubtotalFinal() {
		return subtotalFinal;
	}

	public void setSubtotalFinal(float subtotalFinal) {
		this.subtotalFinal = subtotalFinal;
	}

	public float getIGV() {
		return IGV;
	}

	public void setIGV(float IGV) {
		this.IGV = IGV;
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

	public Descuento getDescuento() {
		return descuento;
	}

	public void setDescuento(Descuento descuento) {
		this.descuento = descuento;
	}
	
}
