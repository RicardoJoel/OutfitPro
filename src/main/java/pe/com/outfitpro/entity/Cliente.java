package pe.com.outfitpro.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="cliente")
public class Cliente extends Usuario implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Column(name="premium", nullable=false)
	private Boolean premium;
	
	@Column(name="fecAltaPremium", nullable=true)
	private Date fecAltaPremium;

	@Column(name="fecBajaPremium", nullable=true)
	private Date fecBajaPremium;

	@Column(name="numAsesLibres", nullable=false)
	private int numAsesLibres;
	
	public Cliente() {
		super();
	}

	public Cliente(Boolean premium, Date fecAltaPremium, Date fecBajaPremium, int numAsesLibres) {
		super();
		this.premium = premium;
		this.fecAltaPremium = fecAltaPremium;
		this.fecBajaPremium = fecBajaPremium;
		this.numAsesLibres = numAsesLibres;
	}

	public Boolean getPremium() {
		return premium;
	}

	public void setPremium(Boolean premium) {
		this.premium = premium;
	}

	public Date getFecAltaPremium() {
		return fecAltaPremium;
	}

	public void setFecAltaPremium(Date fecAltaPremium) {
		this.fecAltaPremium = fecAltaPremium;
	}

	public Date getFecBajaPremium() {
		return fecBajaPremium;
	}

	public void setFecBajaPremium(Date fecBajaPremium) {
		this.fecBajaPremium = fecBajaPremium;
	}

	public int getNumAsesLibres() {
		return numAsesLibres;
	}

	public void setNumAsesLibres(int numAsesLibres) {
		this.numAsesLibres = numAsesLibres;
	}
}
