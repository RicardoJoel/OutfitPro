package pe.com.outfitpro.dao;

import java.util.List;

import pe.com.outfitpro.entity.Marca;

public interface IMarcaDao {
	public void insertar(Marca obj);
	public List<Marca> listar();
	public void eliminar(int id);
}
