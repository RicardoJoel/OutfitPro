package pe.com.outfitpro.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="compra")
public class Compra extends Master implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Column(name="montoTotal", nullable=false)
	private float montoTotal;
	
	@Column(name="fecHoraPago", nullable=true)
	private Date fecHoraPago;
	
	@Column(name="metodoPago", nullable=true, length=100)
	private String metodoPago;
	
	@Column(name="estado", nullable=false, length=100)
	private String estado;
	
	@ManyToOne @JoinColumn(name="clienteId", nullable=false)
	private Cliente cliente;
	
	public Compra() {
		super();
	}

	public Compra(float montoTotal, Date fecHoraPago, String metodoPago, String estado, Cliente cliente) {
		super();
		this.montoTotal = montoTotal;
		this.fecHoraPago = fecHoraPago;
		this.metodoPago = metodoPago;
		this.estado = estado;
		this.cliente = cliente;
	}

	public float getMontoTotal() {
		return montoTotal;
	}

	public void setMontoTotal(float montoTotal) {
		this.montoTotal = montoTotal;
	}

	public Date getFecHoraPago() {
		return fecHoraPago;
	}

	public void setFecHoraPago(Date fecHoraPago) {
		this.fecHoraPago = fecHoraPago;
	}

	public String getMetodoPago() {
		return metodoPago;
	}

	public void setMetodoPago(String metodoPago) {
		this.metodoPago = metodoPago;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
}
