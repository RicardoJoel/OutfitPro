package pe.com.outfitpro.service;

import java.util.List;

import pe.com.outfitpro.entity.Preferencia;

public interface IPreferenciaService {
	public void insertar(Preferencia obj);
	public List<Preferencia> listar();
	public void eliminar(int id);
}
