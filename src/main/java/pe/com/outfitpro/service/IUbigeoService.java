package pe.com.outfitpro.service;

import java.util.List;

import pe.com.outfitpro.entity.Ubigeo;

public interface IUbigeoService {
	public void insertar(Ubigeo obj);
	public List<Ubigeo> listar();
	public void eliminar(int id);
}
