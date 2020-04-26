package pe.com.outfitpro.dao;

import java.util.List;

import pe.com.outfitpro.entity.TipoPrenda;

public interface ITipoPrendaDao {
	public void insertar(TipoPrenda obj);
	public List<TipoPrenda> listar();
	public void eliminar(int id);
}
