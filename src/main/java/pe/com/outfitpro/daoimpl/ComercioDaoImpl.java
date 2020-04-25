package pe.com.outfitpro.daoimpl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import pe.com.outfitpro.dao.IComercioDao;
import pe.com.outfitpro.entity.Comercio;

public class ComercioDaoImpl implements IComercioDao, Serializable {

	private static final long serialVersionUID = 1L;
	@PersistenceContext(unitName = "a")
	private EntityManager em;
	
	@Transactional
	@Override
	public void insertar(Comercio objeto) {
		try {
			em.persist(objeto);
		}
		catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Comercio> listar() {
		List<Comercio> lista = new ArrayList<Comercio>();
		try {
			Query q = em.createQuery("select m from Comercio m order by nombre asc"); //jpa sql
			lista = (List<Comercio>)q.getResultList();
		}
		catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return lista;
	}

	@Transactional
	@Override
	public void eliminar(int codigo) {
		Comercio obj = new Comercio();
		try {
			obj = em.getReference(Comercio.class, codigo);
			em.remove(obj);
		}
		catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}
}
