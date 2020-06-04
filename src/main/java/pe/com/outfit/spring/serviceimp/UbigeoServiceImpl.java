package pe.com.outfit.spring.serviceimp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pe.com.outfit.spring.model.Ubigeo;
import pe.com.outfit.spring.repository.IUbigeoRepository;
import pe.com.outfit.spring.service.IUbigeoService;

@Service
public class UbigeoServiceImpl implements IUbigeoService{
	@Autowired
	private IUbigeoRepository md;
	
	
	@Override
	@Transactional
	public void insertar(Ubigeo obj) {
		try {
			md.save(obj);
		}
		catch(Exception ex) {
			System.out.println("Ocurrió un error");
		}
	}

	@Override
	@Transactional
	public List<Ubigeo> listar() {
		return md.findAll();
	}

	@Override
	@Transactional
	public void eliminar(int id) {
		md.deleteById(id);		
	}
}
