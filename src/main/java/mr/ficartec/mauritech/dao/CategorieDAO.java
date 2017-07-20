package mr.ficartec.mauritech.dao;

import java.util.List;

import mr.ficartec.mauritech.model.Categorie;

public interface CategorieDAO {
	public Long ajouter(Categorie c);
	public List<Categorie> listCtegories();
	public Categorie getCategorie(Long idCategorie);
}
