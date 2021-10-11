package Baitap4;
import java.util.Scanner;

public class Q3 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		String name;
		System.out.println("Insert Name: ");
		name = scanner.nextLine();
		String firstCharacter = name.substring(0, 1).toUpperCase();
		String leftCharacter = name.substring(1);
		System.out.println("char at:"+ name.charAt(1));
		name = firstCharacter + leftCharacter;
		System.out.println(name);
		scanner.close();
	}

}
