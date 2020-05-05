package pe.com.outfitpro.service;

import java.util.List;

import pe.com.outfitpro.entity.Cliente;

public interface IClienteService {
	public void insertar(Cliente obj);
	public List<Cliente> listar();
	public void eliminar(int id);
}
