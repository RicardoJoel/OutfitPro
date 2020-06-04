package pe.com.outfit.spring.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="descuento")
public class Descuento extends Master implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Column(name="nombre", nullable=false, length=100)
	private String nombre;
	
	@Column(name="descripcion", nullable=true, length=500)
	private String descripcion;
	
	@Column(name="tipoDesc", nullable=false)
	private String tipoDesc;
	
	@Column(name="cantidad", nullable=false)
	private float cantidad;
	
	@Column(name="fechaIni", nullable=false)
	private Date fechaIni;
	
	@Column(name="fechaFin", nullable=false)
	private Date fechaFin;
	
	public Descuento() {
		super();
	}

	public Descuento(String nombre, String descripcion, String tipoDesc, float cantidad, Date fechaIni, Date fechaFin) {
		super();
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.tipoDesc = tipoDesc;
		this.cantidad = cantidad;
		this.fechaIni = fechaIni;
		this.fechaFin = fechaFin;
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

	public String getTipoDesc() {
		return tipoDesc;
	}

	public void setTipoDesc(String tipoDesc) {
		this.tipoDesc = tipoDesc;
	}

	public float getCantidad() {
		return cantidad;
	}

	public void setCantidad(float cantidad) {
		this.cantidad = cantidad;
	}

	public Date getFechaIni() {
		return fechaIni;
	}

	public void setFechaIni(Date fechaIni) {
		this.fechaIni = fechaIni;
	}

	public Date getFechaFin() {
		return fechaFin;
	}

	public void setFechaFin(Date fechaFin) {
		this.fechaFin = fechaFin;
	}
}
