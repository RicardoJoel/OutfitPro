package pe.com.outfit.spring.service;

import java.util.List;

import pe.com.outfit.spring.model.Color;

public interface IColorService {
	public void insertar(Color obj);
	public List<Color> listar();
	public void eliminar(int id);
}
