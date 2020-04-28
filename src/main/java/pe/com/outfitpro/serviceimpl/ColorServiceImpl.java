package pe.com.outfitpro.serviceimpl;

import java.io.Serializable;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;

import pe.com.outfitpro.dao.IColorDao;
import pe.com.outfitpro.entity.Color;
import pe.com.outfitpro.service.IColorService;

@Named
@RequestScoped
public class ColorServiceImpl implements IColorService, Serializable {

	private static final long serialVersionUID = 1L;
	@Inject //para que no se ejecute la interfaz sino la implementacion del DAO
	private IColorDao md;
	
	@Override
	public void insertar(Color obj) {
		md.insertar(obj);
	}

	@Override
	public List<Color> listar() {
		return md.listar();
	}

	@Override
	public void eliminar(int id) {
		md.eliminar(id);
	}
}
