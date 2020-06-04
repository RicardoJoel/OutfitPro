package pe.com.outfit.spring.service;

import java.util.List;

import pe.com.outfit.spring.model.Cliente;

public interface IClienteService {
	public void insertar(Cliente obj);
	public List<Cliente> listar();
	public void eliminar(int id);
}
