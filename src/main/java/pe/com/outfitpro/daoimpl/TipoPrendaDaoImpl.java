package pe.com.outfitpro.daoimpl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import pe.com.outfitpro.dao.ITipoPrendaDao;
import pe.com.outfitpro.entity.TipoPrenda;

public class TipoPrendaDaoImpl implements ITipoPrendaDao, Serializable {

	private static final long serialVersionUID = 1L;
	@PersistenceContext(unitName = "a")
	private EntityManager em;
	
	@Transactional
	@Override
	public void insertar(TipoPrenda obj) {
		try {
			em.merge(obj);
		}
		catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TipoPrenda> listar() {
		List<TipoPrenda> lista = new ArrayList<TipoPrenda>();
		try {
			Query q = em.createQuery("select m from TipoPrenda m order by nombre asc"); //jpa sql
			lista = (List<TipoPrenda>)q.getResultList();
		}
		catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return lista;
	}

	@Transactional
	@Override
	public void eliminar(int id) {
		TipoPrenda obj = new TipoPrenda();
		try {
			obj = em.getReference(TipoPrenda.class, id);
			em.remove(obj);
		}
		catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}
}
