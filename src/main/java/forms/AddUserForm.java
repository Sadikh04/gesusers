package forms;

import java.util.HashMap;
import java.util.Map;
import dao.UtilisateurDao;
import gesusers.Utilisateur;
import jakarta.servlet.http.HttpServletRequest;

public class AddUserForm {
	
	
	private static final String CHAMP_NOM        ="nom";
	private static final String CHAMP_PRENOM     ="prenom";
	private static final String CHAMP_LOGIN      ="login";
	private static final String CHAMP_PASSWORD   ="password";
	private static final String CHAMP_PASSWORDBIS="passwordBis";
	
	private Map<String, String> erreurs;
	private String              statusMessage;
	private boolean             status;
	private HttpServletRequest  request;
	private Utilisateur         utilisateur;
	
	public AddUserForm(HttpServletRequest request)
	{
		this.request = request;
		this.erreurs = new HashMap<String, String>();
	}
	public boolean ajouter()
	{
		String nom       = this.getParameter(CHAMP_NOM);
		String prenom    = this.getParameter(CHAMP_PRENOM);
		String login     = this.getParameter(CHAMP_LOGIN);
		String password  = this.getParameter(CHAMP_PASSWORD);		
		this.utilisateur = new Utilisateur(nom, prenom, login, password);
		
		this.statusMessage = " Echec de l'ajout !";
		this.status        = false;
		
		this.validerChamps(CHAMP_NOM, CHAMP_PRENOM, CHAMP_LOGIN, CHAMP_PASSWORD, CHAMP_PASSWORDBIS);
		this.validePasswords(); 
		
		if (this.erreurs.isEmpty())
			{
				if(UtilisateurDao.ajouter(utilisateur)) 
				{
					this.statusMessage = " Ajout effectué avec succés !";
					this.status        = true;
				}
			}
		return this.status; 
	}
	
	private String getParameter(String parametre)
	{
		String valeur = this.request.getParameter(parametre);
			
		if (valeur == null || valeur.isBlank())
		{
			return null;
		}
		return valeur.trim();
	}
	
	private void validerChamps(String... champs)
	{
		for (String champ : champs)
		{
			if (this.getParameter(champ) == null)
			{
				this.erreurs.put(champ, "vous devez renseigner ce champ !");
			}
		}
	}
	
	private void validePasswords()
	{
		String password    = this.getParameter(CHAMP_PASSWORD);
		String passwordBis = this.getParameter(CHAMP_PASSWORDBIS);
			
		if (password != null && !password.equals(passwordBis))
		{
			this.erreurs.put(CHAMP_PASSWORD, " Les mots de passe ne sont pas conformes !");
		}
	}
	
	public Map<String, String> getErreurs() 
	{
		return erreurs;
	}
	
	public String getStatusMessage()
	{
		return statusMessage;
	}
	
	public boolean getStatus()
	{
		return status;
	}
	
	public Utilisateur getUtilisateur() 
	{
		return utilisateur;
	}
}
