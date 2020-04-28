package pe.com.outfitpro.dao;

import java.util.List;

import pe.com.outfitpro.entity.Compra;

public interface ICompraDao {
	public void insertar(Compra obj);
	public List<Compra> listar();
	public void eliminar(int id);
}
