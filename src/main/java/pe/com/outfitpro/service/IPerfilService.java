package pe.com.outfitpro.service;

import java.util.List;

import pe.com.outfitpro.entity.Perfil;

public interface IPerfilService {
	public void insertar(Perfil objeto);
	public List<Perfil> listar();
	public void eliminar(int codigo);
}
