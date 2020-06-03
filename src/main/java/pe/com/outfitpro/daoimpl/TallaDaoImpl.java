package pe.com.outfitpro.daoimpl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import pe.com.outfitpro.dao.ITallaDao;
import pe.com.outfitpro.entity.Talla;

public class TallaDaoImpl implements ITallaDao, Serializable {

	private static final long serialVersionUID = 1L;
	@PersistenceContext(unitName = "a")
	private EntityManager em;
	
	@Transactional
	@Override
	public void insertar(Talla obj) {
		try {
			em.merge(obj);
		}
		catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Talla> listar() {
		List<Talla> lista = new ArrayList<Talla>();
		try {
			Query q = em.createQuery("select m from Talla m order by nombre asc"); //jpa sql
			lista = (List<Talla>)q.getResultList();
		}
		catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return lista;
	}

	@Transactional
	@Override
	public void eliminar(int id) {
		Talla obj = new Talla();
		try {
			obj = em.getReference(Talla.class, id);
			em.remove(obj);
		}
		catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}
}
