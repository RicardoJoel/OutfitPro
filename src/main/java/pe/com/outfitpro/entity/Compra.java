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
@Table(name="compra")
public class Compra extends Seguridad implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Column(name="totalsinigv", nullable=false)
	private float totalSinIGV;
	
	@Column(name="igv", nullable=false)
	private float IGV;
	
	@Column(name="totalfinal", nullable=false)
	private float totalFinal;
	
	@Column(name="estado", nullable=false, length=100)
	private String estado;
	
	@Column(name="fechorapago", nullable=true)
	private Date fecHoraPago;
	
	@ManyToOne(optional=false, cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	private Usuario usuario = new Usuario();
	
	@ManyToOne(optional=false, cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	private MetodoPago metodoPago = new MetodoPago();
	
	public Compra() {
		super();
	}

	public Compra(float totalSinIGV, float IGV, float totalFinal, String estado, Date fecHoraPago, Usuario usuario,
			MetodoPago metodoPago) {
		super();
		this.totalSinIGV = totalSinIGV;
		this.IGV = IGV;
		this.totalFinal = totalFinal;
		this.estado = estado;
		this.fecHoraPago = fecHoraPago;
		this.usuario = usuario;
		this.metodoPago = metodoPago;
	}

	public float getTotalSinIGV() {
		return totalSinIGV;
	}

	public void setTotalSinIGV(float totalSinIGV) {
		this.totalSinIGV = totalSinIGV;
	}

	public float getIGV() {
		return IGV;
	}

	public void setIGV(float IGV) {
		this.IGV = IGV;
	}

	public float getTotalFinal() {
		return totalFinal;
	}

	public void setTotalFinal(float totalFinal) {
		this.totalFinal = totalFinal;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public Date getFecHoraPago() {
		return fecHoraPago;
	}

	public void setFecHoraPago(Date fecHoraPago) {
		this.fecHoraPago = fecHoraPago;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public MetodoPago getMetodoPago() {
		return metodoPago;
	}

	public void setMetodoPago(MetodoPago metodoPago) {
		this.metodoPago = metodoPago;
	}

}
