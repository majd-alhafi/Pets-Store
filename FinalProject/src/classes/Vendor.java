package classes;

public class Vendor {
	private String name;
	private String phone;
	private String address;
	private float rate;
	private String photo;
	
	public Vendor(String name, String phone, String address, float rate, String photo) {
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.rate = rate;
		this.photo = photo;
	}

	public String getName() {
		return name;
	}

	public String getPhone() {
		return phone;
	}

	public String getAddress() {
		return address;
	}

	public float getRate() {
		return rate;
	}

	public String getPhoto() {
		return photo;
	}
	
	

}
