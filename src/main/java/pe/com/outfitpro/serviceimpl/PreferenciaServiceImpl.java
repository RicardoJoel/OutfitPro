package pe.com.outfitpro.serviceimpl;

import java.io.Serializable;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;

import pe.com.outfitpro.dao.IPreferenciaDao;
import pe.com.outfitpro.entity.Preferencia;
import pe.com.outfitpro.service.IPreferenciaService;

@Named
@RequestScoped
public class PreferenciaServiceImpl implements IPreferenciaService, Serializable {

	private static final long serialVersionUID = 1L;
	@Inject //para que no se ejecute la interfaz sino la implementacion del DAO
	private IPreferenciaDao md;
	
	@Override
	public void insertar(Preferencia obj) {
		md.insertar(obj);
	}

	@Override
	public List<Preferencia> listar() {
		return md.listar();
	}

	@Override
	public void eliminar(int id) {
		md.eliminar(id);
	}
}
