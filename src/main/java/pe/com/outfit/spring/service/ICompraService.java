package pe.com.outfit.spring.service;

import java.util.List;

import pe.com.outfit.spring.model.Compra;

public interface ICompraService {
	public void insertar(Compra obj);
	public List<Compra> listar();
	public void eliminar(int id);
}
