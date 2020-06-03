package pe.com.outfitpro.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="asesor")
public class Asesor extends Usuario implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Column(name="referencia", nullable=true, length=500)
	private String referencia;
	
	@Column(name="valoracion", nullable=false)
	private int valoracion;
	
	public Asesor() {
		super();
	}

	public Asesor(String referencia, int valoracion) {
		super();
		this.referencia = referencia;
		this.valoracion = valoracion;
	}

	public String getReferencia() {
		return referencia;
	}

	public void setReferencia(String referencia) {
		this.referencia = referencia;
	}

	public int getValoracion() {
		return valoracion;
	}

	public void setValoracion(int valoracion) {
		this.valoracion = valoracion;
	}
}
