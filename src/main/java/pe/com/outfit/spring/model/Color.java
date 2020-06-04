package pe.com.outfit.spring.model;
import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;

@Entity
@Table(name="color")
public class Color extends Master implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@NotEmpty(message="No puede estar vacio")
	@NotBlank(message="No puede estar en blanco")
	
	@Column(name="nombre", nullable=false, length=100)
	private String nombre;
	
	@NotEmpty(message="No puede estar vacio")
	@NotBlank(message="No puede estar en blanco")
	@Column(name="hexadecimal", nullable=false, length=100)
	private String hexadecimal;
	
	public Color() {
		super();
	}

	public Color(String nombre, String hexadecimal) {
		super();
		this.nombre = nombre;
		this.hexadecimal = hexadecimal;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getHexadecimal() {
		return hexadecimal;
	}

	public void setHexadecimal(String hexadecimal) {
		this.hexadecimal = hexadecimal;
	}
}