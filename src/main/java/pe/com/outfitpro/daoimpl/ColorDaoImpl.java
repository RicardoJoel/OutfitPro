package pe.com.outfitpro.daoimpl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import pe.com.outfitpro.dao.IColorDao;
import pe.com.outfitpro.entity.Color;

public class ColorDaoImpl implements IColorDao, Serializable {

	private static final long serialVersionUID = 1L;
	@PersistenceContext(unitName = "a")
	private EntityManager em;
	
	@Transactional
	@Override
	public void insertar(Color obj) {
		try {
			em.persist(obj);
		}
		catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Color> listar() {
		List<Color> lista = new ArrayList<Color>();
		try {
			Query q = em.createQuery("select m from Color m order by nombre asc"); //jpa sql
			lista = (List<Color>)q.getResultList();
		}
		catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return lista;
	}

	@Transactional
	@Override
	public void eliminar(int id) {
		Color obj = new Color();
		try {
			obj = em.getReference(Color.class, id);
			em.remove(obj);
		}
		catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}
}
