package pe.com.outfit.spring.service;

import java.util.List;

import pe.com.outfit.spring.model.Talla;

public interface ITallaService {
	public void insertar(Talla obj);
	public List<Talla> listar();
	public void eliminar(int id);
}
