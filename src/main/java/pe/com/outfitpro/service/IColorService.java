package pe.com.outfitpro.service;

import java.util.List;

import pe.com.outfitpro.entity.Color;

public interface IColorService {
	public void insertar(Color obj);
	public List<Color> listar();
	public void eliminar(int id);
}
