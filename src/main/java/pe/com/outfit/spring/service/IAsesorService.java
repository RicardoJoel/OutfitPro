package pe.com.outfit.spring.service;

import java.util.List;

import pe.com.outfit.spring.model.Asesor;

public interface IAsesorService {
	public void insertar(Asesor obj);
	public List<Asesor> listar();
	public void eliminar(int id);
}
