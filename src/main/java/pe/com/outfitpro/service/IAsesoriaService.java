package pe.com.outfitpro.service;

import java.util.List;

import pe.com.outfitpro.entity.Asesoria;

public interface IAsesoriaService {
	public void insertar(Asesoria obj);
	public List<Asesoria> listar();
	public void eliminar(int id);
}
