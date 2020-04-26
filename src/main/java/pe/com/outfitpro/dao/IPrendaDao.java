package pe.com.outfitpro.dao;

import java.util.List;

import pe.com.outfitpro.entity.Prenda;

public interface IPrendaDao {
	public void insertar(Prenda obj);
	public List<Prenda> listar();
	public void eliminar(int id);
}
