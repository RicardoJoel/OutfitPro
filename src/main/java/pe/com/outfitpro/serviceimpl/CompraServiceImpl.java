package pe.com.outfitpro.serviceimpl;

import java.io.Serializable;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;

import pe.com.outfitpro.dao.ICompraDao;
import pe.com.outfitpro.entity.Compra;
import pe.com.outfitpro.service.ICompraService;

@Named
@RequestScoped
public class CompraServiceImpl implements ICompraService, Serializable {

	private static final long serialVersionUID = 1L;
	@Inject //para que no se ejecute la interfaz sino la implementacion del DAO
	private ICompraDao md;
	
	@Override
	public void insertar(Compra obj) {
		md.insertar(obj);
	}

	@Override
	public List<Compra> listar() {
		return md.listar();
	}

	@Override
	public void eliminar(int id) {
		md.eliminar(id);
	}
}
