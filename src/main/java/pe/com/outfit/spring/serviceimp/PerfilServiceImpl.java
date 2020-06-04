package pe.com.outfit.spring.serviceimp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pe.com.outfit.spring.model.Perfil;
import pe.com.outfit.spring.repository.IPerfilRepository;
import pe.com.outfit.spring.service.IPerfilService;

@Service
public class PerfilServiceImpl implements IPerfilService{
	@Autowired
	private IPerfilRepository md;
	
	
	@Override
	@Transactional
	public void insertar(Perfil obj) {
		try {
			md.save(obj);
		}
		catch(Exception ex) {
			System.out.println("Ocurrió un error");
		}
	}

	@Override
	@Transactional
	public List<Perfil> listar() {
		return md.findAll();
	}

	@Override
	@Transactional
	public void eliminar(int id) {
		md.deleteById(id);		
	}
}
