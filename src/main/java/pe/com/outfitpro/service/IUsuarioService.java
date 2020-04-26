package pe.com.outfitpro.service;

import java.util.List;

import pe.com.outfitpro.entity.Usuario;

public interface IUsuarioService {
	public void insertar(Usuario obj);
	public List<Usuario> listar();
	public void eliminar(int id);
}
