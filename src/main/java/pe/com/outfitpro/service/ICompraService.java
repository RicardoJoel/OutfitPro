package pe.com.outfitpro.service;

import java.util.List;

import pe.com.outfitpro.entity.Compra;

public interface ICompraService {
	public void insertar(Compra obj);
	public List<Compra> listar();
	public void eliminar(int id);
}
