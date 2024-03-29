package pe.com.outfitpro.serviceimpl;

import java.io.Serializable;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;

import pe.com.outfitpro.dao.IComercioDao;
import pe.com.outfitpro.entity.Comercio;
import pe.com.outfitpro.service.IComercioService;

@Named
@RequestScoped
public class ComercioServiceImpl implements IComercioService, Serializable {

	private static final long serialVersionUID = 1L;
	@Inject //para que no se ejecute la interfaz sino la implementacion del DAO
	private IComercioDao md;
	
	@Override
	public void insertar(Comercio obj) {
		md.insertar(obj);
	}

	@Override
	public List<Comercio> listar() {
		return md.listar();
	}

	@Override
	public void eliminar(int id) {
		md.eliminar(id);
	}
}
