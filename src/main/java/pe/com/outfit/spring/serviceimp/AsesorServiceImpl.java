package pe.com.outfit.spring.serviceimp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pe.com.outfit.spring.model.Asesor;
import pe.com.outfit.spring.repository.IAsesorRepository;
import pe.com.outfit.spring.service.IAsesorService;

@Service
public class AsesorServiceImpl implements IAsesorService{
	
	@Autowired
	private IAsesorRepository md;
	
	
	@Override
	@Transactional
	public void insertar(Asesor obj) {
		try {
			md.save(obj);
		}
		catch(Exception ex) {
			System.out.println("Ocurrió un error");
		}
	}

	@Override
	@Transactional
	public List<Asesor> listar() {
		return md.findAll();
	}

	@Override
	@Transactional
	public void eliminar(int id) {
		md.deleteById(id);		
	}
}
