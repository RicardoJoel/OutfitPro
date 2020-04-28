package pe.com.outfitpro.serviceimpl;

import java.io.Serializable;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;

import pe.com.outfitpro.dao.IDescuentoDao;
import pe.com.outfitpro.entity.Descuento;
import pe.com.outfitpro.service.IDescuentoService;

@Named
@RequestScoped
public class DescuentoServiceImpl implements IDescuentoService, Serializable {

	private static final long serialVersionUID = 1L;
	@Inject //para que no se ejecute la interfaz sino la implementacion del DAO
	private IDescuentoDao md;
	
	@Override
	public void insertar(Descuento obj) {
		md.insertar(obj);
	}

	@Override
	public List<Descuento> listar() {
		return md.listar();
	}

	@Override
	public void eliminar(int id) {
		md.eliminar(id);
	}
}
