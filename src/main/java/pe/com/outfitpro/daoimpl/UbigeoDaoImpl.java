package pe.com.outfitpro.daoimpl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import pe.com.outfitpro.dao.IUbigeoDao;
import pe.com.outfitpro.entity.Ubigeo;

public class UbigeoDaoImpl implements IUbigeoDao, Serializable {

	private static final long serialVersionUID = 1L;
	@PersistenceContext(unitName = "a")
	private EntityManager em;
	
	@Transactional
	@Override
	public void insertar(Ubigeo obj) {
		try {
			em.persist(obj);
		}
		catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Ubigeo> listar() {
		List<Ubigeo> lista = new ArrayList<Ubigeo>();
		try {
			Query q = em.createQuery("select m from Ubigeo m order by departamento, provincia, distrito asc"); //jpa sql
			lista = (List<Ubigeo>)q.getResultList();
		}
		catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return lista;
	}

	@Transactional
	@Override
	public void eliminar(int id) {
		Ubigeo obj = new Ubigeo();
		try {
			obj = em.getReference(Ubigeo.class, id);
			em.remove(obj);
		}
		catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}
}
