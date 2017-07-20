package mr.ficartec.mauritech.model;


import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

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
public class Commande {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long idCommande;
	private Date dateCommande;
	private Date dateLivraison;
	@ManyToOne
	@JoinColumn(name="idAdresse")
	private Adresse adresse;
	private int nombreProduits;
	private double sommeTotal;
	private boolean livre;
	private boolean enAttente;
	private boolean confirme;
	private boolean annule;
	@ManyToOne
	@JoinColumn(name="idclient")
	private Client client;
	@OneToMany(mappedBy="commande")
	@Cascade({CascadeType.SAVE_UPDATE, CascadeType.DELETE})
	private List<LigneDeCommande> produits;
	
	public Commande(Long idCommande, Date dateCommande, Date dateLivraison, Adresse adresse, double sommeTotal,
			boolean livre, Client client) {
		super();
		this.idCommande = idCommande;
		this.dateCommande = dateCommande;
		this.dateLivraison = dateLivraison;
		this.adresse = adresse;
		this.sommeTotal = sommeTotal;
		this.livre = livre;
		this.client = client;
	}
	public Commande() {	}
		
	public boolean isEnAttente() {
		return enAttente;
	}
	public void setEnAttente(boolean enAttente) {
		this.enAttente = enAttente;
	}
	public boolean isConfirme() {
		return confirme;
	}
	public void setConfirme(boolean confirme) {
		this.confirme = confirme;
	}
	public int getNombreProduits() {
		return nombreProduits;
	}
	public void setNombreProduits(int nombreProduits) {
		this.nombreProduits = nombreProduits;
	}
	public boolean isAnnule() {
		return annule;
	}
	public void setAnnule(boolean annule) {
		this.annule = annule;
	}
	public Long getIdCommande() {
		return idCommande;
	}
	public void setIdCommande(Long idCommande) {
		this.idCommande = idCommande;
	}
	public Date dateCommande(){
		return this.dateCommande;
	}
	public String getDateCommande() {
		DateFormat format_fr = DateFormat.getDateInstance(DateFormat.FULL, Locale.FRENCH);
		return format_fr.format(dateCommande);
	}
	public void setDateCommande(Date dateCommande) {
		this.dateCommande = dateCommande;
	}
	public Date dateLivraison(){
		return this.dateLivraison;
	}
	public String getDateLivraison() {
		DateFormat format_fr = DateFormat.getDateInstance(DateFormat.FULL, Locale.FRENCH);
		return format_fr.format(dateLivraison);
	}
	public void setDateLivraison(Date dateLivraison) {
		this.dateLivraison = dateLivraison;
	}
	public Adresse getAdresse() {
		return adresse;
	}
	public void setAdresse(Adresse adresse) {
		this.adresse = adresse;
	}
	public double getSommeTotal() {
		return sommeTotal;
	}
	public void setSommeTotal(double sommeTotal) {
		this.sommeTotal = sommeTotal;
	}
	public boolean isLivre() {
		return livre;
	}
	public void setLivre(boolean livre) {
		this.livre = livre;
	}
	public Client getClient() {
		return client;
	}
	public void setClient(Client client) {
		this.client = client;
	}
	public List<LigneDeCommande> getProduits() {
		return produits;
	}
	public void setProduits(List<LigneDeCommande> produits) {
		this.produits = produits;
	}
}
