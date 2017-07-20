package mr.ficartec.mauritech.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import mr.ficartec.mauritech.model.Categorie;
import mr.ficartec.mauritech.model.Client;

public class CategorieDAOImpl implements CategorieDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Long ajouter(Categorie c) {
		em.persist(c);
		return c.getIdCategorie();
	}
	
	public Long ajouter(Client c) {
		em.persist(c);
		return c.getIdClient();
	}

	@Override
	public List<Categorie> listCtegories() {
		Query req = em.createQuery("SELECT c FROM Categorie c");
		return req.getResultList();
	}

	@Override
	public Categorie getCategorie(Long idCategorie) {
		return em.find(Categorie.class, idCategorie);
	}

}
