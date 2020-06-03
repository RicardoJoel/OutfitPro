package pe.com.outfitpro.dao;

import java.util.List;

import pe.com.outfitpro.entity.Perfil;

public interface IPerfilDao {
	public void insertar(Perfil obj);
	public List<Perfil> listar();
	public Perfil buscarPorNombre(String nombre);
	public void eliminar(int id);
}
