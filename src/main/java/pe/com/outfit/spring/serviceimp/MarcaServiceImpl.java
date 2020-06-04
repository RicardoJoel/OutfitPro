package pe.com.outfit.spring.serviceimp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pe.com.outfit.spring.model.Marca;
import pe.com.outfit.spring.repository.IMarcaRepository;
import pe.com.outfit.spring.service.IMarcaService;

@Service
public class MarcaServiceImpl implements IMarcaService{
	@Autowired
	private IMarcaRepository md;
	
	
	@Override
	@Transactional
	public void insertar(Marca obj) {
		try {
			md.save(obj);
		}
		catch(Exception ex) {
			System.out.println("Ocurrió un error");
		}
	}

	@Override
	@Transactional
	public List<Marca> listar() {
		return md.findAll();
	}

	@Override
	@Transactional
	public void eliminar(int id) {
		md.deleteById(id);		
	}
}
