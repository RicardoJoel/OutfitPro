package pe.com.outfitpro.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="comercio")
public class Comercio extends Seguridad implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Column(name="nombre", nullable=false, length=500)
	private String nombre;
	
	@Column(name="ruc", nullable=false, length=11)
	private String ruc;
	
	@Column(name="correo", nullable=false, length=500)
	private String correo;
	
	@Column(name="telefono", nullable=false, length=500)
	private String telefono;
	
	@Column(name="nombrerepres", nullable=false, length=500)
	private String nombreRepres;
	
	@Column(name="correorepres", nullable=false, length=500)
	private String correoRepres;
	
	@Column(name="telefonorepres", nullable=false, length=500)
	private String telefonoRepres;
	
	public Comercio() {
		super();
	}

	public Comercio(String nombre, String ruc, String correo, String telefono, String nombreRepres, String correoRepres, String telefonoRepres) {
		super();
		this.nombre = nombre;
		this.ruc = ruc;
		this.correo = correo;
		this.telefono = telefono;
		this.nombreRepres = nombreRepres;
		this.correoRepres = correoRepres;
		this.telefonoRepres = telefonoRepres;
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

	public String getNombreRepres() {
		return nombreRepres;
	}

	public void setNombreRepres(String nombreRepres) {
		this.nombreRepres = nombreRepres;
	}

	public String getCorreoRepres() {
		return correoRepres;
	}

	public void setCorreoRepres(String correoRepres) {
		this.correoRepres = correoRepres;
	}
	
	public String getTelefonoRepres() {
		return telefonoRepres;
	}

	public void setTelefonoRepres(String telefonoRepres) {
		this.telefonoRepres = telefonoRepres;
	}

}
