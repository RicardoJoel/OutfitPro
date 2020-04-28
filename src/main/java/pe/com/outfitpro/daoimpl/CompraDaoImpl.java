package pe.com.outfitpro.daoimpl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import pe.com.outfitpro.dao.ICompraDao;
import pe.com.outfitpro.entity.Compra;

public class CompraDaoImpl implements ICompraDao, Serializable {

	private static final long serialVersionUID = 1L;
	@PersistenceContext(unitName = "a")
	private EntityManager em;
	
	@Transactional
	@Override
	public void insertar(Compra obj) {
		try {
			em.persist(obj);
		}
		catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Compra> listar() {
		List<Compra> lista = new ArrayList<Compra>();
		try {
			Query q = em.createQuery("select m from Compra m order by nombre asc"); //jpa sql
			lista = (List<Compra>)q.getResultList();
		}
		catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return lista;
	}

	@Transactional
	@Override
	public void eliminar(int id) {
		Compra obj = new Compra();
		try {
			obj = em.getReference(Compra.class, id);
			em.remove(obj);
		}
		catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}
}
