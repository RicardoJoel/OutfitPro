package pe.com.outfitpro.daoimpl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import pe.com.outfitpro.dao.IDetalleCompraDao;
import pe.com.outfitpro.entity.DetalleCompra;

public class DetalleCompraDaoImpl implements IDetalleCompraDao, Serializable {

	private static final long serialVersionUID = 1L;
	@PersistenceContext(unitName = "a")
	private EntityManager em;
	
	@Transactional
	@Override
	public void insertar(DetalleCompra obj) {
		try {
			em.merge(obj);
		}
		catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<DetalleCompra> listar() {
		List<DetalleCompra> lista = new ArrayList<DetalleCompra>();
		try {
			Query q = em.createQuery("select m from DetalleCompra m order by nombre asc"); //jpa sql
			lista = (List<DetalleCompra>)q.getResultList();
		}
		catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return lista;
	}

	@Transactional
	@Override
	public void eliminar(int id) {
		DetalleCompra obj = new DetalleCompra();
		try {
			obj = em.getReference(DetalleCompra.class, id);
			em.remove(obj);
		}
		catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}
}
