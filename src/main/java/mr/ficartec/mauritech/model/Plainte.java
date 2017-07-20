package mr.ficartec.mauritech.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Plainte {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long idPlainte;
	@Column(columnDefinition="TEXT")
	private String plainte;
	private String sujet;
	private Date date;
	@ManyToOne
	@JoinColumn(name="iDclient")
	private Client client;
	@ManyToOne
	@JoinColumn(name="idcommande")
	private Commande commande;
	public Plainte() {
		
	}
	public Plainte(Long idPlainte, String plainte, Date date, Client client, Commande commande) {
		super();
		this.idPlainte = idPlainte;
		this.plainte = plainte;
		this.date = date;
		this.client = client;
		this.commande = commande;
	}
	
	public String getSujet() {
		return sujet;
	}
	public void setSujet(String sujet) {
		this.sujet = sujet;
	}
	public Long getIdPlainte() {
		return idPlainte;
	}
	public void setIdPlainte(Long idPlainte) {
		this.idPlainte = idPlainte;
	}
	public String getPlainte() {
		return plainte;
	}
	public void setPlainte(String plainte) {
		this.plainte = plainte;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Client getClient() {
		return client;
	}
	public void setClient(Client client) {
		this.client = client;
	}
	public Commande getCommande() {
		return commande;
	}
	public void setCommande(Commande commande) {
		this.commande = commande;
	}
	
}
