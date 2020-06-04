package pe.com.outfit.spring.service;

import java.util.List;

import pe.com.outfit.spring.model.Comercio;

public interface IComercioService {
	public void insertar(Comercio obj);
	public List<Comercio> listar();
	public void eliminar(int id);
}
