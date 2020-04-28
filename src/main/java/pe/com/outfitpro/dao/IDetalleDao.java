package pe.com.outfitpro.dao;

import java.util.List;

import pe.com.outfitpro.entity.Detalle;

public interface IDetalleDao {
	public void insertar(Detalle obj);
	public List<Detalle> listar();
	public void eliminar(int id);
}
