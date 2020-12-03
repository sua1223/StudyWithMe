package beans.bean;

public class BoardDTO {
	private int num;
	private String head;
	private String subject;
	private String title;
	private String text;
	private String user;
	private String date;
	
	public BoardDTO() {}
	public BoardDTO(int num, String head, String subject, String title, String text, String user, String date) {
		this.num = num;
		this.head = head;
		this.subject = subject;
		this.title = title;
		this.text = text;
		this.user = user;
		this.date = date;
	}
	
	//NUM
	public int getNum() {
		return num;
	}
	
	public void setNum(int num) {
		this.num = num;
	}
	
	//HEAD
	public String getHead() {
		return head;
	}
	
	public void setHead(String head) {
		this.head = head;
	}
	
	//SUBJECT
	public String getSubject() {
		return subject;
	}
	
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	//TITLE
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	//TEXT
	public String getText() {
		return text;
	}
	
	public void setText(String text) {
		this.text = text;
	}
	
	//USER
	public String getUser() {
		return user;
	}
	
	public void setUser(String user) {
		this.user = user;
	}
	
	//DATE
	public String getDate() {
		return date;
	}
	
	public void setDate(String date) {
		this.date = date;
	}
}
