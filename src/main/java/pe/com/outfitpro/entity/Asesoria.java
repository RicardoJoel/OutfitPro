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
@Table(name="asesoria")
public class Asesoria extends Seguridad implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Column(name="fechoraini", nullable=false)
	private Date fecHoraIni;
	
	@Column(name="fechorafin", nullable=true)
	private Date fecHoraFin;
	
	@Column(name="valoracion", nullable=false)
	private int valoracion;
	
	@ManyToOne(optional=false, cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	private Usuario cliente;
	
	@ManyToOne(optional=false, cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	private Usuario asesor;
	
	public Asesoria() {
		super();
	}

	public Asesoria(Date fecHoraIni, Date fecHoraFin, int valoracion, Usuario cliente, Usuario asesor) {
		super();
		this.fecHoraIni = fecHoraIni;
		this.fecHoraFin = fecHoraFin;
		this.valoracion = valoracion;
		this.cliente = cliente;
		this.asesor = asesor;
	}

	public Date getFecHoraIni() {
		return fecHoraIni;
	}

	public void setFecHoraIni(Date fecHoraIni) {
		this.fecHoraIni = fecHoraIni;
	}

	public Date getFecHoraFin() {
		return fecHoraFin;
	}

	public void setFecHoraFin(Date fecHoraFin) {
		this.fecHoraFin = fecHoraFin;
	}

	public int getValoracion() {
		return valoracion;
	}

	public void setValoracion(int valoracion) {
		this.valoracion = valoracion;
	}

	public Usuario getCliente() {
		return cliente;
	}

	public void setCliente(Usuario cliente) {
		this.cliente = cliente;
	}

	public Usuario getAsesor() {
		return asesor;
	}

	public void setAsesor(Usuario asesor) {
		this.asesor = asesor;
	}

}
