package pe.com.outfitpro.service;

import java.util.List;

import pe.com.outfitpro.entity.Comercio;

public interface IComercioService {
	public void insertar(Comercio objeto);
	public List<Comercio> listar();
	public void eliminar(int codigo);
}
