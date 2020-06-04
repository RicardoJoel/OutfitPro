package pe.com.outfit.spring.serviceimp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pe.com.outfit.spring.model.Compra;
import pe.com.outfit.spring.repository.ICompraRepository;
import pe.com.outfit.spring.service.ICompraService;

@Service
public class CompraServiceImpl implements ICompraService{
	@Autowired
	private ICompraRepository md;
	
	
	@Override
	@Transactional
	public void insertar(Compra obj) {
		try {
			md.save(obj);
		}
		catch(Exception ex) {
			System.out.println("Ocurrió un error");
		}
	}

	@Override
	@Transactional
	public List<Compra> listar() {
		return md.findAll();
	}

	@Override
	@Transactional
	public void eliminar(int id) {
		md.deleteById(id);		
	}
}
