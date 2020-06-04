package pe.com.outfit.spring.service;

import java.util.List;

import pe.com.outfit.spring.model.Marca;

public interface IMarcaService {
	public void insertar(Marca obj);
	public List<Marca> listar();
	public void eliminar(int id);
}
