package classes;

public class User {
	private String name;
	private String userName;
	private String password;
	private String email;
	private String imageName;
	public User(String name, String userName, String password, String email, String imageName) {
		this.name = name;
		this.userName = userName;
		this.password = password;
		this.email = email;
		this.imageName = imageName;
	}
	public String getName() {
		return name;
	}
	public String getUserName() {
		return userName;
	}
	public String getPassword() {
		return password;
	}
	public String getEmail() {
		return email;
	}
	public String getImageName() {
		return imageName;
	}
	
	
}
