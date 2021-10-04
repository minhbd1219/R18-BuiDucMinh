package ex1_Abstraction;

public class News implements INews {
	private int id;
	private String title;
	private String publishDate;
	private String author;
	private String content;
	private float averageRate;
	private int[] rate;
	public static int COUNT = 0;
	
	public News(String title, String publishDate, String author, String 
	content, int[] rate) {
	COUNT++;
	this.id = COUNT;
	this.title = title;
	this.publishDate = publishDate;
	this.author = author;
	this.content = content;
	this.averageRate = averageRate;
	this.rate = rate;
	}
	
	// Getters & Setters //
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(String publishDate) {
		this.publishDate = publishDate;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Float getAverageRate() {
		return averageRate;
	}
	
	// Methods //
	@Override
	public void display() {
		System.out.println("Titles = " + title);
		System.out.println("PublishDate = " + publishDate);
		System.out.println("Author = " + author );
	}

	@Override
	public float calculate() {
		averageRate = (float) ((rate[0]+rate[1]+rate[2])/3);
		return averageRate;
	}

	
}
