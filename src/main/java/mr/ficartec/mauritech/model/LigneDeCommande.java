package mr.ficartec.mauritech.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class LigneDeCommande {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long idLigne;
	@ManyToOne
	@JoinColumn(name="idProduit")
	private Produit produit;
	@ManyToOne
	@JoinColumn(name="idCommande")
	private Commande commande;
	private int quantite;
	
	public LigneDeCommande(Long idLigne, Produit produit, Commande commande, int quantite) {
		super();
		this.idLigne = idLigne;
		this.produit = produit;
		this.commande = commande;
		this.quantite = quantite;
	}
	public LigneDeCommande() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Long getIdLigne() {
		return idLigne;
	}
	public void setIdLigne(Long idLigne) {
		this.idLigne = idLigne;
	}
	public Produit getProduit() {
		return produit;
	}
	public void setProduit(Produit produit) {
		this.produit = produit;
	}
	public Commande getCommande() {
		return commande;
	}
	public void setCommande(Commande commande) {
		this.commande = commande;
	}
	public int getQuantite() {
		return quantite;
	}
	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}
	
}
