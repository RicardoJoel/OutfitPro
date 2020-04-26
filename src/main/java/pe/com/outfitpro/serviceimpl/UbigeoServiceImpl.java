package pe.com.outfitpro.serviceimpl;

import java.io.Serializable;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;

import pe.com.outfitpro.dao.IUbigeoDao;
import pe.com.outfitpro.entity.Ubigeo;
import pe.com.outfitpro.service.IUbigeoService;

@Named
@RequestScoped
public class UbigeoServiceImpl implements IUbigeoService, Serializable {

	private static final long serialVersionUID = 1L;
	@Inject //para que no se ejecute la interfaz sino la implementacion del DAO
	private IUbigeoDao md;
	
	@Override
	public void insertar(Ubigeo obj) {
		md.insertar(obj);
	}

	@Override
	public List<Ubigeo> listar() {
		return md.listar();
	}

	@Override
	public void eliminar(int id) {
		md.eliminar(id);
	}
}
