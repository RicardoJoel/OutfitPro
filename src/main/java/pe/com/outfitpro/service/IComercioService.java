package pe.com.outfitpro.service;

import java.util.List;

import pe.com.outfitpro.entity.Comercio;

public interface IComercioService {
	public void insertar(Comercio obj);
	public List<Comercio> listar();
	public void eliminar(int id);
}
