package mr.ficartec.mauritech.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.transaction.annotation.Transactional;

import mr.ficartec.mauritech.model.Categorie;
import mr.ficartec.mauritech.model.Produit;

@Transactional
public class ProduitDAOImpl implements ProduitDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override 
	public Long ajouter(Produit p, Long idCategorie) {
		Categorie c = em.find(Categorie.class, idCategorie);
		p.setCategorie(c);
		em.persist(p);	
		return p.getIdProduit();
	}

	@Override
	public List<Produit> AllProduits() {
		Query req = em.createQuery("SELECT p FROM Produit p");		
		return req.getResultList();
	}

	@Override
	public List<Produit> listProduits(Long idCategorie) {
		Query req = em.createQuery("SELECT p FROM Produit p WHERE p.categorie.idCategorie = :x");
		req.setParameter("x", idCategorie);
		return req.getResultList();
	}
	
	@Override
	public List<Produit> listProduits(String categorie) {
		Query req = em.createQuery("SELECT p FROM Produit p WHERE p.categorie.libelle = :x");
		req.setParameter("x", categorie);
		return req.getResultList();
	}

	@Override
	public Produit getProduit(Long idProduit) {
		return em.find(Produit.class, idProduit);
	}

	@Override
	public void modifier(Produit prod) {
		em.merge(prod);		
	}

	@Override
	public List<Produit> AllProduits(int offset, int nbreDeProduits) {
		Query req = em.createQuery("SELECT p FROM Produit p LIMIT :x, :y");	
		req.setParameter("x", offset);
		req.setParameter("y", nbreDeProduits);
		return req.getResultList();
	}

	@Override
	public List<Produit> listProduits(String categorie, int offset, int nbreDeProduits) {
		Query req = em.createQuery("SELECT p FROM Produit p WHERE p.categorie.libelle = :x");
		req.setParameter("x", categorie);
		req.setFirstResult(offset);
		req.setMaxResults(nbreDeProduits);
		return req.getResultList();
	}

	@Override
	public int getNbreProduits(String categorie) {
		Query req = em.createQuery("SELECT p FROM Produit p WHERE p.categorie.libelle = :x");
		req.setParameter("x", categorie);
		return req.getResultList().size();
	}

	@Override
	public List<Produit> rechercheProduits(String categorie, String cle, int offset, int nbreDeProduits) {
		Query req;
		if(categorie.equals("Tous"))
			req = em.createQuery("SELECT p FROM Produit p WHERE p.libelle LIKE :y");
		else{
			req = em.createQuery("SELECT p FROM Produit p WHERE p.categorie.libelle = :x AND p.libelle LIKE :y");
			req.setParameter("x", categorie);
		}
		req.setParameter("y", cle);
		req.setFirstResult(offset);
		req.setMaxResults(nbreDeProduits);
		return req.getResultList();
	}

	@Override
	public int getNbreProduits(String categorie, String cle) {
		Query req = em.createQuery("SELECT p FROM Produit p WHERE p.categorie.libelle = :x AND p.libelle LIKE :y");
		req.setParameter("x", categorie);
		req.setParameter("y", cle);
		return req.getResultList().size();
	}

}
