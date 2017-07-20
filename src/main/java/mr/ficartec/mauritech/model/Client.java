package mr.ficartec.mauritech.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
public class Client {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long idClient;
	private String nom;
	private String prenom;
	private Date naissance;
	private String mail;
	private String password;
	private boolean enabled;
	private String role;
	private String photo;
	private String piece;
	private String nin;
	@OneToMany(mappedBy="client")
	@Cascade({CascadeType.SAVE_UPDATE, CascadeType.DELETE})
	private List<Adresse> adresses;
	@OneToMany(mappedBy="client")
	@Cascade({CascadeType.SAVE_UPDATE, CascadeType.DELETE})
	private List<Commande> commandes;
	@OneToMany(mappedBy="client")
	@Cascade({CascadeType.SAVE_UPDATE, CascadeType.DELETE})
	private List<Favoris> favoris;
	
	public Client(Long idClient, String nom, String prenom, Date naissance, String mail, String password,
			boolean enabled, String role, String photo, String piece, String nin) {
		super();
		this.idClient = idClient;
		this.nom = nom;
		this.prenom = prenom;
		this.naissance = naissance;
		this.mail = mail;
		this.password = password;
		this.enabled = enabled;
		this.role = role;
		this.photo = photo;
		this.piece = piece;
		this.nin = nin;
	}
	public Client() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Long getIdClient() {
		return idClient;
	}
	public void setIdClient(Long idClient) {
		this.idClient = idClient;
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
	public Date getNaissance() {
		return naissance;
	}
	public void setNaissance(Date naissance) {
		this.naissance = naissance;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getPiece() {
		return piece;
	}
	public void setPiece(String piece) {
		this.piece = piece;
	}
	public String getNin() {
		return nin;
	}
	public void setNin(String nin) {
		this.nin = nin;
	}
	public List<Adresse> getAdresses() {
		return adresses;
	}
	public void setAdresses(List<Adresse> adresses) {
		this.adresses = adresses;
	}
	public List<Commande> getCommandes() {
		return commandes;
	}
	public void setCommandes(List<Commande> commandes) {
		this.commandes = commandes;
	}
	
	
		
}
