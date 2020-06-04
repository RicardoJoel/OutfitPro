package pe.com.outfit.spring.serviceimp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pe.com.outfit.spring.model.TipoPrenda;
import pe.com.outfit.spring.repository.ITipoPrendaRepository;
import pe.com.outfit.spring.service.ITipoPrendaService;

@Service
public class TipoPrendaServiceImpl implements ITipoPrendaService{
	@Autowired
	private ITipoPrendaRepository md;
	
	
	@Override
	@Transactional
	public void insertar(TipoPrenda obj) {
		try {
			md.save(obj);
		}
		catch(Exception ex) {
			System.out.println("Ocurrió un error");
		}
	}

	@Override
	@Transactional
	public List<TipoPrenda> listar() {
		return md.findAll();
	}

	@Override
	@Transactional
	public void eliminar(int id) {
		md.deleteById(id);		
	}
}
