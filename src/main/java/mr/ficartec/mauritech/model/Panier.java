package mr.ficartec.mauritech.model;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

public class Panier implements Serializable {

	private Long id;
	private int items;
	private float total;
	private Map<Long, Ligne> produits;

	// ------ CONSTRUCTOR -------//
	public Panier() {
		this.produits = new HashMap<Long, Ligne>();
	}

	// ----- GETTERS AND SETTERS -------//
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public int getItems() {
		items = produits.size();
		return items;
	}

	public void setItems(int items) {
		this.items = items;
	}

	public float getTotal() {
		total = 0;
		for (Map.Entry<Long, Ligne> produit : produits.entrySet()) {
			Produit p = produit.getValue().getProduit();
			int quantite = produit.getValue().getQuantite();
			total += p.getPrix() * quantite;
		}
		return total;
	}

	public void setTotal(float total) {
		this.total = total;
	}

	public Map<Long, Ligne> getProduits() {
		return produits;
	}

	public void setProduits(Map<Long, Ligne> produits) {
		this.produits = produits;
	}

	// ---- UTILS METHODS -------//
	public void ajouter(Produit produit, int quantite) {
		Ligne ligne = new Ligne(produit, quantite);
		this.produits.put(produit.getIdProduit(), ligne);
	}

	public void supprimer(Long idProduit) {
		this.produits.remove(idProduit);
	}

	public void modifier(Produit produit, int quantite) {
		Ligne ligne = new Ligne(produit, quantite);
		produits.replace(produit.getIdProduit(), ligne);
	}

	public float somme() {
		total = 0;
		for (Map.Entry<Long, Ligne> produit : produits.entrySet()) {
			Produit p = produit.getValue().getProduit();
			int quantite = produit.getValue().getQuantite();
			total += p.getPrix() * quantite;
		}
		return total;
	}

	// ---- Ligne de panier -------//
	public class Ligne {
		private Produit produit;
		private int quantite;

		public Ligne(Produit produit, int quantite) {
			this.produit = produit;
			this.quantite = quantite;
		}

		public Ligne() {
		}

		public Produit getProduit() {
			return produit;
		}

		public void setProduit(Produit produit) {
			this.produit = produit;
		}

		public int getQuantite() {
			return quantite;
		}

		public void setQuantite(int quantite) {
			this.quantite = quantite;
		}
	}
}
