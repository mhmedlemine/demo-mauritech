package mr.ficartec.mauritech.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.mail.MailSendException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import mr.ficartec.mauritech.dao.ClientDAO;
import mr.ficartec.mauritech.dao.ProduitDAO;
import mr.ficartec.mauritech.model.Adresse;
import mr.ficartec.mauritech.model.Client;
import mr.ficartec.mauritech.model.Commande;
import mr.ficartec.mauritech.model.Favoris;
import mr.ficartec.mauritech.model.LigneDeCommande;
import mr.ficartec.mauritech.model.Panier;
import mr.ficartec.mauritech.model.Plainte;
import mr.ficartec.mauritech.model.Panier.Ligne;
import mr.ficartec.mauritech.model.Produit;

@Controller
public class CommandeController {

	@Autowired
	private ClientDAO dao;
	@Autowired
	private ProduitDAO daoProd;
	@Autowired
	private Panier panier;
	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping("/facture")
	public String facture(Model model, @RequestParam(value = "commande", required = false) Long idCommande) {

		Collection<? extends GrantedAuthority> roleList = SecurityContextHolder.getContext().getAuthentication()
				.getAuthorities();

		if (!roleList.contains(new SimpleGrantedAuthority("ROLE_CLIENT")))
			return "redirect:/login";

		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Client client = dao.getClient(userDetails.getUsername());

		Commande commande = dao.getCommande(idCommande, client.getIdClient());

		if (commande == null)
			return "redirect:/home";

		long diff = new Date().getTime() - commande.dateCommande().getTime();
		long diffHeures = diff / (60 * 60 * 1000);
		if(!commande.isLivre()){
			if(diffHeures >= 24){
				if(!commande.isEnAttente()){
					commande.setEnAttente(true);
					dao.modifier(commande);
				}
			}
		}
		System.out.println(diffHeures);
		commande.setProduits(dao.listeProduits(idCommande));
		model.addAttribute("diffHeures", diffHeures);
		model.addAttribute("commande", commande);
		return "facture";
	}

	@RequestMapping("/commande")
	public String commande(@RequestParam(value = "produit", required = false) Long idProduit,
			@RequestParam(value = "commande", required = false) Long idCommande,
			@RequestParam(value = "quantite", required = false) Integer quantite,
			@RequestParam(value = "remove", required = false) String remove,
			@RequestParam(value = "mod", required = false) String mod,
			@RequestParam(value = "annuler", required = false) String annuler) {

		Collection<? extends GrantedAuthority> roleList = SecurityContextHolder.getContext().getAuthentication()
				.getAuthorities();

		if (!roleList.contains(new SimpleGrantedAuthority("ROLE_CLIENT")))
			return "redirect:/login";

		if (mod != null) {
			LigneDeCommande l = dao.getLigne(idCommande, idProduit);
			if (l != null) {
				l.setQuantite(quantite);
				dao.modifier(l);
			}
		} else if (remove != null) {
			dao.Supprimer(idCommande, idProduit);
			if (dao.listeProduits(idCommande) == null) {
				dao.SupprimerCommande(idCommande);
				return "redirect:/profile";
			}
		} else if (annuler != null) {
			dao.SupprimerCommande(idCommande);
			return "redirect:/profile";
		}

		return "redirect:/facture?commande=" + idCommande;
	}

	@RequestMapping("/commander")
	public String cmd(Model model) {

		Collection<? extends GrantedAuthority> roleList = SecurityContextHolder.getContext().getAuthentication()
				.getAuthorities();

		if (!roleList.contains(new SimpleGrantedAuthority("ROLE_CLIENT")))
			return "redirect:/login";

		Collection<Ligne> lignes = panier.getProduits().values();
		if (lignes.isEmpty())
			return "redirect:/home";
		model.addAttribute("lignes", lignes);
		return "commander";
	}

