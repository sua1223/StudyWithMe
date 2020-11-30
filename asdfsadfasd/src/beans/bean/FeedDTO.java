package beans.bean;

public class FeedDTO {
	private String num;
	private String id;
	private String pic;
	private String text;
	private String date;
	
	public FeedDTO() {}
	public FeedDTO(String num, String id, String pic, String text, String date) {
		this.num = num;
		this.id = id;
		this.pic = pic;
		this.text = text;
		this.date = date;
	}
	
	//NUM
	public String getNum() {
		return num;
	}
	
	public void setNum(String num) {
		this.num = num;
	}
	
	
	//SUBJECT
	public String getId() {
		return id;
	}
	
	public void setid(String id) {
		this.id = id;
	}
	
	//TITLE
	public String getPic() {
		return pic;
	}
	
	public void setPic(String pic) {
		this.pic = pic;
	}
	
	//TEXT
	public String getText() {
		return text;
	}
	
	public void setText(String text) {
		this.text = text;
	}
	
	//DATE
	public String getDate() {
		return date;
	}
	
	public void setDate(String date) {
		this.date = date;
	}
}
