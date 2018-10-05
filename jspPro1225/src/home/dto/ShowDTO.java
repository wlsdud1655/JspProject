package home.dto;

public class ShowDTO {
	private String name;
	private int price;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "ShowDTO [name=" + name + ", price=" + price + "]";
	}
	public ShowDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ShowDTO(String name, int price) {
		super();
		this.name = name;
		this.price = price;
	}
}
