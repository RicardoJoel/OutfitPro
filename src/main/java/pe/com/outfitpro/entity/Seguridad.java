package pe.com.outfitpro.entity;

import java.io.Serializable;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
public class Seguridad implements Serializable {
	
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="activo", nullable=false)
	private Boolean activo = true;
	
	@Column(name="idusuariocreacion", nullable=false)
	private int idUsuarioCreacion;
	
	@Column(name="fechahoracreacion", nullable=false)
	private Date fechaHoraCreacion = new Date();
	
	@Column(name="idusuariomodificacion", nullable=false)
	private int idUsuarioModificacion;
	
	@Column(name="fechahoramodificacion", nullable=true)
	private Date fechaHoraModificacion;

	public Seguridad() {
		super();
	}

	public Seguridad(int id, Boolean activo, int idUsuarioCreacion, Date fechaHoraCreacion, int idUsuarioModificacion, Date fechaHoraModificacion) {
		super();
		this.id = id;
		this.activo = activo;
		this.idUsuarioCreacion = idUsuarioCreacion;
		this.fechaHoraCreacion = fechaHoraCreacion;
		this.idUsuarioModificacion = idUsuarioModificacion;
		this.fechaHoraModificacion = fechaHoraModificacion;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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
