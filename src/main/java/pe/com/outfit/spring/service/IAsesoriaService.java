package pe.com.outfit.spring.service;

import java.util.List;

import pe.com.outfit.spring.model.Asesoria;

public interface IAsesoriaService {
	public void insertar(Asesoria obj);
	public List<Asesoria> listar();
	public void eliminar(int id);
}
