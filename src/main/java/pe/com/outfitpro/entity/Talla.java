package pe.com.outfitpro.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="talla")
public class Talla extends Master implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Column(name="nombre", nullable=false, length=100)
	private String nombre;
	
	@Column(name="detalle", nullable=true, length=100)
	private String detalle;

	public Talla() {
		super();
	}

	public Talla(int id, Boolean activo) {
		super(id, activo);
	}

	public Talla(String nombre, String detalle) {
		super();
		this.nombre = nombre;
		this.detalle = detalle;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDetalle() {
		return detalle;
	}

	public void setDetalle(String detalle) {
		this.detalle = detalle;
	}
	
}