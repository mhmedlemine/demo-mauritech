package mr.ficartec.mauritech.model;

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
import org.hibernate.annotations.OnDelete;

@Entity
public class Adresse {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long idAdresse;
	private String nom;
	private String prenom;
	private String ville;
	private String rue;
	private String telephone;
	private boolean defaut;
	@ManyToOne
	@JoinColumn(name="idClient")
	private Client client;
	@OneToMany(mappedBy="adresse")
	@Cascade({CascadeType.SAVE_UPDATE, CascadeType.DELETE})
	private List<Commande> commandes;
	
	private String toString;
	
	public String getToString() {
		toString = getNom() + " " + getPrenom() + "<br>";
		toString += getTelephone() + "<br>";
		toString += getRue() + ", " + getVille();
		return toString;
	}

	@Override
	public String toString() {
		toString = getNom() + " " + getPrenom() + "<br>";
		toString += getTelephone() + "<br>";
		toString += getRue() + ", " + getVille() + "<br>";
		return toString;
	}

	public void setToString(String toString) {
		this.toString = toString;
	}

	public Adresse(Long idAdresse, String nom, String prenom, String ville, String rue, String telephone,
			boolean defaut, Client client) {
		this.idAdresse = idAdresse;
		this.nom = nom;
		this.prenom = prenom;
		this.ville = ville;
		this.rue = rue;
		this.telephone = telephone;
		this.defaut = defaut;
		this.client = client;
	}

	public Adresse() {}
	
	public boolean isDefaut() {
		return defaut;
	}
	public void setDefaut(boolean defaut) {
		this.defaut = defaut;
	}
	
	public Long getIdAdresse() {
		return idAdresse;
	}
	public void setIdAdresse(Long idAdresse) {
		this.idAdresse = idAdresse;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public String getVille() {
		return ville;
	}
	public void setVille(String ville) {
		this.ville = ville;
	}
	public String getRue() {
		return rue;
	}
	public void setRue(String rue) {
		this.rue = rue;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public Client getClient() {
		return client;
	}
	public void setClient(Client client) {
		this.client = client;
	}

}