	@RequestMapping("/commander/2")
	public String cmd2(Model model, HttpServletRequest request) {

		Collection<? extends GrantedAuthority> roleList = SecurityContextHolder.getContext().getAuthentication()
				.getAuthorities();

		if (!roleList.contains(new SimpleGrantedAuthority("ROLE_CLIENT")))
			return "redirect:/login";

		if (panier.getItems() == 0)
			return "redirect:" + request.getHeader("Referer");

		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Client client = dao.getClient(userDetails.getUsername());

		model.addAttribute("adresse", dao.getDefaultAdress(client.getIdClient()));
		model.addAttribute("adresses", dao.listAdresses(client.getIdClient()));
		model.addAttribute("client", client);
		model.addAttribute("command", new Adresse());
		model.addAttribute("lignes", panier.getProduits().values());
		return "livraison";
	}

	@RequestMapping(value = "/commander/2", method = RequestMethod.POST)
	public String addadress(@Valid Adresse command, Model model) {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Client client = dao.getClient(userDetails.getUsername());

		command.setDefaut(false);
		dao.ajouter(command, client.getIdClient());

		model.addAttribute("adresse", dao.getDefaultAdress(client.getIdClient()));
		model.addAttribute("client", client);
		model.addAttribute("command", new Adresse());
		model.addAttribute("lignes", panier.getProduits().values());
		return "redirect:/commander/2";
	}
	
	@RequestMapping(value = "/plainte", method = RequestMethod.GET)
	public String plainte(@RequestParam(value = "commande", required = false) Long idCommande, Model model) {
		Collection<? extends GrantedAuthority> roleList = SecurityContextHolder.getContext().getAuthentication()
				.getAuthorities();

		if (!roleList.contains(new SimpleGrantedAuthority("ROLE_CLIENT")))
			return "redirect:/login";

		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Client client = dao.getClient(userDetails.getUsername());

		Commande commande = dao.getCommande(idCommande, client.getIdClient());
		System.out.println(commande);
		if (commande == null)
			return "redirect:/home";

		model.addAttribute("commande", commande);
		model.addAttribute("client", client);
		return "plainte";
	}
	
	@RequestMapping(value = "/plainte", method = RequestMethod.POST)
	public String doPlainte(@RequestParam(value = "commande", required = false) Long idCommande, @RequestParam(value = "plainte", required = false) String plainte, 
			@RequestParam(value = "sujet", required = false) String sujet, Model model) {
		Collection<? extends GrantedAuthority> roleList = SecurityContextHolder.getContext().getAuthentication()
				.getAuthorities();

		if (!roleList.contains(new SimpleGrantedAuthority("ROLE_CLIENT")))
			return "redirect:/login";

		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Client client = dao.getClient(userDetails.getUsername());

		Commande commande = dao.getCommande(idCommande, client.getIdClient());
		System.out.println(commande);
		if (commande == null)
			return "redirect:/home";
		
		commande.setConfirme(true);
		dao.modifier(commande);
		
		Plainte p = new Plainte();
		p.setClient(client);
		p.setCommande(commande);
		p.setPlainte(plainte);
		p.setSujet(sujet);
		p.setDate(new java.util.Date());
		
		dao.ajouter(p);
		
		model.addAttribute("success", "Votre Plainte a ete passe vous serez informe des resultats.");
		return "plainte";
	}

