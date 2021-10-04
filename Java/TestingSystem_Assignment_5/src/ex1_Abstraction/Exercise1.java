package ex1_Abstraction;

import java.util.ArrayList;
import java.util.Scanner;
import ex1_Abstraction.News;

public class Exercise1 {
	private Scanner sc;
	private ArrayList<News>listNews;
	
	public Exercise1() {
		sc = new Scanner(System.in);
		listNews = new ArrayList<News>();
	}
	
	public void ex1() {
		Menu();
	}
	
	private void Menu() {
		while (true) {
			System.out.println("================================");
			System.out.println("1. Insert news. ");
			System.out.println("2. View list news. ");
			System.out.println("3. Average rate . ");
			System.out.println("4. Exit. ");
			System.out.println("================================");
			
		int menuOption = sc.nextInt();
		switch (menuOption) {
		
		case 1:
			System.out.println("Insert Title: ");
			String title = sc.next();
			System.out.println("Insert PublishDate: ");
			String publishDate = sc.next();
			System.out.println("Insert Author: ");
			String author = sc.next();
			System.out.println("Insert Content: ");
			String content = sc.next();

			System.out.println("Rate 1: ");
			int rate1 = sc.nextInt();
			System.out.println("Rate 2: ");
			int rate2 = sc.nextInt();
			System.out.println("Rate 3:");
			int rate3 = sc.nextInt();
			int[] rates = { rate1, rate2, rate3 };
			
			News news = new News(title, publishDate, author, 
			content, rates);
			listNews.add(news);
			
			break;
			
		case 2:
			for (News news1 : listNews) {
				news1.display();
			}
			break;
		
		case 3:
			System.out.println("Averange Rate: ");
			for (News news1 : listNews) {
			System.out.println("Title: " + news1.getTitle() 
			+ " RateAVG: " + news1.calculate());
			}
			break;
			
		case 4:
			return;
			
		default:
			System.out.println("Please select from 1 to 4");
			break;
		}
	}
}
	
	
	
	
	
}
