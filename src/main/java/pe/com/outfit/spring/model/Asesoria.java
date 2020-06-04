package pe.com.outfit.spring.model;
import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="asesoria")
public class Asesoria extends Master implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Column(name="fecHoraIni", nullable=false)
	private Date fecHoraIni = new Date();
	
	@Column(name="fecHoraFin", nullable=true)
	private Date fecHoraFin;
	
	@Column(name="valoracion", nullable=false)
	private int valoracion;
	
	@ManyToOne @JoinColumn(name="clienteId", nullable=false)
	private Cliente cliente;
	
	@ManyToOne @JoinColumn(name="asesorId", nullable=false)
	private Asesor asesor;
	
	public Asesoria() {
		super();
	}

	public Asesoria(Date fecHoraIni, Date fecHoraFin, int valoracion, Cliente cliente, Asesor asesor) {
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

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public Asesor getAsesor() {
		return asesor;
	}

	public void setAsesor(Asesor asesor) {
		this.asesor = asesor;
	}
}
