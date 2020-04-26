package pe.com.outfitpro.dao;

import java.util.List;

import pe.com.outfitpro.entity.Comercio;

public interface IComercioDao {
	public void insertar(Comercio obj);
	public List<Comercio> listar();
	public void eliminar(int id);
}
