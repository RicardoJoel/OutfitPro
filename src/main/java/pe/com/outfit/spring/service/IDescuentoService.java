package pe.com.outfit.spring.service;

import java.util.List;

import pe.com.outfit.spring.model.Descuento;

public interface IDescuentoService {
	public void insertar(Descuento obj);
	public List<Descuento> listar();
	public void eliminar(int id);
}
