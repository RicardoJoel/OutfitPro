package pe.com.outfitpro.service;

import java.util.List;

import pe.com.outfitpro.entity.Prenda;

public interface IPrendaService {
	public void insertar(Prenda obj);
	public List<Prenda> listar();
	public void eliminar(int id);
}
