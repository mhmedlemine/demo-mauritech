package mr.ficartec.mauritech.controller;


import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import mr.ficartec.mauritech.dao.CategorieDAO;
import mr.ficartec.mauritech.dao.ClientDAO;
import mr.ficartec.mauritech.dao.ProduitDAO;
import mr.ficartec.mauritech.model.Client;
import mr.ficartec.mauritech.model.Favoris;
import mr.ficartec.mauritech.model.Panier;
import mr.ficartec.mauritech.model.Produit;

@Controller
@RequestMapping("/home")
public class MainController {

	@Autowired
	private CategorieDAO daoCat;
	@Autowired
	private ProduitDAO daoProd;
	@Autowired
	public Panier panier;
	@Autowired
	private ClientDAO daoCl;
	
	@RequestMapping(method = RequestMethod.GET)
	public String home(ModelMap model) {
		model.addAttribute("panier", panier);
		model.addAttribute("categories", daoCat.listCtegories());
		return "home";
	}
	
	@RequestMapping(value="/produits",method = RequestMethod.GET)
	public String produit(ModelMap model,@RequestParam(value = "categorie", required = false) String categorie,@RequestParam(value = "page", required = false) Integer page) {
		if(page == null)
			page = 1;
        int recordsPerPage = 15;
        List<Produit> list = daoProd.listProduits(categorie, (page - 1) * recordsPerPage, recordsPerPage);
		int nbreDeProduits = daoProd.getNbreProduits(categorie);
		int nbreDePages = (int) Math.ceil(nbreDeProduits * 1.0 / recordsPerPage);
		Long idClient = 0L;
				
		Collection<? extends GrantedAuthority> roleList = SecurityContextHolder
		        .getContext().getAuthentication().getAuthorities();

		if (roleList.contains(new SimpleGrantedAuthority("ROLE_CLIENT"))){
			UserDetails userDetails =
					 (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			Client client = daoCl.getClient(userDetails.getUsername());
			model.addAttribute("client", client);
			idClient = client.getIdClient();
		}
		Favoris favoris[] = new Favoris[list.size()];
		int i = 0;
		for (Produit produit : list) {
			favoris[i] = daoCl.getFavoris(produit.getIdProduit(), idClient);
			i++;
		}
		

		model.addAttribute("panier", panier);
		model.addAttribute("categorie", categorie);
		model.addAttribute("categories", daoCat.listCtegories());
		model.addAttribute("nbreDePages", nbreDePages);
		model.addAttribute("pageCourente", page);
		model.addAttribute("produits", list);
		model.addAttribute("favoris", favoris);
		
		return "produits";
	}
	
	@RequestMapping(value="/recherche",method = RequestMethod.GET)
	public String recherche(ModelMap model,@RequestParam(value = "cle", required = false) String cle,
			@RequestParam(value = "categorie", required = false) String categorie,@RequestParam(value = "page", required = false) Integer page) {
		if(categorie != null){
			if(page == null)
				page = 1;
	        int recordsPerPage = 15;
	        List<Produit> list = daoProd.rechercheProduits(categorie, cle, (page - 1) * recordsPerPage, recordsPerPage);
			int nbreDeProduits = daoProd.getNbreProduits(categorie, cle);
			int nbreDePages = (int) Math.ceil(nbreDeProduits * 1.0 / recordsPerPage);
	        
			model.addAttribute("panier", panier);
			model.addAttribute("cle", cle);
			model.addAttribute("categorie", categorie);
			model.addAttribute("categories", daoCat.listCtegories());
			model.addAttribute("nbreDePages", nbreDePages);
			model.addAttribute("nbreDeProduits", nbreDeProduits);
			model.addAttribute("pageCourente", page);
			model.addAttribute("produits", list);
			
			Collection<? extends GrantedAuthority> roleList = SecurityContextHolder
			        .getContext().getAuthentication().getAuthorities();
	
			if (roleList.contains(new SimpleGrantedAuthority("ROLE_CLIENT"))){
				UserDetails userDetails =
						 (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
				Client client = daoCl.getClient(userDetails.getUsername());
				model.addAttribute("client", client);
			}
		}
		return "recherche";
	}
	
	@RequestMapping(value="/contact",method = RequestMethod.GET)
	public String contact(ModelMap model) {
		
		return "contact";
	}
	
	@RequestMapping(value="/details",method = RequestMethod.GET)
	public String details(ModelMap model,@RequestParam(value = "produit", required = false) Long idProduit) {
		
		Long idClient = 0L;
		Collection<? extends GrantedAuthority> roleList = SecurityContextHolder
		        .getContext().getAuthentication().getAuthorities();

		if (roleList.contains(new SimpleGrantedAuthority("ROLE_CLIENT"))){
			UserDetails userDetails =
					 (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			Client client = daoCl.getClient(userDetails.getUsername());
			idClient = client.getIdClient();
			model.addAttribute("client", client);
		}
		
		model.addAttribute("panier", panier);
		model.addAttribute("favoris", daoCl.getFavoris(idProduit, idClient));
		model.addAttribute("produit", daoProd.getProduit(idProduit));
		return "details";
	}
	
	@RequestMapping(value="/panieradd",method = RequestMethod.GET)
	public String panierAdd(ModelMap model,@RequestParam(value = "produit", required = false) Long idProduit,
			@RequestParam(value = "quantite", required = false) int quantite){
		Produit p = daoProd.getProduit(idProduit);
		panier.ajouter(p, quantite);
		model.addAttribute("panier", panier);
		model.addAttribute("lignes", panier.getProduits().values());
		model.addAttribute("produit", p);
		return "panier";
	}
	
	@RequestMapping(value="/panier")
	public String panier(ModelMap model) {
			
		model.addAttribute("panier", panier);
		model.addAttribute("lignes", panier.getProduits().values());
		return "panier";
	}
	
	@RequestMapping(value="/vider")
	public String vider() {
		panier.getProduits().clear();
		panier.setItems(0);
		return ("redirect:http://localhost:8080/mauritech/home/panier");
	}
	
	@RequestMapping(value="/supprimer")
	public String sup(@RequestParam(value = "produit", required = false) Long idProduit) {
		panier.supprimer(idProduit);
		return ("redirect:http://localhost:8080/mauritech/home/panier");
	}
	
	@RequestMapping(value="/calculer")
	public String calc(@RequestParam(value = "produit", required = false) Long idProduit,
			@RequestParam(value = "quantite", required = false) int quantite) {
		Produit p = daoProd.getProduit(idProduit);
		panier.modifier(p, quantite);
		return ("redirect:http://localhost:8080/mauritech/home/panier");
	}
	
	@RequestMapping(value="/commander")
	public String cmd() {
		
		return "home";
	}

}
