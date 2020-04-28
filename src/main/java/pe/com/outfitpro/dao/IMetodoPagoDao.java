package pe.com.outfitpro.dao;

import java.util.List;

import pe.com.outfitpro.entity.MetodoPago;

public interface IMetodoPagoDao {
	public void insertar(MetodoPago obj);
	public List<MetodoPago> listar();
	public void eliminar(int id);
}
