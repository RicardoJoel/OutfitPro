package pe.com.outfit.spring.serviceimp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pe.com.outfit.spring.model.Cliente;
import pe.com.outfit.spring.repository.IClienteRepository;
import pe.com.outfit.spring.service.IClienteService;

@Service
public class ClienteServiceImpl implements IClienteService{
	@Autowired
	private IClienteRepository md;
	
	
	@Override
	@Transactional
	public void insertar(Cliente obj) {
		try {
			md.save(obj);
		}
		catch(Exception ex) {
			System.out.println("Ocurrió un error");
		}
	}

	@Override
	@Transactional
	public List<Cliente> listar() {
		return md.findAll();
	}

	@Override
	@Transactional
	public void eliminar(int id) {
		md.deleteById(id);		
	}
}
