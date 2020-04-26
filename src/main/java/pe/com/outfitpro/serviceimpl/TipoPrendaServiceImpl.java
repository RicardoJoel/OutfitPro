package pe.com.outfitpro.serviceimpl;

import java.io.Serializable;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;

import pe.com.outfitpro.dao.ITipoPrendaDao;
import pe.com.outfitpro.entity.TipoPrenda;
import pe.com.outfitpro.service.ITipoPrendaService;

@Named
@RequestScoped
public class TipoPrendaServiceImpl implements ITipoPrendaService, Serializable {

	private static final long serialVersionUID = 1L;
	@Inject //para que no se ejecute la interfaz sino la implementacion del DAO
	private ITipoPrendaDao md;
	
	@Override
	public void insertar(TipoPrenda obj) {
		md.insertar(obj);
	}

	@Override
	public List<TipoPrenda> listar() {
		return md.listar();
	}

	@Override
	public void eliminar(int id) {
		md.eliminar(id);
	}
}
