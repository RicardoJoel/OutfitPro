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
@Table(name="usuario")
public class Usuario extends Seguridad implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Column(name="nombre", nullable=false, length=100)
	private String nombre;
	
	@Column(name="apellido", nullable=false, length=100)
	private String apellido;
	
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
	
	@Column(name="tipdocumento", nullable=false, length=100)
	private String tipDocumento;
	
	@Column(name="coddocumento", nullable=false, length=100)
	private String codDocumento;
	
	@Column(name="referencia", nullable=false, length=500)
	private String referencia;
	
	@Column(name="premium", nullable=false)
	private Boolean premium;
	
	@Column(name="aseslibres", nullable=false)
	private int asesLibres;
	
	@Column(name="valoracion", nullable=false)
	private int valoracion;
	
	@Column(name="fechnacimiento", nullable=true)
	private Date fechNacimiento;
	
	@Column(name="fechaltapremium", nullable=true)
	private Date fechAltaPremium;

	@Column(name="fechbajapremium", nullable=true)
	private Date fechBajaPremium;
	
	@ManyToOne(optional=false, cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	private Perfil perfil;
	
	@ManyToOne(optional=false, cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	private Ubigeo ubigeo;
	
	public Usuario() {
		super();
	}

	public Usuario(String nombre, String apellido, String correo, String contrasena, String genero, String telefono,
			String direccion, String tipDocumento, String codDocumento, String referencia, Boolean premium,
			int asesLibres, int valoracion, Date fechNacimiento, Date fechAltaPremium, Date fechBajaPremium,
			Perfil perfil, Ubigeo ubigeo) {
		super();
		this.nombre = nombre;
		this.apellido = apellido;
		this.correo = correo;
		this.contrasena = contrasena;
		this.genero = genero;
		this.telefono = telefono;
		this.direccion = direccion;
		this.tipDocumento = tipDocumento;
		this.codDocumento = codDocumento;
		this.referencia = referencia;
		this.premium = premium;
		this.asesLibres = asesLibres;
		this.valoracion = valoracion;
		this.fechNacimiento = fechNacimiento;
		this.fechAltaPremium = fechAltaPremium;
		this.fechBajaPremium = fechBajaPremium;
		this.perfil = perfil;
		this.ubigeo = ubigeo;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
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

	public String getTipDocumento() {
		return tipDocumento;
	}

	public void setTipDocumento(String tipDocumento) {
		this.tipDocumento = tipDocumento;
	}

	public String getCodDocumento() {
		return codDocumento;
	}

	public void setCodDocumento(String codDocumento) {
		this.codDocumento = codDocumento;
	}

	public String getReferencia() {
		return referencia;
	}

	public void setReferencia(String referencia) {
		this.referencia = referencia;
	}

	public Boolean getPremium() {
		return premium;
	}

	public void setPremium(Boolean premium) {
		this.premium = premium;
	}

	public int getAsesLibres() {
		return asesLibres;
	}

	public void setAsesLibres(int asesLibres) {
		this.asesLibres = asesLibres;
	}

	public int getValoracion() {
		return valoracion;
	}

	public void setValoracion(int valoracion) {
		this.valoracion = valoracion;
	}

	public Date getFechNacimiento() {
		return fechNacimiento;
	}

	public void setFechNacimiento(Date fechNacimiento) {
		this.fechNacimiento = fechNacimiento;
	}

	public Date getFechAltaPremium() {
		return fechAltaPremium;
	}

	public void setFechAltaPremium(Date fechAltaPremium) {
		this.fechAltaPremium = fechAltaPremium;
	}

	public Date getFechBajaPremium() {
		return fechBajaPremium;
	}

	public void setFechBajaPremium(Date fechBajaPremium) {
		this.fechBajaPremium = fechBajaPremium;
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
