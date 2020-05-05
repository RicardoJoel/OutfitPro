package pe.com.outfitpro.serviceimpl;

import java.io.Serializable;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;

import pe.com.outfitpro.dao.IDetalleCompraDao;
import pe.com.outfitpro.entity.DetalleCompra;
import pe.com.outfitpro.service.IDetalleCompraService;

@Named
@RequestScoped
public class DetalleCompraServiceImpl implements IDetalleCompraService, Serializable {

	private static final long serialVersionUID = 1L;
	@Inject //para que no se ejecute la interfaz sino la implementacion del DAO
	private IDetalleCompraDao md;
	
	@Override
	public void insertar(DetalleCompra obj) {
		md.insertar(obj);
	}

	@Override
	public List<DetalleCompra> listar() {
		return md.listar();
	}

	@Override
	public void eliminar(int id) {
		md.eliminar(id);
	}
}
