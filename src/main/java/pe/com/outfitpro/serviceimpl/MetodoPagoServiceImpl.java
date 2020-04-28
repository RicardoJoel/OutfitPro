package pe.com.outfitpro.serviceimpl;

import java.io.Serializable;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;

import pe.com.outfitpro.dao.IMetodoPagoDao;
import pe.com.outfitpro.entity.MetodoPago;
import pe.com.outfitpro.service.IMetodoPagoService;

@Named
@RequestScoped
public class MetodoPagoServiceImpl implements IMetodoPagoService, Serializable {

	private static final long serialVersionUID = 1L;
	@Inject //para que no se ejecute la interfaz sino la implementacion del DAO
	private IMetodoPagoDao md;
	
	@Override
	public void insertar(MetodoPago obj) {
		md.insertar(obj);
	}

	@Override
	public List<MetodoPago> listar() {
		return md.listar();
	}

	@Override
	public void eliminar(int id) {
		md.eliminar(id);
	}
}
