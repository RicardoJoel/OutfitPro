package pe.com.outfitpro.service;

import java.util.List;

import pe.com.outfitpro.entity.DetalleCompra;

public interface IDetalleCompraService {
	public void insertar(DetalleCompra obj);
	public List<DetalleCompra> listar();
	public void eliminar(int id);
}
