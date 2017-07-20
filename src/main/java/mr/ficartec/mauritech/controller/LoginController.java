package mr.ficartec.mauritech.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import mr.ficartec.mauritech.dao.CategorieDAOImpl;
import mr.ficartec.mauritech.dao.ClientDAO;
import mr.ficartec.mauritech.dao.ProduitDAO;
import mr.ficartec.mauritech.model.Adresse;
import mr.ficartec.mauritech.model.Client;
import mr.ficartec.mauritech.model.Commande;
import mr.ficartec.mauritech.model.Favoris;
import mr.ficartec.mauritech.model.Panier;

@Controller
public class LoginController {

	private static final String IMG = "E:\\projet_fin_d_etudes\\env\\workspace\\Mauritech\\src\\main\\webapp\\resources\\img\\";
	@Autowired
	private ClientDAO dao;
	@Autowired
	private CategorieDAOImpl daoCat;
	@Autowired
	private ProduitDAO daoProd;
	@Autowired
	public Panier panier;
	@Autowired
	protected AuthenticationManager authenticationManager;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(ModelMap model) {
		model.addAttribute("panier", panier);
		model.addAttribute("categories", daoCat.listCtegories());
		return "home";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpServletRequest request, Model model) {

		Collection<? extends GrantedAuthority> roleList = SecurityContextHolder.getContext().getAuthentication()
				.getAuthorities();

		if (roleList.contains(new SimpleGrantedAuthority("ROLE_CLIENT"))) {
			return "redirect:/profile";
		}
		String url = null;
		String message = (request.getParameter("login_error") != null) ? "faux email ou faux mot de passe!" : null;
		if (request.getHeader("Referer") != null)
			if (request.getHeader("Referer").contains("/panier"))
				url = "commander";
		model.addAttribute("url", url);
		model.addAttribute("message", message);
		return "/login";
	}

	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup(HttpServletRequest request, Model model,
			@RequestParam(value = "url", required = false) String url) {

		Collection<? extends GrantedAuthority> roleList = SecurityContextHolder.getContext().getAuthentication()
				.getAuthorities();

		if (roleList.contains(new SimpleGrantedAuthority("ROLE_CLIENT"))) {
			return "redirect:/profile";
		}

		model.addAttribute("url", url);
		return "signup";
	}

