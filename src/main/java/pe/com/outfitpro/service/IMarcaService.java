package pe.com.outfitpro.service;

import java.util.List;

import pe.com.outfitpro.entity.Marca;

public interface IMarcaService {
	public void insertar(Marca obj);
	public List<Marca> listar();
	public void eliminar(int id);
}
