package pe.com.outfitpro.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="descuento")
public class Descuento extends Seguridad implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Column(name="nombre", nullable=false, length=100)
	private String nombre;
	
	@Column(name="descripcion", nullable=true, length=500)
	private String descripcion;
	
	@Column(name="monto", nullable=false)
	private float monto;
	
	@Column(name="porcentaje", nullable=false)
	private float porcentaje;
	
	@Column(name="fechaini", nullable=false)
	private Date fechaIni;
	
	@Column(name="fechafin", nullable=false)
	private Date fechaFin;
	
	@ManyToOne(optional=false, cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	private Prenda prenda;
	
	public Descuento() {
		super();
	}

	public Descuento(String nombre, String descripcion, float monto, float porcentaje, Date fechaIni, Date fechaFin, Prenda prenda) {
		super();
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.monto = monto;
		this.porcentaje = porcentaje;
		this.fechaIni = fechaIni;
		this.fechaFin = fechaFin;
		this.prenda = prenda;
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

	public float getMonto() {
		return monto;
	}

	public void setMonto(float monto) {
		this.monto = monto;
	}

	public float getPorcentaje() {
		return porcentaje;
	}

	public void setPorcentaje(float porcentaje) {
		this.porcentaje = porcentaje;
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

	public Prenda getPrenda() {
		return prenda;
	}

	public void setPrenda(Prenda prenda) {
		this.prenda = prenda;
	}

}