	private Map<String, String> validate(HttpServletRequest request) {
		Map<String, String> erreurs = new HashMap<String, String>();

		// NOM
		if (request.getParameter("nom") != null && request.getParameter("nom").trim().length() != 0) {
			if (!request.getParameter("nom").matches("^[a-zA-Z]{1,}$"))
				erreurs.put("nom", "Le nom ne contient des lettres seulement.");
		} else {
			erreurs.put("nom", "Ce champ est obligatoire.");
		}
		// PRENOM
		if (request.getParameter("prenom") != null && request.getParameter("prenom").trim().length() != 0) {
			if (!request.getParameter("prenom").matches("^[a-zA-Z]{1,}$"))
				erreurs.put("prenom", "Le prenom contient des lettres selement.");
		} else {
			erreurs.put("prenom", "Ce champ est obligatoire.");
		}
		// Naissance
		if (request.getParameter("naissance") != null && request.getParameter("naissance").trim().length() != 0) {
			System.out.println("naissance : " + !request.getParameter("naissance").matches("^[0-9]{4}([/-])(0?[1-9]|1[012])\1(0?[1-9]|[12][0-9]|3[01])$"));
			if (!request.getParameter("naissance").matches("[1-9]\\d{3}[/]\\d{2}[/]\\d{2}"))
				erreurs.put("naissance", "le format de la date accepté est 'aaaa/mm/jj'.");
			else if(!request.getParameter("naissance").matches("19\\d{2}[/]\\d{2}[/]\\d{2}"))
				erreurs.put("naissance", "un client doit etre né entre 1900/01/01 et 1999/12/31.");
		} else {
			erreurs.put("naissance", "Ce champ est obligatoire.");
		}
		// NIN
		if (request.getParameter("nin") != null && request.getParameter("nin").trim().length() != 0) {
			if (!request.getParameter("nin").matches("^\\d+$"))
				erreurs.put("nin", "le NIN est composé de chiffres seulement.");
			else if (dao.getClientNIN(request.getParameter("nin")) != null)
				erreurs.put("nin", "un client avec ce NIN existe deja.");
		} else {
			erreurs.put("nin", "Ce champ est obligatoire.");
		}
		// Email
		if (request.getParameter("email") != null && request.getParameter("email").trim().length() != 0) {
			if (!request.getParameter("email").matches("^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]{2,4}$"))
				erreurs.put("email", "veillez entrer une email valide.");
			else if (dao.getClient(request.getParameter("email")) != null)
				erreurs.put("email", "un client avec cette email existe deja.");
		} else {
			erreurs.put("email", "Ce champ est obligatoire.");
		}
		// PASSWORD
		if (request.getParameter("password") == null || request.getParameter("password").trim().length() == 0) {
			erreurs.put("password", "Ce champ est obligatoire.");
		}
		// CONFPASS
		if (!request.getParameter("confPass").equals(request.getParameter("password")) && request.getParameter("password").trim().length() != 0 ){
			erreurs.put("confPass", "la confirmation n'est pas identique au mot de passe.");
		} 
		// VILLE
		if (request.getParameter("ville") == null || request.getParameter("ville").trim().length() == 0) {
			erreurs.put("ville", "Ce champ est obligatoire.");
		}
		// RUE
		if (request.getParameter("rue") == null || request.getParameter("rue").trim().length() == 0) {
			erreurs.put("rue", "Ce champ est obligatoire.");
		}
		// TELEPHONE
		if (request.getParameter("telephone") != null && request.getParameter("telephone").trim().length() != 0) {
			if (!request.getParameter("telephone").matches("^[234][0-9]{7}"))
				erreurs.put("telephone", "le num. de telephone commence par 2,3 ou 4 et contient 8 chiffres.");
			else if (dao.getClientTel(request.getParameter("telephone")) != null)
				erreurs.put("email", "un client avec ce numero de telephone existe deja.");
		} else {
			erreurs.put("telephone", "Ce champ est obligatoire.");
		}

		return erreurs;
	}

	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String saveClient(Map<String, String> erreurs, @RequestParam(value = "photo", required = false) MultipartFile photo,
			@RequestParam(value = "piece", required = false) MultipartFile piece, Model mod, HttpServletRequest request,
			@RequestParam(value = "url", required = false) String url) throws IOException, ParseException {

		erreurs = validate(request);

		// PIECE
		if (piece != null) {
			System.out.println("type piece : " + piece.getContentType());
			if (!piece.getContentType().equals("image/png") && !piece.getContentType().equals("image/jpeg"))
				erreurs.put("piece", "le format du fichier doit etre jpg ou png.");
		} else {
			erreurs.put("piece", "Ce champ est obligatoire.");
		}
		

		if (erreurs.isEmpty()) {

			Client client = new Client();
			client.setNom(request.getParameter("nom"));
			client.setPrenom(request.getParameter("prenom"));
			client.setNaissance(new SimpleDateFormat("yyyy/mm/dd").parse(request.getParameter("naissance")));
			client.setNin(request.getParameter("nin"));
			client.setMail(request.getParameter("email"));
			client.setPassword(request.getParameter("password"));

			Long id = dao.ajouter(client);

			String filePhoto = "client_" + id + (photo.getContentType().equals("image/png") ? ".png" : ".jpg");
			String filePiece = "piece_" + id + (piece.getContentType().equals("image/png") ? ".png" : ".jpg");

			File file = new File(IMG + "clients\\" + filePhoto);
			FileUtils.writeByteArrayToFile(file, photo.getBytes());
			file = new File(IMG + "pieces\\" + filePiece);
			FileUtils.writeByteArrayToFile(file, piece.getBytes());

			client.setPhoto(filePhoto);
			client.setPiece(filePiece);
			client.setRole("ROLE_CLIENT");
			client.setEnabled(true);

			dao.modifier(client);

			// adresse
			Adresse adresse = new Adresse();
			adresse.setVille(request.getParameter("ville"));
			adresse.setRue(request.getParameter("rue"));
			adresse.setTelephone(request.getParameter("telephone"));
			adresse.setNom(client.getNom());
			adresse.setPrenom(client.getPrenom());
			adresse.setDefaut(true);
			getClass();

			dao.ajouter(adresse, client.getIdClient());

			authenticateUserAndSetSession(client, request);
			if (url != null)
				return "redirect:/commander";
			return "redirect:/profile";
		} else {
			mod.addAttribute("erreurs", erreurs);
			return "signup";
		}
		
	}

	private void authenticateUserAndSetSession(Client client, HttpServletRequest request) {
		String username = client.getMail();
		String password = client.getPassword();
		UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(username, password);

		// generate session if one doesn't exist
		request.getSession();

		token.setDetails(new WebAuthenticationDetails(request));
		Authentication authenticatedUser = authenticationManager.authenticate(token);

		SecurityContextHolder.getContext().setAuthentication(authenticatedUser);
	}

