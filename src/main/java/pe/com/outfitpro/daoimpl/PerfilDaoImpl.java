package pe.com.outfitpro.daoimpl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import pe.com.outfitpro.dao.IPerfilDao;
import pe.com.outfitpro.entity.Perfil;

public class PerfilDaoImpl implements IPerfilDao, Serializable {

	private static final long serialVersionUID = 1L;
	@PersistenceContext(unitName = "a")
	private EntityManager em;
	
	@Transactional
	@Override
	public void insertar(Perfil obj) {
		try {
			em.merge(obj);
		}
		catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Perfil> listar() {
		List<Perfil> lista = new ArrayList<Perfil>();
		try {
			Query q = em.createQuery("select m from Perfil m order by nombre asc"); //jpa sql
			lista = (List<Perfil>)q.getResultList();
		}
		catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return lista;
	}

	@Override
	public Perfil buscarPorNombre(String nombre) {
		Perfil perfil = null;
		try {
			Query q = em.createQuery("select m from Perfil m where nombre = ?1"); //jpa sql
			q.setParameter(1, nombre);
			perfil = (Perfil)q.getResultList().get(0);
		}
		catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return perfil;
	}

	@Transactional
	@Override
	public void eliminar(int id) {
		Perfil obj = new Perfil();
		try {
			obj = em.getReference(Perfil.class, id);
			em.remove(obj);
		}
		catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}
}
