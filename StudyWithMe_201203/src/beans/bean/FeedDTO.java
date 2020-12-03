package beans.bean;

public class FeedDTO {
	private int num;
	private String id;
	private String pic;
	private String text;
	private String upload_date;
	
	public FeedDTO() {}
	public FeedDTO(int num, String id, String pic, String text, String upload_date) {
		this.num = num;
		this.id = id;
		this.pic = pic;
		this.text = text;
		this.upload_date = upload_date;
	}
	
	//NUM
	public int getNum() {
		return num;
	}
	
	public void setNum(int num) {
		this.num = num;
	}
	
	
	//SUBJECT
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
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
	public String getUpload_date() {
		return upload_date;
	}
	
	public void setUpload_date(String upload_date) {
		this.upload_date = upload_date;
	}
}
