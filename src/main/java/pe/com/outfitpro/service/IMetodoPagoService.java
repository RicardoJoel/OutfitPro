package pe.com.outfitpro.service;

import java.util.List;

import pe.com.outfitpro.entity.MetodoPago;

public interface IMetodoPagoService {
	public void insertar(MetodoPago obj);
	public List<MetodoPago> listar();
	public void eliminar(int id);
}
