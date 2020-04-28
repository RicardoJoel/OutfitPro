package pe.com.outfitpro.dao;

import java.util.List;

import pe.com.outfitpro.entity.Preferencia;

public interface IPreferenciaDao {
	public void insertar(Preferencia obj);
	public List<Preferencia> listar();
	public void eliminar(int id);
}
