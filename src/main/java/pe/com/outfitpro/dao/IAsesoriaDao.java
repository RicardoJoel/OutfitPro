package pe.com.outfitpro.dao;

import java.util.List;

import pe.com.outfitpro.entity.Asesoria;

public interface IAsesoriaDao {
	public void insertar(Asesoria obj);
	public List<Asesoria> listar();
	public void eliminar(int id);
}
