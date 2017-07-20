package mr.ficartec.mauritech.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Favoris {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long idFavoris;
	@ManyToOne
	@JoinColumn(name="idClient")
	private Client client;
	@ManyToOne
	@JoinColumn(name="idProduit")
	private Produit produit;
	
	public Long getIdFavoris() {
		return idFavoris;
	}
	public void setIdFavoris(Long idFavoris) {
		this.idFavoris = idFavoris;
	}
	public Client getClient() {
		return client;
	}
	public void setClient(Client client) {
		this.client = client;
	}
	public Produit getProduit() {
		return produit;
	}
	public void setProduit(Produit produit) {
		this.produit = produit;
	}
	public Favoris(Long idFavoris, Client client, Produit produit) {
		super();
		this.idFavoris = idFavoris;
		this.client = client;
		this.produit = produit;
	}
	public Favoris() {}

}
