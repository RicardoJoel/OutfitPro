package pe.com.outfit.spring.service;

import java.util.List;

import pe.com.outfit.spring.model.Ubigeo;

public interface IUbigeoService {
	public void insertar(Ubigeo obj);
	public List<Ubigeo> listar();
	public void eliminar(int id);
}
