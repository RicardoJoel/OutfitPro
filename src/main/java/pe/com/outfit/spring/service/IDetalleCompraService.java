package pe.com.outfit.spring.service;

import java.util.List;

import pe.com.outfit.spring.model.DetalleCompra;

public interface IDetalleCompraService {
	public void insertar(DetalleCompra obj);
	public List<DetalleCompra> listar();
	public void eliminar(int id);
}
