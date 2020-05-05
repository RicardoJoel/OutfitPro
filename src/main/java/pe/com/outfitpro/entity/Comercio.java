package pe.com.outfitpro.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="comercio")
public class Comercio extends Master implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name="nombre", nullable=false, length=100)
	private String nombre;
	
	@Column(name="ruc", nullable=false, length=11)
	private String ruc;
	
	@Column(name="correo", nullable=true, length=100)
	private String correo;
	
	@Column(name="telefono", nullable=true, length=100)
	private String telefono;
	
	@Column(name="nombreContacto", nullable=true, length=100)
	private String nombreContacto;
	
	@Column(name="correoContacto", nullable=true, length=100)
	private String correoContacto;
	
	@Column(name="telefonoContacto", nullable=true, length=100)
	private String telefonoContacto;
	
	public Comercio() {
		super();
	}

	public Comercio(String nombre, String ruc, String correo, String telefono, String nombreContacto,
			String correoContacto, String telefonoContacto) {
		super();
		this.nombre = nombre;
		this.ruc = ruc;
		this.correo = correo;
		this.telefono = telefono;
		this.nombreContacto = nombreContacto;
		this.correoContacto = correoContacto;
		this.telefonoContacto = telefonoContacto;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getRuc() {
		return ruc;
	}

	public void setRuc(String ruc) {
		this.ruc = ruc;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getNombreContacto() {
		return nombreContacto;
	}

	public void setNombreContacto(String nombreContacto) {
		this.nombreContacto = nombreContacto;
	}

	public String getCorreoContacto() {
		return correoContacto;
	}

	public void setCorreoContacto(String correoContacto) {
		this.correoContacto = correoContacto;
	}

	public String getTelefonoContacto() {
		return telefonoContacto;
	}

	public void setTelefonoContacto(String telefonoContacto) {
		this.telefonoContacto = telefonoContacto;
	}
}
