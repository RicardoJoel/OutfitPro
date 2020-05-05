package pe.com.outfitpro.dao;

import java.util.List;

import pe.com.outfitpro.entity.Cliente;

public interface IClienteDao {
	public void insertar(Cliente obj);
	public List<Cliente> listar();
	public void eliminar(int id);
}
