package pe.com.outfit.spring.service;

import java.util.List;

import pe.com.outfit.spring.model.Preferencia;

public interface IPreferenciaService {
	public void insertar(Preferencia obj);
	public List<Preferencia> listar();
	public void eliminar(int id);
}
