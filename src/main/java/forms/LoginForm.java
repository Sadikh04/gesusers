package forms;

import dao.UtilisateurDao;
import gesusers.Utilisateur;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.math.BigInteger;
import java.nio.charset.StandardCharsets;

public class LoginForm {
	
	
	private static final String CHAMP_LOGIN    ="login";
	private static final String CHAMP_PASSWORD ="password";
	
	private String             statusMessage;
	private boolean            status;
	private HttpServletRequest request;
	private String             login;
	
	public LoginForm(HttpServletRequest request)
	{
		this.request       = request;
		this.setStatus(false);
		this.statusMessage = " Echec de la connexion : Login ou mot de passe incorrecte ";
	}
	
	public boolean login()
	{
		String login    = this.getParameter(CHAMP_LOGIN);
		String password = this.getParameter(CHAMP_PASSWORD);
		
		// Hacher le mot de passe fourni par l'utilisateur
        String      hashedPassword = hashPassword(password);
		Utilisateur loggedUser     = UtilisateurDao.get(login);
		
		if (loggedUser != null && loggedUser.getPassword().equals(hashedPassword))
		{
			HttpSession session = request.getSession();
			session.setAttribute("loggedUser", loggedUser);
			
			return true;		
		}
		return false;
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
	
	public void logout()
	{
		HttpSession session = request.getSession();
		session.invalidate();
		
	}
	
	public String getStatusMessage() 
	{
		return statusMessage;
	}

	public boolean isStatus() 
	{
		return status;
	}

	public void setStatus(boolean status) 
	{
		this.status = status;
	}

	public String getLogin() 
	{
		return login;
	}
	
	//Fonction de hashage du mot de passe
	public String hashPassword(String password) 
	{
        try 
        {
            MessageDigest md = MessageDigest.getInstance("SHA-1");
            byte[] messageDigest = md.digest(password.getBytes(StandardCharsets.UTF_8));
            BigInteger no = new BigInteger(1, messageDigest);
            String hashedPassword = no.toString(16);
            
            while (hashedPassword.length() < 40) 
            {
                hashedPassword = "0" + hashedPassword;
            }
            
            return hashedPassword;
        } 
        catch (NoSuchAlgorithmException e) 
        {
            throw new RuntimeException(e);
        }
    }	
}
