package pe.com.outfitpro.dao;

import java.util.List;

import pe.com.outfitpro.entity.Ubigeo;

public interface IUbigeoDao {
	public void insertar(Ubigeo obj);
	public List<Ubigeo> listar();
	public void eliminar(int id);
}
