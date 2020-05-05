package pe.com.outfitpro.serviceimpl;

import java.io.Serializable;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;

import pe.com.outfitpro.dao.IAsesorDao;
import pe.com.outfitpro.entity.Asesor;
import pe.com.outfitpro.service.IAsesorService;

@Named
@RequestScoped
public class AsesorServiceImpl implements IAsesorService, Serializable {

	private static final long serialVersionUID = 1L;
	@Inject //para que no se ejecute la interfaz sino la implementacion del DAO
	private IAsesorDao md;
	
	@Override
	public void insertar(Asesor obj) {
		md.insertar(obj);
	}

	@Override
	public List<Asesor> listar() {
		return md.listar();
	}

	@Override
	public void eliminar(int id) {
		md.eliminar(id);
	}
}
