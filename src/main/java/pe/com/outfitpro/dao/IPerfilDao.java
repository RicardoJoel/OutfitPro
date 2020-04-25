package pe.com.outfitpro.dao;

import java.util.List;

import pe.com.outfitpro.entity.Perfil;

public interface IPerfilDao {
	public void insertar(Perfil objeto);
	public List<Perfil> listar();
	public void eliminar(int codigo);
}