	@RequestMapping(value = "/profile")
	public String profile(Model model) {
		
		Collection<? extends GrantedAuthority> roleList = SecurityContextHolder.getContext().getAuthentication()
				.getAuthorities();

		if (!roleList.contains(new SimpleGrantedAuthority("ROLE_CLIENT")))
			return "redirect:/login";

		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Client client = dao.getClient(userDetails.getUsername());

		// définir un format personnalisé(France)
		DateFormat format_fr = DateFormat.getDateInstance(DateFormat.FULL, Locale.FRENCH);

		String time = new Date().getHours() + ":" + new Date().getMinutes();

		model.addAttribute("client", client);
		model.addAttribute("date", format_fr.format(new Date()));
		model.addAttribute("time", time);
		List<Commande> commandes = dao.listeCommandeEnAttente(client.getIdClient());
		boolean livree[] = new boolean[commandes.size()];
		boolean confirmee[] = new boolean[commandes.size()];
		long diffJours[] = new long[commandes.size()];
		int i = 0;
		for (Commande commande : commandes) {
			long diff = new Date().getTime() - commande.dateLivraison().getTime();
			diffJours[i] = diff / (60 * 60 * 24 * 1000);
			System.out.println("diffJours : " + diffJours[i] + " " + (diffJours[i] < 3));
			confirmee[i] = false;
			if (diffJours[i] >= 1){
				commande.setLivre(true);
				if(diffJours[i] < 3)
					livree[i] = true;
				else if(commande.isEnAttente()){
					commande.setEnAttente(false);
					commande.setConfirme(true);
					confirmee[i] = true;
				}
				dao.modifier(commande);
			} else{
				livree[i] = false;
			}
			System.out.println("confirmee : " + confirmee[i] );
			i++;
		}

		model.addAttribute("commandes", commandes);
		model.addAttribute("livree", livree);
		model.addAttribute("confirmee", confirmee);
		model.addAttribute("panier", panier);
		model.addAttribute("defAdresse", dao.getDefaultAdress(client.getIdClient()));
		model.addAttribute("adresses", dao.listAdresses(client.getIdClient()));
		model.addAttribute("favoris", dao.listFavoris(client.getIdClient()));
		return "profile";
	}

	@RequestMapping(value = "/profile", method = RequestMethod.POST)
	public String editAdresse(Model model, Adresse adresse,
			@RequestParam(value = "modifier", required = false) String modifier,
			@RequestParam(value = "idAdresse", required = false) Long idAdresse,
			@RequestParam(value = "nom", required = false) String nom,
			@RequestParam(value = "prenom", required = false) String prenom,
			@RequestParam(value = "telephone", required = false) String telephone,
			@RequestParam(value = "ville", required = false) String ville,
			@RequestParam(value = "rue", required = false) String rue,
			@RequestParam(value = "defaut", required = false) Integer defaut) {

		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Client client = dao.getClient(userDetails.getUsername());

		if (modifier != null) {
			adresse = dao.getAdresse(idAdresse);
			adresse.setNom(nom);
			adresse.setPrenom(prenom);
			adresse.setTelephone(telephone);
			adresse.setVille(ville);
			adresse.setRue(rue);
			if (!adresse.isDefaut() && defaut == 1) {
				Adresse a = dao.getDefaultAdress(client.getIdClient());
				a.setDefaut(false);
				dao.modifier(a);
				adresse.setDefaut(true);
			}

			dao.modifier(adresse);

		}

		return "redirect:/profile";
	}

	@RequestMapping(value = "/profile/edit", method = RequestMethod.GET)
	public String edit(Model model) {

		Collection<? extends GrantedAuthority> roleList = SecurityContextHolder.getContext().getAuthentication()
				.getAuthorities();

		if (!roleList.contains(new SimpleGrantedAuthority("ROLE_CLIENT"))) {
			return "redirect:/login";
		}

		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Client client = dao.getClient(userDetails.getUsername());

		String dateNaissance = "19" + client.getNaissance().getYear() + "/" + (client.getNaissance().getMonth() + 1)
				+ "/" + (client.getNaissance().getDate());

		System.out.println(dateNaissance);

		model.addAttribute("command", client);
		model.addAttribute("dateNaissance", dateNaissance);
		return "editClient";
	}

