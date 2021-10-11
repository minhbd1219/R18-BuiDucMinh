package Baitap4;

import java.util.Scanner;

public class Q1 {
	public static void main(String[] args) {
		String s1;
		Scanner scanner = new Scanner(System.in);
		System.out.println("Nhập chuỗi: ");
		s1 = scanner.nextLine();
		String[] words = s1.split(" ");
		System.out.println("Số kí tự: " + words.length);
		scanner.close();
	}

		private static void Q2() {
			Scanner sc = new Scanner(System.in);
			System.out.println("-----------Question 2 ------------");
			Scanner sc1 = new Scanner(System.in);
			System.out.println("Nhập vào chuỗi 1: ");
			String s1 = sc1.next();
			System.out.println("Nhập vào chuỗi 2: ");
			String s2 = sc1.next();
			System.out.println("Kết quả sau khi nối chuỗi: " + s1 + " " + s2);
			sc1.close();
	}
	
}
