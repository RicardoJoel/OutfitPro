package pe.com.outfitpro.dao;

import java.util.List;

import pe.com.outfitpro.entity.DetalleCompra;

public interface IDetalleCompraDao {
	public void insertar(DetalleCompra obj);
	public List<DetalleCompra> listar();
	public void eliminar(int id);
}
