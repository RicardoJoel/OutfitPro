package pe.com.outfitpro.dao;

import java.util.List;

import pe.com.outfitpro.entity.Descuento;

public interface IDescuentoDao {
	public void insertar(Descuento obj);
	public List<Descuento> listar();
	public void eliminar(int id);
}
