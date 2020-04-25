package pe.com.outfitpro.entity;

import java.util.Date;

import javax.persistence.Column;

public abstract class Seguridad {
	
	@Column(name="activo", nullable=false)
	private Boolean activo;
	
	@Column(name="idusuariocreacion", nullable=false)
	private int idUsuarioCreacion;
	
	@Column(name="fechahoracreacion", nullable=false)
	private Date fechaHoraCreacion;
	
	@Column(name="idusuariomodificacion", nullable=false)
	private int idUsuarioModificacion;
	
	@Column(name="fechahoramodificacion", nullable=false)
	private Date fechaHoraModificacion;

	public Seguridad() {
		super();
	}

	public Seguridad(Boolean activo, int idUsuarioCreacion, Date fechaHoraCreacion, int idUsuarioModificacion, Date fechaHoraModificacion) {
		super();
		this.activo = activo;
		this.idUsuarioCreacion = idUsuarioCreacion;
		this.fechaHoraCreacion = fechaHoraCreacion;
		this.idUsuarioModificacion = idUsuarioModificacion;
		this.fechaHoraModificacion = fechaHoraModificacion;
	}

	public Boolean getActivo() {
		return activo;
	}

	public void setActivo(Boolean activo) {
		this.activo = activo;
	}

	public int getIdUsuarioCreacion() {
		return idUsuarioCreacion;
	}

	public void setIdUsuarioCreacion(int idUsuarioCreacion) {
		this.idUsuarioCreacion = idUsuarioCreacion;
	}

	public Date getFechaHoraCreacion() {
		return fechaHoraCreacion;
	}

	public void setFechaHoraCreacion(Date fechaHoraCreacion) {
		this.fechaHoraCreacion = fechaHoraCreacion;
	}

	public int getIdUsuarioModificacion() {
		return idUsuarioModificacion;
	}

	public void setIdUsuarioModificacion(int idUsuarioModificacion) {
		this.idUsuarioModificacion = idUsuarioModificacion;
	}

	public Date getFechaHoraModificacion() {
		return fechaHoraModificacion;
	}

	public void setFechaHoraModificacion(Date fechaHoraModificacion) {
		this.fechaHoraModificacion = fechaHoraModificacion;
	}
	
}
