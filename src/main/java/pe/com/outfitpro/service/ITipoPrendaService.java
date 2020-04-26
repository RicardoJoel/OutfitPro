package pe.com.outfitpro.service;

import java.util.List;

import pe.com.outfitpro.entity.TipoPrenda;

public interface ITipoPrendaService {
	public void insertar(TipoPrenda obj);
	public List<TipoPrenda> listar();
	public void eliminar(int id);
}
