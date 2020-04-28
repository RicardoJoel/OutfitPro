package pe.com.outfitpro.daoimpl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import pe.com.outfitpro.dao.IAsesoriaDao;
import pe.com.outfitpro.entity.Asesoria;

public class AsesoriaDaoImpl implements IAsesoriaDao, Serializable {

	private static final long serialVersionUID = 1L;
	@PersistenceContext(unitName = "a")
	private EntityManager em;
	
	@Transactional
	@Override
	public void insertar(Asesoria obj) {
		try {
			em.persist(obj);
		}
		catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Asesoria> listar() {
		List<Asesoria> lista = new ArrayList<Asesoria>();
		try {
			Query q = em.createQuery("select m from Asesoria m order by nombre asc"); //jpa sql
			lista = (List<Asesoria>)q.getResultList();
		}
		catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return lista;
	}

	@Transactional
	@Override
	public void eliminar(int id) {
		Asesoria obj = new Asesoria();
		try {
			obj = em.getReference(Asesoria.class, id);
			em.remove(obj);
		}
		catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}
}
