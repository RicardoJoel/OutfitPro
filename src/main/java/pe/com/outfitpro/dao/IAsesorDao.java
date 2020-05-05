package pe.com.outfitpro.dao;

import java.util.List;

import pe.com.outfitpro.entity.Asesor;

public interface IAsesorDao {
	public void insertar(Asesor obj);
	public List<Asesor> listar();
	public void eliminar(int id);
}
