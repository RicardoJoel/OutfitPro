package pe.com.outfitpro.dao;

import java.util.List;

import pe.com.outfitpro.entity.Color;

public interface IColorDao {
	public void insertar(Color obj);
	public List<Color> listar();
	public void eliminar(int id);
}
