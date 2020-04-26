package pe.com.outfitpro.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="ubigeo")
public class Ubigeo extends Seguridad implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Column(name="departamento", nullable=false, length=500)
	private String departamento;
	
	@Column(name="provincia", nullable=false, length=500)
	private String provincia;
	
	@Column(name="distrito", nullable=false, length=500)
	private String distrito;
	
	public Ubigeo() {
		super();
	}

	public Ubigeo(String departamento, String provincia, String distrito) {
		super();
		this.departamento = departamento;
		this.provincia = provincia;
		this.distrito = distrito;
	}

	public String getDepartamento() {
		return departamento;
	}

	public void setDepartamento(String departamento) {
		this.departamento = departamento;
	}
	
	public String getProvincia() {
		return provincia;
	}

	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}
	
	public String getDistrito() {
		return distrito;
	}

	public void setDistrito(String distrito) {
		this.distrito = distrito;
	}
	
}
