package pe.com.outfitpro.service;

import java.util.List;

import pe.com.outfitpro.entity.Asesor;

public interface IAsesorService {
	public void insertar(Asesor obj);
	public List<Asesor> listar();
	public void eliminar(int id);
}
