package pe.com.outfit.spring.model;


import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="detalle")
public class DetalleCompra extends Master implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Column(name="cantidad", nullable=false)
	private int cantidad;
	
	@Column(name="subTotal", nullable=false)
	private float subTotal;
	
	@Column(name="montoDesc", nullable=false)
	private float montoDesc;
	
	@Column(name="subTotalFinal", nullable=false)
	private float subTotalFinal;
	
	@ManyToOne @JoinColumn(name="compraId", nullable=false)
	private Compra compra;
	
	@ManyToOne @JoinColumn(name="prendaId", nullable=false)
	private Prenda prenda;
	
	public DetalleCompra() {
		super();
	}

	public DetalleCompra(int cantidad, float subTotal, float montoDesc, float subTotalFinal, Compra compra,
			Prenda prenda) {
		super();
		this.cantidad = cantidad;
		this.subTotal = subTotal;
		this.montoDesc = montoDesc;
		this.subTotalFinal = subTotalFinal;
		this.compra = compra;
		this.prenda = prenda;
	}

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public float getSubTotal() {
		return subTotal;
	}

	public void setSubTotal(float subTotal) {
		this.subTotal = subTotal;
	}

	public float getMontoDesc() {
		return montoDesc;
	}

	public void setMontoDesc(float montoDesc) {
		this.montoDesc = montoDesc;
	}

	public float getSubTotalFinal() {
		return subTotalFinal;
	}

	public void setSubTotalFinal(float subTotalFinal) {
		this.subTotalFinal = subTotalFinal;
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
}
