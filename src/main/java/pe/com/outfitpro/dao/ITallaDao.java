package pe.com.outfitpro.dao;

import java.util.List;

import pe.com.outfitpro.entity.Talla;

public interface ITallaDao {
	public void insertar(Talla obj);
	public List<Talla> listar();
	public void eliminar(int id);
}
