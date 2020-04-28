package pe.com.outfitpro.serviceimpl;

import java.io.Serializable;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;

import pe.com.outfitpro.dao.IAsesoriaDao;
import pe.com.outfitpro.entity.Asesoria;
import pe.com.outfitpro.service.IAsesoriaService;

@Named
@RequestScoped
public class AsesoriaServiceImpl implements IAsesoriaService, Serializable {

	private static final long serialVersionUID = 1L;
	@Inject //para que no se ejecute la interfaz sino la implementacion del DAO
	private IAsesoriaDao md;
	
	@Override
	public void insertar(Asesoria obj) {
		md.insertar(obj);
	}

	@Override
	public List<Asesoria> listar() {
		return md.listar();
	}

	@Override
	public void eliminar(int id) {
		md.eliminar(id);
	}
}
