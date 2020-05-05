package pe.com.outfitpro.daoimpl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import pe.com.outfitpro.dao.IPreferenciaDao;
import pe.com.outfitpro.entity.Preferencia;

public class PreferenciaDaoImpl implements IPreferenciaDao, Serializable {

	private static final long serialVersionUID = 1L;
	@PersistenceContext(unitName = "a")
	private EntityManager em;
	
	@Transactional
	@Override
	public void insertar(Preferencia obj) {
		try {
			em.merge(obj);
		}
		catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Preferencia> listar() {
		List<Preferencia> lista = new ArrayList<Preferencia>();
		try {
			Query q = em.createQuery("select m from Preferencia m order by nombre asc"); //jpa sql
			lista = (List<Preferencia>)q.getResultList();
		}
		catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return lista;
	}

	@Transactional
	@Override
	public void eliminar(int id) {
		Preferencia obj = new Preferencia();
		try {
			obj = em.getReference(Preferencia.class, id);
			em.remove(obj);
		}
		catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}
}
