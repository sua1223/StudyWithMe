package beans.bean;

public class CommentDTO {
	private int id;
	private int post_num;
	private String text;
	private String user;
	private String date;
	
	public CommentDTO() {}

	public CommentDTO(int id, int post_num, String text, String user, String date) {
		this.id = id;
		this.post_num = post_num;
		this.text = text;
		this.user = user;
		this.date = date;
	}
	
	//ID
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}

	//POST_NUM
	public int getPost_num() {
		return post_num;
	}
	
	public void setPost_num(int post_num) {
		this.post_num = post_num;
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
