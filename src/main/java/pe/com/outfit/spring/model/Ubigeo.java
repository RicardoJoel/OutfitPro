package pe.com.outfit.spring.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="ubigeo")
public class Ubigeo extends Master implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name="distrito", nullable=false, length=100)
	private String distrito;
	
	@Column(name="provincia", nullable=false, length=100)
	private String provincia;
	
	@Column(name="departamento", nullable=false, length=100)
	private String departamento;
	
	public Ubigeo() {
		super();
	}

	public Ubigeo(String distrito, String provincia, String departamento) {
		super();
		this.distrito = distrito;
		this.provincia = provincia;
		this.departamento = departamento;
	}

	public String getDistrito() {
		return distrito;
	}

	public void setDistrito(String distrito) {
		this.distrito = distrito;
	}

	public String getProvincia() {
		return provincia;
	}

	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}

	public String getDepartamento() {
		return departamento;
	}

	public void setDepartamento(String departamento) {
		this.departamento = departamento;
	}	
}
