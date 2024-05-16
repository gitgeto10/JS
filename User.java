package gestion.mecanique.bean;

/**
 * User.java
 * This is a model class represents a User entity
 * @author Ramesh Fadatare
 *
 */
public class User {
	protected String code;
	protected String nom;
	protected String prenom;
	protected String password;
	protected int type;

	public User() {
	}

	public User(String nom, String prenom, String password, int type) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.password = password;
                this.type = type;

	}

	public User(String code, String nom, String prenom, String password, int type) {
		super();
		this.code = code;
		this.nom = nom;
		this.prenom = prenom;
		this.password = password;
                this.type = type;
}

    public String getCode() {
        return code;
    }

    public String getNom() {
        return nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public String getPassword() {
        return password;
    }

    public int getType() {
        return type;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setType(int type) {
        this.type = type;
    }
    
}