package pe.com.outfit.spring.serviceimp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pe.com.outfit.spring.model.Asesoria;
import pe.com.outfit.spring.repository.IAsesoriaRepository;
import pe.com.outfit.spring.service.IAsesoriaService;

@Service
public class AsesoriaServiceImpl implements IAsesoriaService{

	@Autowired
	private IAsesoriaRepository md;
	
	
	@Override
	@Transactional
	public void insertar(Asesoria obj) {
		try {
			md.save(obj);
		}
		catch(Exception ex) {
			System.out.println("Ocurrió un error");
		}
	}

	@Override
	@Transactional
	public List<Asesoria> listar() {
		return md.findAll();
	}

	@Override
	@Transactional
	public void eliminar(int id) {
		md.deleteById(id);		
	}
}