package pe.com.outfitpro.daoimpl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import pe.com.outfitpro.dao.IDescuentoDao;
import pe.com.outfitpro.entity.Descuento;

public class DescuentoDaoImpl implements IDescuentoDao, Serializable {

	private static final long serialVersionUID = 1L;
	@PersistenceContext(unitName = "a")
	private EntityManager em;
	
	@Transactional
	@Override
	public void insertar(Descuento obj) {
		try {
			em.persist(obj);
		}
		catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Descuento> listar() {
		List<Descuento> lista = new ArrayList<Descuento>();
		try {
			Query q = em.createQuery("select m from Descuento m order by nombre asc"); //jpa sql
			lista = (List<Descuento>)q.getResultList();
		}
		catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return lista;
	}

	@Transactional
	@Override
	public void eliminar(int id) {
		Descuento obj = new Descuento();
		try {
			obj = em.getReference(Descuento.class, id);
			em.remove(obj);
		}
		catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}
}
