package pe.com.outfitpro.serviceimpl;

import java.io.Serializable;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;

import pe.com.outfitpro.dao.IDetalleDao;
import pe.com.outfitpro.entity.Detalle;
import pe.com.outfitpro.service.IDetalleService;

@Named
@RequestScoped
public class DetalleServiceImpl implements IDetalleService, Serializable {

	private static final long serialVersionUID = 1L;
	@Inject //para que no se ejecute la interfaz sino la implementacion del DAO
	private IDetalleDao md;
	
	@Override
	public void insertar(Detalle obj) {
		md.insertar(obj);
	}

	@Override
	public List<Detalle> listar() {
		return md.listar();
	}

	@Override
	public void eliminar(int id) {
		md.eliminar(id);
	}
}
