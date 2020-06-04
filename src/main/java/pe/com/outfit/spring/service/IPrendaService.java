package pe.com.outfit.spring.service;

import java.util.List;

import pe.com.outfit.spring.model.Prenda;

public interface IPrendaService {
	public void insertar(Prenda obj);
	public List<Prenda> listar();
	public void eliminar(int id);
}
