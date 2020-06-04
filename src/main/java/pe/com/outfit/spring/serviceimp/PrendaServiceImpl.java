package pe.com.outfit.spring.serviceimp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pe.com.outfit.spring.model.Prenda;
import pe.com.outfit.spring.repository.IPrendaRepository;
import pe.com.outfit.spring.service.IPrendaService;

@Service
public class PrendaServiceImpl implements IPrendaService{
	@Autowired
	private IPrendaRepository md;
	
	
	@Override
	@Transactional
	public void insertar(Prenda obj) {
		try {
			md.save(obj);
		}
		catch(Exception ex) {
			System.out.println("Ocurrió un error");
		}
	}

	@Override
	@Transactional
	public List<Prenda> listar() {
		return md.findAll();
	}

	@Override
	@Transactional
	public void eliminar(int id) {
		md.deleteById(id);		
	}
}
