package pe.com.outfitpro.service;

import java.util.List;

import pe.com.outfitpro.entity.Talla;

public interface ITallaService {
	public void insertar(Talla obj);
	public List<Talla> listar();
	public void eliminar(int id);
}
