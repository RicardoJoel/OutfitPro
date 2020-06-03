package pe.com.outfitpro.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
public class Usuario extends Master implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name="nombre", nullable=false, length=100)
	private String nombre;

	@Column(name="correo", nullable=false, length=100)
	private String correo;
	
	@Column(name="contrasena", nullable=false, length=100)
	private String contrasena;
	
	@Column(name="genero", nullable=false, length=100)
	private String genero;
	
	@Column(name="telefono", nullable=false, length=100)
	private String telefono;
	
	@Column(name="direccion", nullable=false, length=100)
	private String direccion;

	@Column(name="imagen", nullable=false, length=500)
	private String imagen;

	@Column(name="nacimiento", nullable=true)
	private Date nacimiento;
		
	@ManyToOne @JoinColumn(name="perfilId", nullable=false)
	private Perfil perfil;
	
	@ManyToOne @JoinColumn(name="ubigeoId", nullable=false)
	private Ubigeo ubigeo;
	
	public Usuario() {
		super();
	}

	public Usuario(String nombre, String correo, String contrasena, String genero, String telefono,
			String direccion, String imagen, Date nacimiento, Perfil perfil, Ubigeo ubigeo) {
		super();
		this.nombre = nombre;
		this.correo = correo;
		this.contrasena = contrasena;
		this.genero = genero;
		this.telefono = telefono;
		this.direccion = direccion;
		this.imagen = imagen;
		this.nacimiento = nacimiento;
		this.perfil = perfil;
		this.ubigeo = ubigeo;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getContrasena() {
		return contrasena;
	}

	public void setContrasena(String contrasena) {
		this.contrasena = contrasena;
	}

	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getImagen() {
		return imagen;
	}

	public void setImagen(String imagen) {
		this.imagen = imagen;
	}

	public Date getNacimiento() {
		return nacimiento;
	}

	public void setNacimiento(Date nacimiento) {
		this.nacimiento = nacimiento;
	}

	public Perfil getPerfil() {
		return perfil;
	}

	public void setPerfil(Perfil perfil) {
		this.perfil = perfil;
	}

	public Ubigeo getUbigeo() {
		return ubigeo;
	}

	public void setUbigeo(Ubigeo ubigeo) {
		this.ubigeo = ubigeo;
	}
}
