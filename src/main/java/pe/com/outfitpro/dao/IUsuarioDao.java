package pe.com.outfitpro.dao;

import java.util.List;

import pe.com.outfitpro.entity.Usuario;

public interface IUsuarioDao {
	public void insertar(Usuario obj);
	public List<Usuario> listar();
	public void eliminar(int id);
}
