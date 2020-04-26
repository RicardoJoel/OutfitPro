package pe.com.outfitpro.serviceimpl;

import java.io.Serializable;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;

import pe.com.outfitpro.dao.IPerfilDao;
import pe.com.outfitpro.entity.Perfil;
import pe.com.outfitpro.service.IPerfilService;

@Named
@RequestScoped
public class PerfilServiceImpl implements IPerfilService, Serializable {

	private static final long serialVersionUID = 1L;
	@Inject //para que no se ejecute la interfaz sino la implementacion del DAO
	private IPerfilDao md;
	
	@Override
	public void insertar(Perfil obj) {
		md.insertar(obj);
	}

	@Override
	public List<Perfil> listar() {
		return md.listar();
	}

	@Override
	public void eliminar(int id) {
		md.eliminar(id);
	}
}
