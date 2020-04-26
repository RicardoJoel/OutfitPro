package pe.com.outfitpro.serviceimpl;

import java.io.Serializable;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;

import pe.com.outfitpro.dao.IMarcaDao;
import pe.com.outfitpro.entity.Marca;
import pe.com.outfitpro.service.IMarcaService;

@Named
@RequestScoped
public class MarcaServiceImpl implements IMarcaService, Serializable {

	private static final long serialVersionUID = 1L;
	@Inject //para que no se ejecute la interfaz sino la implementacion del DAO
	private IMarcaDao md;
	
	@Override
	public void insertar(Marca obj) {
		md.insertar(obj);
	}

	@Override
	public List<Marca> listar() {
		return md.listar();
	}

	@Override
	public void eliminar(int id) {
		md.eliminar(id);
	}
}