	@RequestMapping(value = "/passercommande", method = RequestMethod.POST)
	public String cm2(@RequestParam(value = "adresse") Long idAdresse,
			@RequestParam(value = "dateLivraison") String livraison, Model model, HttpServletRequest request) {

		if (idAdresse == null || livraison.isEmpty())
			return "redirect:" + request.getHeader("Referer");

		Collection<? extends GrantedAuthority> roleList = SecurityContextHolder.getContext().getAuthentication()
				.getAuthorities();

		if (!roleList.contains(new SimpleGrantedAuthority("ROLE_CLIENT")))
			return "redirect:/login";

		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Client client = dao.getClient(userDetails.getUsername());

		Commande command = new Commande();

		command.setClient(client);
		command.setAdresse(dao.getAdresse(idAdresse));
		command.setLivre(false);
		command.setEnAttente(false);
		command.setConfirme(false);
		command.setNombreProduits(panier.getItems());
		command.setAnnule(false);
		command.setDateCommande(new java.util.Date());
		command.setDateLivraison(new Date(livraison));
		command.setSommeTotal(panier.somme());
		
		try {
			
			dao.ajouter(command);

			for (Ligne line : panier.getProduits().values()) {
				LigneDeCommande ligne = new LigneDeCommande();
				ligne.setCommande(command);
				ligne.setProduit(line.getProduit());
				ligne.setQuantite(line.getQuantite());
				dao.ajouter(ligne);
				Produit prod = daoProd.getProduit(line.getProduit().getIdProduit());
				prod.setQuantiteDispo(prod.getQuantiteDispo() - line.getQuantite());
				daoProd.modifier(prod);
			}
			command.setProduits(dao.listeProduits(command.getIdCommande()));
			/********************* EMAIL **********************************/
			final String message = message(client, command);

			final String to = client.getMail();
			final String sujet = "Facture #" + command.getIdCommande();
			mailSender.send(new MimeMessagePreparator() {

				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");

					messageHelper.setTo(to);
					messageHelper.setSubject(sujet);
					messageHelper.setText("", message);

					System.out.println("emailTo: " + to);
					System.out.println("sujet: " + sujet);
					System.out.println("message: " + message);

				}

			});
		} catch (MailSendException e) {
			dao.SupprimerCommande(command.getIdCommande());
			throw e;
		}
		
