package Baitap4;

import java.util.Scanner;

public class Q4 {

	public static void main(String[] args) {
		String name;
		Scanner scanner = new Scanner(System.in);
		System.out.println("Insert Name: ");
		name = scanner.nextLine();
		name = name.toUpperCase();
		for (int i = 0; i < name.length(); i++) {
		System.out.println("Words number " + i + " là: " + name.charAt(i));
		}
		scanner.close();
	}

}
