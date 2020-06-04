package pe.com.outfit.spring.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="marca")
public class Marca extends Master implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name="nombre", nullable=false, length=100)
	private String nombre;
	
	@Column(name="descripcion", nullable=true, length=500)
	private String descripcion;
	
	public Marca() {
		super();
	}

	public Marca(String nombre, String descripcion) {
		super();
		this.nombre = nombre;
		this.descripcion = descripcion;
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
}