	@RequestMapping(value = "/profile/edit", method = RequestMethod.POST)
	public String doEdit(Model model, Client command, @RequestParam(value = "oldpass", required = false) String passOld,
			@RequestParam(value = "newpass", required = false) String passNew,
			@RequestParam(value = "naissance", required = false) String naissance,
			@RequestParam(value = "confPass", required = false) String passConf) {

		Collection<? extends GrantedAuthority> roleList = SecurityContextHolder.getContext().getAuthentication()
				.getAuthorities();

		if (!roleList.contains(new SimpleGrantedAuthority("ROLE_CLIENT")))
			return "redirect:/login";

		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Client client = dao.getClient(userDetails.getUsername());

		if (passOld.isEmpty()) {
			model.addAttribute("passError", "veillez indiquer votere mot de passe");
			model.addAttribute("dateNaissance", naissance);
			model.addAttribute("command", command);
			return "editClient";
		}

		if (!passOld.equals(client.getPassword())) {
			model.addAttribute("passError", "mot de passe éroné");
			model.addAttribute("dateNaissance", naissance);
			model.addAttribute("command", command);
			return "editClient";
		}

		if (!passNew.equals(passConf) && !passNew.isEmpty()) {
			model.addAttribute("passError", "la confirmation n'est pas conforme");
			model.addAttribute("dateNaissance", naissance);
			model.addAttribute("command", command);
			return "editClient";
		}

		command.setPassword(passNew);

		client.setNom(command.getNom());
		client.setPrenom(command.getPrenom());
		client.setNaissance(command.getNaissance());
		client.setNin(command.getNin());
		client.setMail(command.getMail());
		client.setPassword(command.getPassword());
		dao.modifier(client);

		return "redirect:/profile";
	}

	@RequestMapping(value = "/adresse", method = RequestMethod.GET)
	public String adresse(HttpServletRequest request, Model model,
			@RequestParam(value = "adresse", required = false) Long idAdresse,
			@RequestParam(value = "add", required = false) String add,
			@RequestParam(value = "remove", required = false) String remove) {

		Collection<? extends GrantedAuthority> roleList = SecurityContextHolder.getContext().getAuthentication()
				.getAuthorities();

		if (!roleList.contains(new SimpleGrantedAuthority("ROLE_CLIENT")))
			return "redirect:/login";

		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Client client = dao.getClient(userDetails.getUsername());

		if (remove != null) {
			if (dao.getAdresse(idAdresse, client.getIdClient()) != null)
				dao.SupprimerAdresse(idAdresse);
		}

		return "redirect:" + request.getHeader("Referer");
	}

	@RequestMapping(value = "/favoris", method = RequestMethod.GET)
	public String addFavoris(HttpServletRequest request, Model model,
			@RequestParam(value = "produit", required = false) Long idProduit,
			@RequestParam(value = "add", required = false) String add,
			@RequestParam(value = "remove", required = false) String remove) {

		Collection<? extends GrantedAuthority> roleList = SecurityContextHolder.getContext().getAuthentication()
				.getAuthorities();

		if (!roleList.contains(new SimpleGrantedAuthority("ROLE_CLIENT")))
			return "redirect:/login";

		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Client client = dao.getClient(userDetails.getUsername());
		Favoris f;
		System.out.println("add: " + add);
		System.out.println("remove: " + remove);
		if (add != null) {
			if (dao.getFavoris(idProduit, client.getIdClient()) == null)
				dao.ajouter(new Favoris(), client.getIdClient(), idProduit);
		} else if (remove != null) {
			if ((f = dao.getFavoris(idProduit, client.getIdClient())) != null)
				dao.Supprimer(f.getIdFavoris());
		}

		return "redirect:" + request.getHeader("Referer");
	}

	@RequestMapping(value = "/livraison", method = RequestMethod.GET)
	public String livraison(Model model, @RequestParam(value = "commande", required = false) Long idCommande,
			@RequestParam(value = "confirmer", required = false) String confirmer) {

		Collection<? extends GrantedAuthority> roleList = SecurityContextHolder.getContext().getAuthentication()
				.getAuthorities();

		if (!roleList.contains(new SimpleGrantedAuthority("ROLE_CLIENT")))
			return "redirect:/login";

		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Client client = dao.getClient(userDetails.getUsername());

		if (confirmer != null) {
			Commande commande = dao.getCommande(idCommande, client.getIdClient());
			if (commande == null)
				return "redirect:/profile";
			commande.setLivre(true);
			dao.modifier(commande);
		}

		return "redirect:/profile";

	}

}