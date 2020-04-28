package pe.com.outfitpro.service;

import java.util.List;

import pe.com.outfitpro.entity.Descuento;

public interface IDescuentoService {
	public void insertar(Descuento obj);
	public List<Descuento> listar();
	public void eliminar(int id);
}
