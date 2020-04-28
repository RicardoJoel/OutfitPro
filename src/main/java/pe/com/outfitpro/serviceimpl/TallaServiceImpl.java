package pe.com.outfitpro.serviceimpl;

import java.io.Serializable;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;

import pe.com.outfitpro.dao.ITallaDao;
import pe.com.outfitpro.entity.Talla;
import pe.com.outfitpro.service.ITallaService;

@Named
@RequestScoped
public class TallaServiceImpl implements ITallaService, Serializable {

	private static final long serialVersionUID = 1L;
	@Inject //para que no se ejecute la interfaz sino la implementacion del DAO
	private ITallaDao md;
	
	@Override
	public void insertar(Talla obj) {
		md.insertar(obj);
	}

	@Override
	public List<Talla> listar() {
		return md.listar();
	}

	@Override
	public void eliminar(int id) {
		md.eliminar(id);
	}
}
