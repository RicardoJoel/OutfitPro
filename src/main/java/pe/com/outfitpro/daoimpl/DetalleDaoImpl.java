package pe.com.outfitpro.daoimpl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import pe.com.outfitpro.dao.IDetalleDao;
import pe.com.outfitpro.entity.Detalle;

public class DetalleDaoImpl implements IDetalleDao, Serializable {

	private static final long serialVersionUID = 1L;
	@PersistenceContext(unitName = "a")
	private EntityManager em;
	
	@Transactional
	@Override
	public void insertar(Detalle obj) {
		try {
			em.persist(obj);
		}
		catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Detalle> listar() {
		List<Detalle> lista = new ArrayList<Detalle>();
		try {
			Query q = em.createQuery("select m from Detalle m order by nombre asc"); //jpa sql
			lista = (List<Detalle>)q.getResultList();
		}
		catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return lista;
	}

	@Transactional
	@Override
	public void eliminar(int id) {
		Detalle obj = new Detalle();
		try {
			obj = em.getReference(Detalle.class, id);
			em.remove(obj);
		}
		catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}
}
