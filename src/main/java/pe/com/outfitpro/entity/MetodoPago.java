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
@Table(name="metodopago")
public class MetodoPago extends Seguridad implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Column(name="tipopago", nullable=false, length=100)
	private String tipoPago;
	
	@Column(name="tarjeta", nullable=false, length=100)
	private String tarjeta;
	
	@Column(name="contrasena", nullable=false, length=100)
	private String contrasena;
	
	@Column(name="vencimiento", nullable=false)
	private Date vencimiento = new Date();
	
	@Column(name="ccv", nullable=false)
	private int ccv;
	
	@ManyToOne(optional=false, cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	private Usuario usuario = new Usuario();
	
	public MetodoPago() {
		super();
	}

	public MetodoPago(String tipoPago, String tarjeta, String contrasena, Date vencimiento, int ccv, Usuario usuario) {
		super();
		this.tipoPago = tipoPago;
		this.tarjeta = tarjeta;
		this.contrasena = contrasena;
		this.vencimiento = vencimiento;
		this.ccv = ccv;
		this.usuario = usuario;
	}

	public String getTipoPago() {
		return tipoPago;
	}

	public void setTipoPago(String tipoPago) {
		this.tipoPago = tipoPago;
	}

	public String getTarjeta() {
		return tarjeta;
	}

	public void setTarjeta(String tarjeta) {
		this.tarjeta = tarjeta;
	}

	public String getContrasena() {
		return contrasena;
	}

	public void setContrasena(String contrasena) {
		this.contrasena = contrasena;
	}

	public Date getVencimiento() {
		return vencimiento;
	}

	public void setVencimiento(Date vencimiento) {
		this.vencimiento = vencimiento;
	}

	public int getCCV() {
		return ccv;
	}

	public void setCCV(int ccv) {
		this.ccv = ccv;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
}
