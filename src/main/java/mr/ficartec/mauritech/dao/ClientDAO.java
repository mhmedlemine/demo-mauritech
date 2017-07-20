package mr.ficartec.mauritech.dao;

import java.util.List;


import mr.ficartec.mauritech.model.*;

public interface ClientDAO {
	public Long ajouter(Adresse a, Long idClient);
	public Long ajouter(Client c);
	public Long ajouter(Plainte p);
	public void modifier(Client c);
	public void modifier(LigneDeCommande l);
	public void modifier(Adresse a);
	public Client getClient(String mail);
	public Client getClientTel(String telephone);
	public Client getClientNIN(String NIN);
	public List<Adresse> listAdresses(Long idClient);
	public Adresse getDefaultAdress(Long idClient);
	public Adresse getAdresse(Long idAdresse);
	public Long ajouter(Commande c);
	public Long ajouter(LigneDeCommande l);
	public List<Commande> listeCommande(Long idClient);
	public List<Commande> listeCommandeEnAttente(Long idClient);
	public void SupprimerCommande(Long idCommande);
	public List<LigneDeCommande> listeProduits(Long idCommande);
	public LigneDeCommande getLigne(Long idCommande, Long idProduit);
	public void Supprimer(Long idCommande, Long idProduit);
	public Commande getCommande(Long idCommande, Long idClient);
	public void modifier(Commande cmd);
	
	public void SupprimerAdresse(Long idAdresse);
	public Adresse getAdresse(Long idAdresse, Long idClient);
	
	public Long ajouter(Favoris f, Long idClient, Long idProduit);
	public List<Favoris> listFavoris(Long idClient);
	public Favoris getFavoris(Long idProduit, Long idClient);
	public void Supprimer(Long idFavoris);
	
	
}
