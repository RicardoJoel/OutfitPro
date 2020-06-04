package pe.com.outfit.spring.serviceimp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pe.com.outfit.spring.model.Comercio;
import pe.com.outfit.spring.repository.IComercioRepository;
import pe.com.outfit.spring.service.IComercioService;

@Service
public class ComercioServiceImpl implements IComercioService{
	@Autowired
	private IComercioRepository md;
	
	
	@Override
	@Transactional
	public void insertar(Comercio obj) {
		try {
			md.save(obj);
		}
		catch(Exception ex) {
			System.out.println("Ocurrió un error");
		}
	}

	@Override
	@Transactional
	public List<Comercio> listar() {
		return md.findAll();
	}

	@Override
	@Transactional
	public void eliminar(int id) {
		md.deleteById(id);		
	}
}
