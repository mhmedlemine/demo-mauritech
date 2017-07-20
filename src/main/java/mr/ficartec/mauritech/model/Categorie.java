package mr.ficartec.mauritech.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
public class Categorie implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long idCategorie;
	private String libelle;
	@OneToMany(mappedBy="categorie")
	@Cascade({CascadeType.SAVE_UPDATE, CascadeType.DELETE})
	private List<Produit> produits;
	
	public Categorie() {	}
	public Categorie(Long idCategorie, String libelle) {
		this.idCategorie = idCategorie;
		this.libelle = libelle;
	}
	public Long getIdCategorie() {
		return idCategorie;
	}
	public void setIdCategorie(Long idCategorie) {
		this.idCategorie = idCategorie;
	}
	public String getLibelle() {
		return libelle;
	}
	public void setLibelle(String libelle) {
		this.libelle = libelle;
	}
}
