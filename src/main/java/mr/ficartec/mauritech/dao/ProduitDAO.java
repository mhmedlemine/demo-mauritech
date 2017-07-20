package mr.ficartec.mauritech.dao;

import java.util.List;

import mr.ficartec.mauritech.model.Produit;

public interface ProduitDAO {
	public Long ajouter(Produit p, Long idCategorie);
	public List<Produit> AllProduits();
	public List<Produit> AllProduits(int offset, int nbreDeProduits);
	public List<Produit> listProduits(Long idCategorie);
	public List<Produit> listProduits(String categorie, int offset, int nbreDeProduits);
	public List<Produit> rechercheProduits(String categorie, String cle, int offset, int nbreDeProduits);
	public int getNbreProduits(String categorie);
	public int getNbreProduits(String categorie, String cle);
	public Produit getProduit(Long idProduit);
	public List<Produit> listProduits(String categorie);
	public void modifier(Produit prod);
}
