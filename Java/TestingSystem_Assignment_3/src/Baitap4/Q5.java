package Baitap4;
import java.util.Scanner;
public class Q5 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.println("Insert FamilyName: ");
		String firstName = scanner.nextLine();
		System.out.println("Insert Name: ");
		String lastName = scanner.nextLine();
		System.out.println("FullName: " + firstName.concat(lastName));
		scanner.close();

	}
}
