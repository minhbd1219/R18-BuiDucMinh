package Baitap5;

public class Staff {
	
	private String name;
	private int age;
	private Gender gender;
	private String address;
	public enum Gender {
	MALE, FEMALE
	}
	
	public Staff(String name, int age, Gender gender, String address) {
	this.name = name;
	this.age = age;
	this.gender = gender;
	this.address = address;
	}
	public String getName() {
	return name;
	}
	
	@Override
	public String toString() {
	return "Staff [name=" + name + ", age=" + age + ", gender=" + 
	gender + ", address=" + address + "]";
	}
}

