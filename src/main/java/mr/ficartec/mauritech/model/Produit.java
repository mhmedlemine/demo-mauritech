package mr.ficartec.mauritech.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
public class Produit implements Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long idProduit;
	private String libelle;
	private int prix;
	private int quantite;
	private int quantiteDispo;
	private String description;
	private String image;
	@ManyToOne
	@JoinColumn(name="idCategorie")
	private Categorie categorie;
	@OneToMany(mappedBy="produit")
	@Cascade({CascadeType.SAVE_UPDATE, CascadeType.DELETE})
	private List<LigneDeCommande> commandes;
	@OneToMany(mappedBy="produit")
	@Cascade({CascadeType.SAVE_UPDATE, CascadeType.DELETE})
	private List<Favoris> favoris;
	
	public Produit(Long idProduit, String libelle, int prix, int quantite, int quantiteDispo, String description,
			String image, Categorie categorie) {
		super();
		this.idProduit = idProduit;
		this.libelle = libelle;
		this.prix = prix;
		this.quantite = quantite;
		this.quantiteDispo = quantiteDispo;
		this.description = description;
		this.image = image;
		this.categorie = categorie;
	}
	public Produit() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Long getIdProduit() {
		return idProduit;
	}
	public void setIdProduit(Long idProduit) {
		this.idProduit = idProduit;
	}
	public String getLibelle() {
		return libelle;
	}
	public void setLibelle(String libelle) {
		this.libelle = libelle;
	}
	public int getPrix() {
		return prix;
	}
	public void setPrix(int prix) {
		this.prix = prix;
	}
	public int getQuantite() {
		return quantite;
	}
	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}
	public int getQuantiteDispo() {
		return quantiteDispo;
	}
	public void setQuantiteDispo(int quantiteDispo) {
		this.quantiteDispo = quantiteDispo;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Categorie getCategorie() {
		return categorie;
	}
	public void setCategorie(Categorie categorie) {
		this.categorie = categorie;
	}
	
	
}
