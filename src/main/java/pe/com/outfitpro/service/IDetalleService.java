package pe.com.outfitpro.service;

import java.util.List;

import pe.com.outfitpro.entity.Detalle;

public interface IDetalleService {
	public void insertar(Detalle obj);
	public List<Detalle> listar();
	public void eliminar(int id);
}
