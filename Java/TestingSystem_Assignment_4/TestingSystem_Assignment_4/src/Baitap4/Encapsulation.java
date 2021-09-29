package Baitap4;
import Baitap4.Student;

public class Encapsulation {
	public void printStudent() {
		Student st1 = new Student("Khoa", "Hà Nội");
		st1.plusScore(3f);
		Student st2 = new Student("Vinh", "Hà Đông");
		st2.plusScore(5f);
		Student st3 = new Student("Hòa", "Hòa Bình");
		st3.plusScore(8f);
		System.out.println(st1);
		System.out.println(st2);
		System.out.println(st3);
		}

}
