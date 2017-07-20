package mr.ficartec.mauritech.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.transaction.annotation.Transactional;

import mr.ficartec.mauritech.model.Adresse;
import mr.ficartec.mauritech.model.Client;
import mr.ficartec.mauritech.model.Commande;
import mr.ficartec.mauritech.model.Favoris;
import mr.ficartec.mauritech.model.LigneDeCommande;
import mr.ficartec.mauritech.model.Plainte;
import mr.ficartec.mauritech.model.Produit;

@Transactional
public class ClientDAOImpl implements ClientDAO {
	@PersistenceContext
	private EntityManager em;

	@Override
	public Long ajouter(Adresse a, Long idClient) {
		Client c = em.find(Client.class, idClient);
		a.setClient(c);
		em.persist(a);
		return a.getIdAdresse();
	}

	@Override
	public Long ajouter(Client c) {
		em.persist(c);
		return c.getIdClient();
	}
	
	@Override
	public Long ajouter(LigneDeCommande l) {
		em.persist(l);
		return l.getIdLigne();
	}
	
	@Override
	public Long ajouter(Commande c) {
		em.persist(c);
		return c.getIdCommande();
	}

	@Override
	public Long ajouter(Plainte p) {
		em.persist(p);
		return p.getIdPlainte();
	}

	@Override
	public List<Adresse> listAdresses(Long idClient) {
		Query req = em.createQuery("SELECT a FROM Adresse a WHERE a.client.idClient = :x AND a.defaut = false");
		req.setParameter("x", idClient);
		return req.getResultList();
	}

	@Override
	public void modifier(Client c) {
		em.merge(c);
	}
	
	@Override
	public void modifier(Adresse a) {
		em.merge(a);
	}

	@Override
	public Client getClient(String mail) {
		Query req = em.createQuery("SELECT c FROM Client c WHERE c.mail = :x");
		req.setParameter("x", mail);
		try{
			return (Client) req.getSingleResult();
		}catch(Exception e){
			return null;
		}
	}
	
	@Override
	public Client getClientTel(String telephone) {
		Query req = em.createQuery("SELECT c FROM Client c WHERE c.mail = :x");
		req.setParameter("x", telephone);
		try{
			return (Client) req.getSingleResult();
		}catch(Exception e){
			return null;
		}
	}
	
	@Override
	public Client getClientNIN(String NIN) {
		Query req = em.createQuery("SELECT c FROM Client c WHERE c.mail = :x");
		req.setParameter("x", NIN);
		try{
			return (Client) req.getSingleResult();
		}catch(Exception e){
			return null;
		}
	}

	@Override
	public Adresse getDefaultAdress(Long idClient) {
			Query req = em.createQuery("SELECT a FROM Adresse a WHERE a.client.idClient = :x AND a.defaut = true");
			req.setParameter("x", idClient);
			return (Adresse) req.getSingleResult();
	}

	@Override
	public Adresse getAdresse(Long idAdresse) {
		Query req = em.createQuery("SELECT a FROM Adresse a WHERE a.idAdresse = :x");
		req.setParameter("x", idAdresse);
		try{
			return (Adresse) req.getSingleResult();
		}catch(Exception e){
			return null;
		}
	}
	
	@Override
	public Adresse getAdresse(Long idAdresse, Long idClient) {
		Query req = em.createQuery("SELECT a FROM Adresse a WHERE a.idAdresse = :x AND a.client.idClient = :y");
		req.setParameter("x", idAdresse);
		req.setParameter("y", idClient);
		try{
			return (Adresse) req.getSingleResult();
		}catch(Exception e){
			return null;
		}
	}
	
	private boolean isDefault(Long idAdresse){
		List<Adresse> list = em.createQuery("SELECT a FROM Adresse a WHERE a.defaut = true").getResultList();
		for (Adresse adresse : list) {
			if(adresse.getIdAdresse() == idAdresse) return true;
		}
		return false;
	}
	
	@Override
	public void SupprimerAdresse(Long idAdresse) {
		if(!isDefault(idAdresse))
			em.remove(em.find(Adresse.class, idAdresse));
	}

	@Override
	public List<Commande> listeCommande(Long idClient) {
		Query req = em.createQuery("SELECT c FROM Commande c WHERE c.client.idClient = :x");
		req.setParameter("x", idClient);
		return req.getResultList();
	}

	@Override
	public List<Commande> listeCommandeEnAttente(Long idClient) {
		Query req = em.createQuery("SELECT c FROM Commande c WHERE c.client.idClient = :x and confirme = false and annule = false");
		req.setParameter("x", idClient);
		return req.getResultList();
	}

	@Override
	public Commande getCommande(Long idCommande, Long idClient) {
		Query req = em.createQuery("SELECT c FROM Commande c WHERE c.idCommande = :x AND c.client.idClient = :y");
		req.setParameter("x", idCommande);
		req.setParameter("y", idClient);
		System.out.println("commande : " + idCommande);
		System.out.println("client : " + idClient);
		try{
			return (Commande) req.getSingleResult();
		}catch(Exception e){
			return null;
		}
	}

	@Override
	public void modifier(Commande cmd) {
		em.merge(cmd);
		
	}

	@Override
	public List<LigneDeCommande> listeProduits(Long idCommande) {
		Query req = em.createQuery("SELECT l FROM LigneDeCommande l WHERE l.commande.idCommande = :x");
		req.setParameter("x", idCommande);
		if(req.getResultList().isEmpty()) return null;
		return req.getResultList();
	}

	// FAVORIS
	@Override
	public Long ajouter(Favoris f, Long idClient, Long idProduit) {
		f.setClient(em.find(Client.class, idClient));
		f.setProduit(em.find(Produit.class, idProduit));
		em.persist(f);
		return f.getIdFavoris();
	}

	@Override
	public List<Favoris> listFavoris(Long idClient) {
		Query req = em.createQuery("SELECT f FROM Favoris f WHERE f.client.idClient = :x");
		req.setParameter("x", idClient);
		return req.getResultList();
	}

	@Override
	public void Supprimer(Long idFavoris) {
		em.remove(em.find(Favoris.class, idFavoris));
	}

	@Override
	public Favoris getFavoris(Long idProduit, Long idClient) {
		Query req = em.createQuery("SELECT f FROM Favoris f WHERE f.client.idClient = :x AND f.produit.idProduit = :y");
		req.setParameter("x", idClient);
		req.setParameter("y", idProduit);
		try {
			return (Favoris) req.getSingleResult();
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public LigneDeCommande getLigne(Long idCommande, Long idProduit) {
		Query req = em.createQuery("SELECT l FROM LigneDeCommande l WHERE l.commande.idCommande = :x AND l.produit.idProduit = :y");
		req.setParameter("x", idCommande);
		req.setParameter("y", idProduit);
		try {
			return (LigneDeCommande) req.getSingleResult();
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public void modifier(LigneDeCommande l) {
		em.merge(l);		
	}

	@Override
	public void Supprimer(Long idCommande, Long idProduit) {
		LigneDeCommande l = getLigne(idCommande, idProduit);
		em.remove(em.find(LigneDeCommande.class, l.getIdLigne()));
	}

	@Override
	public void SupprimerCommande(Long idCommande) {
		em.remove(em.find(Commande.class, idCommande));
	}


}
