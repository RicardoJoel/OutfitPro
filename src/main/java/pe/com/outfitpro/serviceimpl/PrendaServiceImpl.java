package pe.com.outfitpro.serviceimpl;

import java.io.Serializable;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;

import pe.com.outfitpro.dao.IPrendaDao;
import pe.com.outfitpro.entity.Prenda;
import pe.com.outfitpro.service.IPrendaService;

@Named
@RequestScoped
public class PrendaServiceImpl implements IPrendaService, Serializable {

	private static final long serialVersionUID = 1L;
	@Inject //para que no se ejecute la interfaz sino la implementacion del DAO
	private IPrendaDao md;
	
	@Override
	public void insertar(Prenda obj) {
		md.insertar(obj);
	}

	@Override
	public List<Prenda> listar() {
		return md.listar();
	}

	@Override
	public void eliminar(int id) {
		md.eliminar(id);
	}
}
