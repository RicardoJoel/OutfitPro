package pe.com.outfit.spring.serviceimp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pe.com.outfit.spring.model.DetalleCompra;
import pe.com.outfit.spring.repository.IDetalleCompraRepository;
import pe.com.outfit.spring.service.IDetalleCompraService;

@Service
public class DetalleCompraServiceImpl implements IDetalleCompraService{
	@Autowired
	private IDetalleCompraRepository md;
	
	
	@Override
	@Transactional
	public void insertar(DetalleCompra obj) {
		try {
			md.save(obj);
		}
		catch(Exception ex) {
			System.out.println("Ocurrió un error");
		}
	}

	@Override
	@Transactional
	public List<DetalleCompra> listar() {
		return md.findAll();
	}

	@Override
	@Transactional
	public void eliminar(int id) {
		md.deleteById(id);		
	}
}
