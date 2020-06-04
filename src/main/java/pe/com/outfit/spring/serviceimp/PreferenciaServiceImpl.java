package pe.com.outfit.spring.serviceimp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pe.com.outfit.spring.model.Preferencia;
import pe.com.outfit.spring.repository.IPreferenciaRepository;
import pe.com.outfit.spring.service.IPreferenciaService;

@Service
public class PreferenciaServiceImpl implements IPreferenciaService{
	@Autowired
	private IPreferenciaRepository md;
	
	
	@Override
	@Transactional
	public void insertar(Preferencia obj) {
		try {
			md.save(obj);
		}
		catch(Exception ex) {
			System.out.println("Ocurrió un error");
		}
	}

	@Override
	@Transactional
	public List<Preferencia> listar() {
		return md.findAll();
	}

	@Override
	@Transactional
	public void eliminar(int id) {
		md.deleteById(id);		
	}
}
