package pe.com.outfit.spring.service;

import java.util.List;

import pe.com.outfit.spring.model.Perfil;

public interface IPerfilService {
	public void insertar(Perfil obj);
	public List<Perfil> listar();
	public Perfil buscarPorNombre(String nombre);
	public void eliminar(int id);
}
