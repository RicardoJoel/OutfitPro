package pe.com.outfitpro.service;

import java.util.List;

import pe.com.outfitpro.entity.Perfil;

public interface IPerfilService {
	public void insertar(Perfil obj);
	public List<Perfil> listar();
	public Perfil buscarPorNombre(String nombre);
	public void eliminar(int id);
}
