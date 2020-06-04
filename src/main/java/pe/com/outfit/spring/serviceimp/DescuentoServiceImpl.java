package pe.com.outfit.spring.serviceimp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pe.com.outfit.spring.model.Descuento;
import pe.com.outfit.spring.repository.IDescuentoRepository;
import pe.com.outfit.spring.service.IDescuentoService;

@Service
public class DescuentoServiceImpl implements IDescuentoService{
	@Autowired
	private IDescuentoRepository md;
	
	
	@Override
	@Transactional
	public void insertar(Descuento obj) {
		try {
			md.save(obj);
		}
		catch(Exception ex) {
			System.out.println("Ocurrió un error");
		}
	}

	@Override
	@Transactional
	public List<Descuento> listar() {
		return md.findAll();
	}

	@Override
	@Transactional
	public void eliminar(int id) {
		md.deleteById(id);		
	}
}
