package pe.com.outfitpro.daoimpl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import pe.com.outfitpro.dao.IMetodoPagoDao;
import pe.com.outfitpro.entity.MetodoPago;

public class MetodoPagoDaoImpl implements IMetodoPagoDao, Serializable {

	private static final long serialVersionUID = 1L;
	@PersistenceContext(unitName = "a")
	private EntityManager em;
	
	@Transactional
	@Override
	public void insertar(MetodoPago obj) {
		try {
			em.persist(obj);
		}
		catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MetodoPago> listar() {
		List<MetodoPago> lista = new ArrayList<MetodoPago>();
		try {
			Query q = em.createQuery("select m from MetodoPago m order by tipopago asc"); //jpa sql
			lista = (List<MetodoPago>)q.getResultList();
		}
		catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return lista;
	}

	@Transactional
	@Override
	public void eliminar(int id) {
		MetodoPago obj = new MetodoPago();
		try {
			obj = em.getReference(MetodoPago.class, id);
			em.remove(obj);
		}
		catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}
}
