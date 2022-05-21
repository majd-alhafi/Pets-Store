package classes;
public class Pet {
	private int id;
	private String name;
	private String description;
	private String type;
	private float age;
	private float price;
	private String photo;
	private String video;
	
	public Pet(int id,String name, String description,String type, float age, float price, String photo, String video) {
		this.id = id;
		this.name = name;
		this.description = description;
		this.type = type;
		this.age = age;
		this.price = price;
		this.photo = photo;
		this.video = video;
	}
	public int getID() {
		return id;
	}
	public String getName() {
		return name;
	}
	public String getDescription() {
		return description;
	}
	public String getType() {
		return type;
	}
	public float getAge() {
		return age;
	}
	public float getPrice() {
		return price;
	}
	public String getPhoto() {
		return photo;
	}
	public String getVideo() {
		return video;
	}
	
	
}
