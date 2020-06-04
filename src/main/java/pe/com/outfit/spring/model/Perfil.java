package pe.com.outfit.spring.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="perfil")
public class Perfil extends Master implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name="nombre", nullable=false, length=100)
	private String nombre;
	
	@Column(name="descripcion", nullable=true, length=500)
	private String descripcion;
	
	@Column(name="nivelAcceso", nullable=false)
	private int nivelAcceso;
	
	public Perfil() {
		super();
	}

	public Perfil(String nombre, String descripcion, int nivelAcceso) {
		super();
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.nivelAcceso = nivelAcceso;
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
	
	public int getNivelAcceso() {
		return nivelAcceso;
	}

	public void setNivelAcceso(int nivelAcceso) {
		this.nivelAcceso = nivelAcceso;
	}
}