		panier.getProduits().clear();
		model.addAttribute("client", client);
		model.addAttribute("commande", command);
		model.addAttribute("panier", panier);
		return "successCommand";
	}

	/********** MESSAGE EMAIL ********************************************/
	public String message(Client client, Commande commande) {
		String message = "<meta charset='UTF-8'>" + "<meta http-equiv='X-UA-Compatible' content='IE = edge'>"
				+ "<meta name='viewport' content='width = device-width, initial-scale = 1'>"
				+ "<ink rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css' integrity='sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7' crossorigin='anonymous'>"
				+ "<link rel='stylesheet' type='text/css'"
				+ "	href='http://localhost:8080/mauritech/resources/bootstrap/css/custom.css'>"
				+ "<div style='background-color:#052806;color:white;margin-bottom'>"
				+ "	<img src='http://localhost:8080/mauritech/resources/img/logo.png'>" + "	<h1>Mauritehc</h1>"
				+ "</div>"
				+ "<div class='container' style='border-right:1px solid #dddddd;border-left:1px solid #dddddd;'>"
				+ "	<p>" + "		Bonjour" + client.getNom() + client.getPrenom()
				+ ", voici les détails de votre commande<br>" + "	</p>" + "	<div class='container'>"
				+ "		<div class='row'>" + "			<div class='col-xs-12'>"
				+ "				<div class='invoice-title'>"
				+ "					<div class='row' style='padding-left:17px;padding-right:17px;'>"
				+ "						<h3 class='' style='margin-bottom: '>Facture"
				+ "							<span class='text-danger'>#" + commande.getIdCommande() + "</span></h3>"
				+ "						<h5 class='pull-right text-warning'"
				+ "							style='margin-bottom: -10px;'>En attente</h5>" + "					</div>"
				+ "				</div>" + "				<hr>" + "				<div class='row'>"
				+ "					<div class='col-xs-6'>" + "						<address>"
				+ "							<strong>Adresse de livraison:</strong><br>" + commande.getAdresse().getNom()
				+ commande.getAdresse().getPrenom() + "<br>" + "							"
				+ commande.getAdresse().getTelephone() + "<br> " + commande.getAdresse().getVille() + "<br> "
				+ commande.getAdresse().getRue() + "						</address>" + "					</div>"
				+ "					<div class='col-xs-6 text-right'>" + "						<address>"
				+ "							<strong>Date pévue de livraison:</strong><br>" + commande.getDateLivraison()
				+ "<br>" + "							<br>" + "						</address>"
				+ "					</div>" + "					<div class='col-xs-6 text-right'>"
				+ "						<address>"
				+ "							<strong>Date de la commande:</strong><br>" + commande.getDateCommande()
				+ "<br>" + "							<br>" + "						</address>"
				+ "					</div>" + "" + "				</div>" + "				<div class='row'></div>"
				+ "			</div>" + "		</div>" + "" + "		<div class='row'>"
				+ "			<div class='col-md-12'>" + "				<div class='panel panel-default'>"
				+ "					<div class='panel-heading'>" + "						<h3 class='panel-title'>"
				+ "							<strong>Produits commandés</strong>" + "						</h3>"
				+ "					</div>" + "					<div class='panel-body'>"
				+ "						<span class='visible-xs text-info' style='padding-left:5px;'>faites défiler vers la droite</span>"
				+ "						<div class='table-responsive'>"
				+ "							<table class='table table-condensed'>"
				+ "								<thead>" + "									<tr>"
				+ "										<td><strong>Produit</strong></td>"
				+ "										<td class='text-center'><strong>Prix</strong></td>"
				+ "										<td class='text-center'><strong>Quantite</strong></td>"
				+ "										<td class='text-right'><strong>Totals</strong></td>"
				+ "									</tr>" + "								</thead>"
				+ "								<tbody>";
		System.out.println("Produits : " + commande.getProduits());
		for (LigneDeCommande ligne : commande.getProduits()) {
			message += "<tr>" + "										<td>"
					+ "											<a href='<%=request.getContextPath()%>/home/details?produit="
					+ ligne.getProduit().getIdProduit() + "'>"
					+ "												<img width='45' height='45' class='img-responsive hidden-xs'"
					+ "													src='<%=request.getContextPath()%>/resources/img/${ligne.produit.image }'>"
					+ "												<b>" + ligne.getProduit().getLibelle() + "</b>"
					+ "											</a>" + "										</td>"
					+ "										<td class='text-center'>" + ligne.getProduit().getPrix()
					+ " MRO</td>" + "										<td class='text-center'>"
					+ ligne.getQuantite() + "</td>" + "										<td class='text-right'>"
					+ ligne.getQuantite() * ligne.getProduit().getPrix() + " MRO</td>"
					+ "									</tr>";
		}

		message += "" + "									<tr>"
				+ "										<td class='no-line'></td>"
				+ "										<td class='no-line'></td>"
				+ "										<td class='no-line text-center'><strong>Total</strong></td>"
				+ "										<td class='no-line text-right'>" + commande.getSommeTotal()
				+ " MRO.</td>" + "										<td class='no-line text-right'></td>"
				+ "									</tr>" + "								</tbody>"
				+ "							</table>" + "						</div>" + "					</div>"
				+ "				</div>" + "			</div>" + "		</div>" + "	</div>" + "</div>";
		return message;
	}

	@RequestMapping(value = "/calculer")
	public String calc(@RequestParam(value = "produit", required = false) Long idProduit,
			@RequestParam(value = "quantite", required = false) int quantite) {
		Produit p = daoProd.getProduit(idProduit);
		panier.modifier(p, quantite);
		return ("redirect:/commander");
	}

	@RequestMapping(value = "/supp")
	public String sup(@RequestParam(value = "produit", required = false) Long idProduit) {
		panier.supprimer(idProduit);
		return ("redirect:/commander");
	}

	@RequestMapping(value = "/annulercmd")
	public String annuler(@RequestParam(value = "idCommande", required = false) Long idCommande, Model model) {

		Collection<? extends GrantedAuthority> roleList = SecurityContextHolder.getContext().getAuthentication()
				.getAuthorities();

		if (!roleList.contains(new SimpleGrantedAuthority("ROLE_CLIENT")))
			return "redirect:/login";

		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Client client = dao.getClient(userDetails.getUsername());

		Commande cmd = dao.getCommande(idCommande, client.getIdClient());
		cmd.setAnnule(true);
		dao.modifier(cmd);

		model.addAttribute("client", client);
		model.addAttribute("commandes", dao.listeCommandeEnAttente(client.getIdClient()));
		return ("redirect:/profile");
	}

}